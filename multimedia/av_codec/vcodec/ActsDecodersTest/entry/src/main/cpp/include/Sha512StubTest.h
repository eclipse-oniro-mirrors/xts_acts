/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef SHA512_STUB_H
#define SHA512_STUB_H

#include <cstdint>
#include <cstring>

// 声明安全函数
extern "C" {
int SecureMemset(void *dest, size_t destMax, int c, size_t count);
int SecureMemcpy(void *dest, size_t destMax, const void *src, size_t count);
}

#define SHA512_DIGEST_LENGTH 64

// SHA512 算法常量
constexpr int SHA512_BLOCK_SIZE = 128;           // SHA512 块大小(字节)
constexpr int SHA512_STATE_SIZE = 8;             // 状态数组大小
constexpr int SHA512_WORD_COUNT = 80;            // 消息调度数组大小
constexpr int SHA512_INITIAL_ROUNDS = 16;        // 初始轮数
constexpr int SHA512_PADDING_THRESHOLD = 112;    // 填充阈值
constexpr int SHA512_LENGTH_FIELD_OFFSET = 112;  // 长度字段偏移
constexpr int SHA512_LENGTH_FIELD_SIZE = 120;    // 长度字段大小
constexpr int SHA512_BYTES_PER_WORD = 8;         // 每个字的字节数
constexpr int SHA512_BUFFER_MASK = 0x7F;         // 缓冲区掩码

// 位移量常量
constexpr int SHIFT_56 = 56;
constexpr int SHIFT_48 = 48;
constexpr int SHIFT_40 = 40;
constexpr int SHIFT_32 = 32;
constexpr int SHIFT_24 = 24;
constexpr int SHIFT_16 = 16;
constexpr int SHIFT_8 = 8;

// 数组索引常量
constexpr int INDEX_0 = 0;
constexpr int INDEX_1 = 1;
constexpr int INDEX_2 = 2;
constexpr int INDEX_3 = 3;
constexpr int INDEX_4 = 4;
constexpr int INDEX_5 = 5;
constexpr int INDEX_6 = 6;
constexpr int INDEX_7 = 7;

// 消息调度偏移量
constexpr int MSG_OFFSET_2 = 2;
constexpr int MSG_OFFSET_7 = 7;
constexpr int MSG_OFFSET_15 = 15;
constexpr int MSG_OFFSET_16 = 16;

// SHA512 旋转位数常量
constexpr int ROTATE_BITS_64 = 64;
constexpr int ROTATE_SIGMA0_28 = 28;
constexpr int ROTATE_SIGMA0_34 = 34;
constexpr int ROTATE_SIGMA0_39 = 39;
constexpr int ROTATE_SIGMA1_14 = 14;
constexpr int ROTATE_SIGMA1_18 = 18;
constexpr int ROTATE_SIGMA1_41 = 41;
constexpr int ROTATE_SIGMA_SMALL0_1 = 1;
constexpr int ROTATE_SIGMA_SMALL0_8 = 8;
constexpr int SHIFT_SIGMA_SMALL0_7 = 7;
constexpr int ROTATE_SIGMA_SMALL1_19 = 19;
constexpr int ROTATE_SIGMA_SMALL1_61 = 61;
constexpr int SHIFT_SIGMA_SMALL1_6 = 6;

// 十六进制转换常量
constexpr int HEX_BITS_PER_CHAR = 4;        // 每个十六进制字符4位
constexpr int HEX_DECIMAL_OFFSET = 10;      // 十六进制字母偏移量

// 位长度计算常量
constexpr int BITS_PER_BYTE = 3;            // 字节转位的移位量(乘8)
constexpr int HIGH_BITS_SHIFT = 61;         // 高位提取移位量

// SHA512 工作变量结构
struct Sha512WorkVars {
    uint64_t a;
    uint64_t b;
    uint64_t c;
    uint64_t d;
    uint64_t e;
    uint64_t f;
    uint64_t g;
    uint64_t h;
};

// SHA512 上下文结构
typedef struct {
    uint64_t state[SHA512_STATE_SIZE];      // 当前哈希状态
    uint64_t count[INDEX_2];                // 位计数器
    uint8_t buffer[SHA512_BLOCK_SIZE];      // 输入缓冲区
} SHA512_CTX;

