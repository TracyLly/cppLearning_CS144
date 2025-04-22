#ifndef SPONGE_LIBSPONGE_STREAM_REASSEMBLER_HH
#define SPONGE_LIBSPONGE_STREAM_REASSEMBLER_HH

#include "byte_stream.hh"

#include <cstdint>
#include <string>
#include <vector>
#include <list>
#include <utility> 

//! \brief A class that assembles a series of excerpts from a byte stream (possibly out of order,
//! possibly overlapping) into an in-order byte stream.
/**
 * Buffer数据结构, 用来缓存已到达, 但没有被push的部分, 
 * 每个部分为(string, index), 利用list存储, 按照index递增的顺序存储。
 */
class Buffer {
  private:
    std::list<std::pair<std::string, uint64_t>> buf = {};
    size_t size = 0;
  public:
    // 获得缓存大小
    size_t get_size() const;
    // 插入
    void insert(const std::string &data, const uint64_t index);
    // 合并list中重叠部分
    void merge();
    // 返回index最小的元素
    std::pair<std::string, uint64_t> front();
    // 弹出元素, 如果flag为true, 则更新大小
    void pop(bool flag);
    // 判断buffer是否为空
    bool is_empty();
    // 打印
    void print_buffer();
};

class StreamReassembler {
  private:
    // Your code here -- add private members as necessary.
    Buffer buf;
    // 是否为eof
    bool eof_flag = false;
    // 下一个被push的字符索引
    uint64_t _index = 0;
    // 最后一个被push的字符
    std::string last_str = "";
    ByteStream _output;  //!< The reassembled in-order byte stream
    size_t _capacity;    //!< The maximum number of bytes

  public:
    //! \brief Construct a `StreamReassembler` that will store up to `capacity` bytes.
    //! \note This capacity limits both the bytes that have been reassembled,
    //! and those that have not yet been reassembled.
    StreamReassembler(const size_t capacity);

    //! \brief Receives a substring and writes any newly contiguous bytes into the stream.
    //!
    //! If accepting all the data would overflow the `capacity` of this
    //! `StreamReassembler`, then only the part of the data that fits will be
    //! accepted. If the substring is only partially accepted, then the `eof`
    //! will be disregarded.
    //!
    //! \param data the string being added
    //! \param index the index of the first byte in `data`
    //! \param eof whether or not this segment ends with the end of the stream
    void push_substring(const std::string &data, const uint64_t index, const bool eof);

    bool push_substring(const std::string &data, const uint64_t index);

    //! \name Access the reassembled byte stream
    //!@{
    const ByteStream &stream_out() const { return _output; }
    ByteStream &stream_out() { return _output; }
    //!@}

    Buffer &buffer_out() { return buf; }

    //! The number of bytes in the substrings stored but not yet reassembled
    //!
    //! \note If the byte at a particular index has been submitted twice, it
    //! should only be counted once for the purpose of this function.
    // 缓存的字符串数量
    size_t unassembled_bytes() const;

    //! \brief Is the internal state empty (other than the output stream)?
    //! \returns `true` if no substrings are waiting to be assembled
    bool empty() const;

    int get_index() { return _index; };
};

#endif  // SPONGE_LIBSPONGE_STREAM_REASSEMBLER_HH