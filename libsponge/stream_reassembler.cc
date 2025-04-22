#include "stream_reassembler.hh"

#include <iostream>
// Dummy implementation of a stream reassembler.

// For Lab 1, please replace with a real implementation that passes the
// automated checks run by `make check_lab1`.

// You will need to add private members to the class declaration in `stream_reassembler.hh`

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

// s1, s2有重叠, 则将其拼接, 存储至str, l为公共长度
static void get_inter(int &l,
                      const int l1,
                      const int l2,
                      const std::string &s1,
                      const std::string &s2,
                      std::string &str) {
    // 查看子串是否有重叠
    int len = min(l1, l2);
    for (l = len; l >= 1; l--) {
        int i = l1 - l;
        int j;
        // 比较子串是否相等
        for (j = 0; j < l; i++, j++) {
            if (s1[i] != s2[j]) {
                break;
            }
        }

        // j = l表示没有重叠
        if (j == l) {
            break;
        }
    }

    str = s1 + s2.substr(l2 - l);
}

StreamReassembler::StreamReassembler(const size_t capacity) : buf(), _output(capacity), _capacity(capacity) {}

//! \details This function accepts a substring (aka a segment) of bytes,
//! possibly out-of-order, from the logical stream, and assembles any newly
//! contiguous substrings and writes them into the output stream in order.
// push字符串, 要求为index <= _index < index + data.size(), 此处不考虑缓存的问题
bool StreamReassembler::push_substring(const std::string &data, const uint64_t index) {
    // 有重叠
    int l1 = last_str.size();
    int l2 = data.size();
    // 忽略空字符
    if (l2 == 0) {
        return false;
    }
    // 新数据和旧数据没有重合
    if (index > _index) {
        return false;
    }
    // 新数据包含在之前的数据中
    if (_index >= index + l2) {
        return false;
    }
    // 特殊情况, 第一次insert或者相邻
    if ((l1 == 0) || (_index == index)) {
        // 拼接
        last_str += data;
        _index += l2;
        std::string new_data = data;
        _output.write(new_data);
        return true;
    }

    int l;
    // 一般情形, 此时一定有重叠
    // ____
    //   _____
    // 找到重叠位置
    std::string res_data;
    get_inter(l, l1, l2, last_str, data, res_data);
    // 重叠的后续部分
    std::string new_data = data.substr(l, l2 - l);
    // 更新last_str和_index
    last_str += new_data;
    _index += l2 - l;
    // push
    _output.write(new_data);

    return true;
}

// push字符串, 此处考虑缓存的问题
void StreamReassembler::push_substring(const string &data, const size_t index, const bool eof) {
    if (_index >= index) {
        // 如果有交集, 则push
        // ____
        //   _____
        push_substring(data, index);
    } else {
        // 如果没有交集, 则缓存到buffer中
        // ____
        //      _____
        buf.insert(data, index);
        buf.merge();
    }

    // 此时buf单调递增, 没有交集
    while (!buf.is_empty()) {
        auto pair = buf.front();
        std::string data1 = pair.first;
        uint64_t index1 = pair.second;
        // 还有数据未到达
        // ____
        //      _____
        if (index1 > _index) {
            break;
        }
        // 否则push string
        push_substring(data1, index1);
        // 弹出字符, 并更新大小
        buf.pop(true);
    }

    // 记录eof是否到达
    if (eof) {
        eof_flag = true;
    }
    // eof并且没有待处理, 则结束
    if (eof_flag && empty()) {
        _output.end_input();
    }
}

// 缓存的字符串数量
size_t StreamReassembler::unassembled_bytes() const { return buf.get_size(); }

// 缓存是否为空
bool StreamReassembler::empty() const { return unassembled_bytes() == 0; }

// Buffer
// 获得buffer的大小
size_t Buffer::get_size() const { return size; }

// 插入
void Buffer::insert(const std::string &data, const uint64_t index) {
    // 数据为空则直接返回
    if (data.size() == 0) {
        return;
    }

    if (buf.size() == 0) {
        // buf为空则直接插入
        buf.push_back(std::make_pair(data, index));
        size += data.size();
        return;
    } else {
        // 否则找到第一个it->second >= index的位置
        auto it = buf.begin();
        for (; it != buf.end(); it++) {
            if (it->second >= index) {
                break;
            }
        }

        if ((it == buf.end()) || (it->second > index)) {
            /**
             * 如果不存在, 则直接插入即可, 此时it->second < index;
             * 如果it->second > index, 则直接插入, 这种情况对应于有间隔;
             */
            buf.insert(it, std::make_pair(data, index));
            size += data.size();
            return;
        } else {
            // 如果相等则比较大小, 保留长度较大的部分
            int d1 = data.size();
            int d2 = (it->first).size();
            if (d1 > d2) {
                size -= d2;
                // 先删除后插入
                auto it1 = it;
                it1++;
                buf.erase(it);
                buf.insert(it1, std::make_pair(data, index));
                // 后插入
                size += d1;
            }
        }
    }
}

// 返回index最小的元素
std::pair<std::string, uint64_t> Buffer::front() { return *(buf.begin()); }

// 弹出元素, 如果flag为true, 则更新大小
void Buffer::pop(bool flag) {
    auto it = buf.begin();
    if (flag) {
        size -= (it->first).size();
    }
    buf.pop_front();
}

// 判断buffer是否为空
bool Buffer::is_empty() { return size == 0; }

// 合并list中重叠部分
void Buffer::merge() {
    auto it1 = buf.begin();
    auto it2 = it1;
    it2++;
    // buf大小
    int m = buf.size();

    while (it1 != buf.end()) {
        it2 = it1;
        it2++;
        // bool flag = false;
        while (it2 != buf.end()) {
            auto str1 = it1->first;
            auto str2 = it2->first;
            uint64_t l1 = str1.size();
            uint64_t l2 = str2.size();
            // 起始位置
            uint64_t s1 = it1->second;
            uint64_t s2 = it2->second;
            // 结束位置(不包括)
            uint64_t e1 = s1 + l1;
            uint64_t e2 = s2 + l2;
            // [s1, e1), [s2, e2)
            // 无交集
            if (s2 >= e1) {
                it1 = it2;
                break;
            }
            if (e2 <= e1) {
                // [s2, e2)在[s1, e1)内部
                size -= l2;
                auto it = it2;
                it2++;
                buf.erase(it);
                // break;
            } else {
                // 有交集
                // s1, s2, e1, e2
                // s1 ____ e1
                //    s2 _____ e2
                int l = e2 - e1;
                int s = l2 - l;
                // 更新字符串
                it1->first += str2.substr(s, l);
                // 更新大小
                size -= s;
                auto it = it2;
                it2++;
                buf.erase(it);
                // break;
            }
        }
        // 判断长度是否变化
        int m1 = buf.size();
        // 如果长度没有变化, 则更新it1
        if (m == m1) {
            it1 = it2;
        }
        m = m1;
    }
}

// 打印
void Buffer::print_buffer() {
    cout << "Print buffer start" << endl;
    for (auto it = buf.begin(); it != buf.end(); it++) {
        cout << it->second << " " << it->second + it->first.size() << endl;
    }
    cout << "Print buffer end" << endl;
}