// 转换单个十六进制字符
inline constexpr int HexCharToInt(char c)
{
    if (c >= '0' && c <= '9') {
        return (c - '0');
    } else if (c >= 'a' && c <= 'f') {
        return (c - 'a' + HEX_DECIMAL_OFFSET);
    } else if (c >= 'A' && c <= 'F') {
        return (c - 'A' + HEX_DECIMAL_OFFSET);
    }
    return 0;
}

// 十六进制字符串转 uint64_t
inline constexpr uint64_t HexToUint64(const char* hex)
{
    uint64_t result = 0;
    for (int i = 0; hex[i] != '\0'; ++i) {
        result <<= HEX_BITS_PER_CHAR;
        result |= HexCharToInt(hex[i]);
    }
    return result;
}

// SHA512 常量 K (FIPS 180-4 标准)
constexpr uint64_t K512[SHA512_WORD_COUNT] = {
    0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL, 0xe9b5dba58189dbbcULL,
    0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL, 0x923f82a4af194f9bULL,
    HexToUint64("ab1c5ed5da6d" "8118"), HexToUint64("d" "807aa98a3030242"),
    0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
    0x72be5d74f27b896fULL, 0x80deb1fe3b1696b1ULL, 0x9bdc06a725c71235ULL, 0xc19bf174cf692694ULL,
    0xe49b69c19ef14ad2ULL, 0xefbe4786384f25e3ULL, 0x0fc19dc68b8cd5b5ULL, 0x240ca1cc77ac9c65ULL,
    0x2de92c6f592b0275ULL, 0x4a7484aa6ea6e483ULL, 0x5cb0a9dcbd41fbd4ULL, 0x76f988da831153b5ULL,
    0x983e5152ee66dfabULL, 0xa831c66d2db43210ULL, 0xb00327c898fb213fULL, 0xbf597fc7beef0ee4ULL,
    0xc6e00bf33da88fc2ULL, 0xd5a79147930aa725ULL, 0x06ca6351e003826fULL, 0x142929670a0e6e70ULL,
    0x27b70a8546d22ffcULL, 0x2e1b21385c26c926ULL, 0x4d2c6dfc5ac42aedULL, 0x53380d139d95b3dfULL,
    0x650a73548baf63deULL, 0x766a0abb3c77b2a8ULL, 0x81c2c92e47edaee6ULL, 0x92722c851482353bULL,
    0xa2bfe8a14cf10364ULL, 0xa81a664bbc423001ULL, 0xc24b8b70d0f89791ULL, 0xc76c51a30654be30ULL,
    HexToUint64("d" "192e819d6ef5218"), HexToUint64("d69906245565a910"),
    0xf40e35855771202aULL, 0x106aa07032bbd1b8ULL,
    HexToUint64("19a4c116b8d2d0c8"), 0x1e376c085141ab53ULL, 0x2748774cdf8eeb99ULL, HexToUint64("34b0bcb5e19b48a8"),
    0x391c0cb3c5c95a63ULL, HexToUint64("4ed" "8aa4ae3418acb"), 0x5b9cca4f7763e373ULL, 0x682e6ff3d6b2b8a3ULL,
    0x748f82ee5defb2fcULL, 0x78a5636f43172f60ULL, 0x84c87814a1f0ab72ULL, 0x8cc702081a6439ecULL,
    0x90befffa23631e28ULL, 0xa4506cebde82bde9ULL, 0xbef9a3f7b2c67915ULL, 0xc67178f2e372532bULL,
    0xca273eceea26619cULL, HexToUint64("d" "186b8c721c0c207"),
    0xeada7dd6cde0eb1eULL, 0xf57d4f7fee6ed178ULL,
    0x06f067aa72176fbaULL, 0x0a637dc5a2c898a6ULL, 0x113f9804bef90daeULL, 0x1b710b35131c471bULL,
    HexToUint64("28db77f523047d" "84"), 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL, 0x431d67c49c100d4cULL,
    0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL, 0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL
};

// 辅助函数
inline constexpr uint64_t ROTR64(uint64_t x, int n)
{
    return ((x >> n) | (x << (ROTATE_BITS_64 - n)));
}

inline constexpr uint64_t SHR64(uint64_t x, int n)
{
    return (x >> n);
}

inline constexpr uint64_t CH(uint64_t x, uint64_t y, uint64_t z)
{
    return ((x & y) ^ (~x & z));
}

inline constexpr uint64_t MAJ(uint64_t x, uint64_t y, uint64_t z)
{
    return ((x & y) ^ (x & z) ^ (y & z));
}

