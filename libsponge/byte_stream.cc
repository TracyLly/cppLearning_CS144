#include "byte_stream.hh"

#include <algorithm>
#include <iterator>
#include <stdexcept>

// Dummy implementation of a flow-controlled in-memory byte stream.

// For Lab 0, please replace with a real implementation that passes the
// automated checks run by `make check_lab0`.

// You will need to add private members to the class declaration in `byte_stream.hh`

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

ByteStream::ByteStream(const size_t capacity) : size(capacity) {

}

// write字符, 最多缓存至capacity长度
size_t ByteStream::write(const string &data) {
    int l1 = size - buf.size();
    int l2 = data.size();
    int l = min(l2, l1);
    int i;
    for (i = 0; i < l; i++) {
        buf.push_back(data[i]);
        // 更新计数
        write_cnt++;
    }

    return i;
}

//! \param[in] len bytes will be copied from the output side of the buffer
// 返回buf中前min(len, size)个字符
string ByteStream::peek_output(const size_t len) const {
    string res;
    int l1 = buf.size();
    int l2 = len;
    int l = min(l1, l2);
    int i = 0;
    for (auto it = buf.begin(); (it != buf.end()) && (i < l); i++, it++) {
        res.push_back(*it);
    }

    return res;
}

//! \param[in] len bytes will be removed from the output side of the buffer
// 弹出buf中前min(len, size)个字符
void ByteStream::pop_output(const size_t len) {
    int l1 = buf.size();
    int l2 = len;
    int l = min(l1, l2);
    for (int i = 0; i < l; i++) {
        buf.pop_front();
        // 更新计数
        read_cnt++;
    }
}

void ByteStream::end_input() { is_end = true; }

bool ByteStream::input_ended() const { return is_end; }

size_t ByteStream::buffer_size() const { return buf.size(); }

bool ByteStream::buffer_empty() const { return buffer_size() == 0; }

// 判断条件
// buffer为空, 并且输入结束
bool ByteStream::eof() const { return buffer_empty() && input_ended(); }

size_t ByteStream::bytes_written() const { return write_cnt; }

size_t ByteStream::bytes_read() const { return read_cnt; }

size_t ByteStream::remaining_capacity() const { return size - buf.size(); }