inline constexpr uint64_t SIGMA0(uint64_t x)
{
    return (ROTR64(x, ROTATE_SIGMA0_28) ^ ROTR64(x, ROTATE_SIGMA0_34) ^ ROTR64(x, ROTATE_SIGMA0_39));
}

inline constexpr uint64_t SIGMA1(uint64_t x)
{
    return (ROTR64(x, ROTATE_SIGMA1_14) ^ ROTR64(x, ROTATE_SIGMA1_18) ^ ROTR64(x, ROTATE_SIGMA1_41));
}

inline constexpr uint64_t Sigma0Small(uint64_t x)
{
    return (ROTR64(x, ROTATE_SIGMA_SMALL0_1) ^ ROTR64(x, ROTATE_SIGMA_SMALL0_8) ^ SHR64(x, SHIFT_SIGMA_SMALL0_7));
}

inline constexpr uint64_t Sigma1Small(uint64_t x)
{
    return (ROTR64(x, ROTATE_SIGMA_SMALL1_19) ^ ROTR64(x, ROTATE_SIGMA_SMALL1_61) ^ SHR64(x, SHIFT_SIGMA_SMALL1_6));
}

// 字节序转换
inline uint64_t LOAD64_BE(const uint8_t *p)
{
    return (static_cast<uint64_t>(p[INDEX_0]) << SHIFT_56) | (static_cast<uint64_t>(p[INDEX_1]) << SHIFT_48) |
           (static_cast<uint64_t>(p[INDEX_2]) << SHIFT_40) | (static_cast<uint64_t>(p[INDEX_3]) << SHIFT_32) |
           (static_cast<uint64_t>(p[INDEX_4]) << SHIFT_24) | (static_cast<uint64_t>(p[INDEX_5]) << SHIFT_16) |
           (static_cast<uint64_t>(p[INDEX_6]) << SHIFT_8) | static_cast<uint64_t>(p[INDEX_7]);
}

inline void STORE64_BE(uint8_t *p, uint64_t v)
{
    p[INDEX_0] = static_cast<uint8_t>(v >> SHIFT_56);
    p[INDEX_1] = static_cast<uint8_t>(v >> SHIFT_48);
    p[INDEX_2] = static_cast<uint8_t>(v >> SHIFT_40);
    p[INDEX_3] = static_cast<uint8_t>(v >> SHIFT_32);
    p[INDEX_4] = static_cast<uint8_t>(v >> SHIFT_24);
    p[INDEX_5] = static_cast<uint8_t>(v >> SHIFT_16);
    p[INDEX_6] = static_cast<uint8_t>(v >> SHIFT_8);
    p[INDEX_7] = static_cast<uint8_t>(v);
}

// 准备消息调度数组
inline void PrepareMessageSchedule(uint64_t *w, const uint8_t *data)
{
    for (int i = INDEX_0; i < SHA512_INITIAL_ROUNDS; i++) {
        w[i] = LOAD64_BE(data + i * SHA512_BYTES_PER_WORD);
    }
    for (int i = SHA512_INITIAL_ROUNDS; i < SHA512_WORD_COUNT; i++) {
        w[i] = Sigma1Small(w[i - MSG_OFFSET_2]) + w[i - MSG_OFFSET_7] +
               Sigma0Small(w[i - MSG_OFFSET_15]) + w[i - MSG_OFFSET_16];
    }
}

// 执行SHA512主循环的一轮
inline void Sha512Round(Sha512WorkVars &vars, uint64_t k, uint64_t w)
{
    uint64_t t1 = vars.h + SIGMA1(vars.e) + CH(vars.e, vars.f, vars.g) + k + w;
    uint64_t t2 = SIGMA0(vars.a) + MAJ(vars.a, vars.b, vars.c);
    vars.h = vars.g;
    vars.g = vars.f;
    vars.f = vars.e;
    vars.e = vars.d + t1;
    vars.d = vars.c;
    vars.c = vars.b;
    vars.b = vars.a;
    vars.a = t1 + t2;
}

// 更新SHA512状态
inline void UpdateState(SHA512_CTX *ctx, const Sha512WorkVars &vars)
{
    ctx->state[INDEX_0] += vars.a;
    ctx->state[INDEX_1] += vars.b;
    ctx->state[INDEX_2] += vars.c;
    ctx->state[INDEX_3] += vars.d;
    ctx->state[INDEX_4] += vars.e;
    ctx->state[INDEX_5] += vars.f;
    ctx->state[INDEX_6] += vars.g;
    ctx->state[INDEX_7] += vars.h;
}

// 初始化工作变量
inline void InitWorkVars(Sha512WorkVars &vars, const SHA512_CTX *ctx)
{
    vars.a = ctx->state[INDEX_0];
    vars.b = ctx->state[INDEX_1];
    vars.c = ctx->state[INDEX_2];
    vars.d = ctx->state[INDEX_3];
    vars.e = ctx->state[INDEX_4];
    vars.f = ctx->state[INDEX_5];
    vars.g = ctx->state[INDEX_6];
    vars.h = ctx->state[INDEX_7];
}

// 执行所有轮次
inline void ExecuteRounds(Sha512WorkVars &vars, const uint64_t *w)
{
    for (int i = INDEX_0; i < SHA512_WORD_COUNT; i++) {
        Sha512Round(vars, K512[i], w[i]);
    }
}

// SHA512 块处理
inline void Sha512Transform(SHA512_CTX *ctx, const uint8_t *data)
{
    uint64_t w[SHA512_WORD_COUNT];
    PrepareMessageSchedule(w, data);
    Sha512WorkVars vars;
    InitWorkVars(vars, ctx);
    ExecuteRounds(vars, w);
    UpdateState(ctx, vars);
}

// 初始化SHA512状态值
inline void InitSha512State(SHA512_CTX *ctx)
{
    ctx->state[INDEX_0] = 0x6a09e667f3bcc908ULL;
    ctx->state[INDEX_1] = 0xbb67ae8584caa73bULL;
    ctx->state[INDEX_2] = 0x3c6ef372fe94f82bULL;
    ctx->state[INDEX_3] = 0xa54ff53a5f1d36f1ULL;
    ctx->state[INDEX_4] = 0x510e527fade682d1ULL;
    ctx->state[INDEX_5] = 0x9b05688c2b3e6c1fULL;
    ctx->state[INDEX_6] = 0x1f83d9abfb41bd6bULL;
    ctx->state[INDEX_7] = 0x5be0cd19137e2179ULL;
}

// SHA512 初始化
inline int SHA512_Init(SHA512_CTX *ctx)
{
    if (ctx == nullptr) {
        return 0;
    }
    InitSha512State(ctx);
    ctx->count[INDEX_0] = 0;
    ctx->count[INDEX_1] = 0;
    return 1;
}

// 复制部分数据到缓冲区
inline int CopyPartialData(SHA512_CTX *ctx, const uint8_t *p, size_t len, size_t buflen)
{
    if (SecureMemcpy(ctx->buffer + buflen, SHA512_BLOCK_SIZE - buflen, p, len) != 0) {
        return -1;
    }
    return 1;
}

// 填充并转换缓冲区
inline int FillAndTransform(SHA512_CTX *ctx, const uint8_t *&p, size_t &len, size_t buflen, size_t remaining)
{
    if (SecureMemcpy(ctx->buffer + buflen, SHA512_BLOCK_SIZE - buflen, p, remaining) != 0) {
        return -1;
    }
    Sha512Transform(ctx, ctx->buffer);
    p += remaining;
    len -= remaining;
    return 0;
}

// 处理缓冲区数据
inline int ProcessBuffer(SHA512_CTX *ctx, const uint8_t *&p, size_t &len, size_t buflen)
{
    size_t remaining = SHA512_BLOCK_SIZE - buflen;
    if (len < remaining) {
        return CopyPartialData(ctx, p, len, buflen);
    }
    return FillAndTransform(ctx, p, len, buflen, remaining);
}

// 处理完整块
inline void ProcessFullBlocks(SHA512_CTX *ctx, const uint8_t *&p, size_t &len)
{
    while (len >= SHA512_BLOCK_SIZE) {
        Sha512Transform(ctx, p);
        p += SHA512_BLOCK_SIZE;
        len -= SHA512_BLOCK_SIZE;
    }
}

// 更新位计数
inline void UpdateBitCount(SHA512_CTX *ctx, size_t len)
{
    ctx->count[INDEX_0] += len;
    if (ctx->count[INDEX_0] < len) {
        ctx->count[INDEX_1]++;
    }
}

// 处理剩余数据
inline int ProcessRemainingData(SHA512_CTX *ctx, const uint8_t *p, size_t len)
{
    if (len > 0) {
        if (SecureMemcpy(ctx->buffer, SHA512_BLOCK_SIZE, p, len) != 0) {
            return 0;
        }
    }
    return 1;
}

// 处理更新数据
inline int ProcessUpdateData(SHA512_CTX *ctx, const uint8_t *p, size_t len, size_t buflen)
{
    const uint8_t *ptr = p;
    size_t length = len;
    if (buflen > 0 && ProcessBuffer(ctx, ptr, length, buflen)) {
        return 1;
    }
    ProcessFullBlocks(ctx, ptr, length);
    return ProcessRemainingData(ctx, ptr, length);
}

// SHA512 更新
inline int SHA512_Update(SHA512_CTX *ctx, const void *data, size_t len)
{
    if (ctx == nullptr || (data == nullptr && len != 0)) {
        return 0;
    }
    const uint8_t *p = static_cast<const uint8_t *>(data);
    size_t buflen = static_cast<size_t>(ctx->count[INDEX_0] & SHA512_BUFFER_MASK);
    UpdateBitCount(ctx, len);
    return ProcessUpdateData(ctx, p, len, buflen);
}

// 处理长填充
inline int HandleLongPadding(SHA512_CTX *ctx, size_t &buflen)
{
    if (SecureMemset(ctx->buffer + buflen, SHA512_BLOCK_SIZE - buflen, 0, SHA512_BLOCK_SIZE - buflen) != 0) {
        return 0;
    }
    Sha512Transform(ctx, ctx->buffer);
    buflen = 0;
    return 1;
}

// 填充零并存储长度
inline int PadZeroAndStoreLength(SHA512_CTX *ctx, size_t buflen, uint64_t bitlenHi, uint64_t bitlenLo)
{
    if (SecureMemset(ctx->buffer + buflen, SHA512_PADDING_THRESHOLD - buflen, 0,
                     SHA512_PADDING_THRESHOLD - buflen) != 0) {
        return 0;
    }
    STORE64_BE(ctx->buffer + SHA512_LENGTH_FIELD_OFFSET, bitlenHi);
    STORE64_BE(ctx->buffer + SHA512_LENGTH_FIELD_SIZE, bitlenLo);
    return 1;
}

// 添加SHA512填充
inline int AddPadding(SHA512_CTX *ctx, size_t &buflen, uint64_t bitlenHi, uint64_t bitlenLo)
{
    ctx->buffer[buflen++] = 0x80;
    if (buflen > SHA512_PADDING_THRESHOLD) {
        if (HandleLongPadding(ctx, buflen) != 1) {
            return 0;
        }
    }
    return PadZeroAndStoreLength(ctx, buflen, bitlenHi, bitlenLo);
}

// 输出SHA512哈希值
inline void OutputHash(unsigned char *md, SHA512_CTX *ctx)
{
    for (int i = INDEX_0; i < SHA512_STATE_SIZE; i++) {
        STORE64_BE(md + i * SHA512_BYTES_PER_WORD, ctx->state[i]);
    }
}

// 计算位长度
inline void CalculateBitLength(const SHA512_CTX *ctx, uint64_t &bitlenHi, uint64_t &bitlenLo)
{
    bitlenHi = (ctx->count[INDEX_1] << BITS_PER_BYTE) | (ctx->count[INDEX_0] >> HIGH_BITS_SHIFT);
    bitlenLo = ctx->count[INDEX_0] << BITS_PER_BYTE;
}

// 完成填充和转换
inline int FinalizePaddingAndTransform(SHA512_CTX *ctx, size_t buflen)
{
    uint64_t bitlenHi;
    uint64_t bitlenLo;
    CalculateBitLength(ctx, bitlenHi, bitlenLo);
    if (AddPadding(ctx, buflen, bitlenHi, bitlenLo) != 1) {
        return 0;
    }
    Sha512Transform(ctx, ctx->buffer);
    return 1;
}

// SHA512 完成
inline int SHA512_Final(unsigned char *md, SHA512_CTX *ctx)
{
    if (md == nullptr || ctx == nullptr) {
        return 0;
    }
    size_t buflen = static_cast<size_t>(ctx->count[INDEX_0] & SHA512_BUFFER_MASK);
    if (FinalizePaddingAndTransform(ctx, buflen) != 1) {
        return 0;
    }
    OutputHash(md, ctx);
    return 1;
}

// 清除敏感数据
inline void OpensslCleanse(void *ptr, size_t len)
{
    if (ptr != nullptr) {
        volatile uint8_t *p = (volatile uint8_t *)ptr;
        while (len--) {
            *p++ = 0;
        }
    }
}

#endif // SHA512_STUB_H
