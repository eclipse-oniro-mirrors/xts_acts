/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#define Z_LARGE64
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
#include <cerrno>
#include <unistd.h>
#include <fstream>
#include <mutex>
#include "napi/native_api.h"
#include "zlib.h"
#include "ActsZlibTest.h"
#ifndef OH_NN_SUCCESS
#define OH_NN_SUCCESS 0
#endif
using namespace std;
using ZStream = z_stream;
namespace {
static const char DICTIONARY[] = "hello";
static const char GARBAGE_DATA[] = "garbage";
static const char TEST_FILE[] = "foo.gz";
static thread_local char HELLO[] = "hello, hello!";
static int ONE = 1;
static int FOUR = 4;
static int SIX = 6;
static int EIGHT = 8;
static unsigned BUFFER_SIZE = 8192;
static const int BUFFER_SIZE_FACTOR = 100;
static const int G_FLUSH_BLOCK_SIZE = 3;
static const int G_PRIME_BITS = 5;
static const int G_PRIME_VALUE = 31;
static const long G_SEEK_OFFSET = 6L;
static const int G_WINDOW_BITS_15 = 15;
static const int G_WINDOW_BITS_8 = 8;
static const int G_WINDOW_BITS_1 = 1;
static const int G_PRIME_BITS_NEG = -1;
static const int G_ENABLE_FLAG = 1;
static const int G_ZLIB_HEADER_SIZE = 2;
static const int PRIME_DISCARD_BITS = -1;
static const int CALLOC_SIZE = 1;
std::mutex g_gzMutex;
std::mutex g_puMutex;
std::mutex g_fileMutex;

static unsigned pull(void *desc, unsigned char **buf)
{
    std::lock_guard<std::mutex> lock(g_puMutex);
    static unsigned int next = 0;
    static unsigned char dat[] = {0x63, 0, 2, 0};

    if (!desc) {
        next = 0;
        return 0;   /* no input (already provided at next_in) */
    }
    return next < sizeof(dat) ? (*buf = dat + next++, 1) : 0;
}

static int Push(void *desc, unsigned char *buf, unsigned len)
{
    std::lock_guard<std::mutex> lock(g_puMutex);
    buf += len;
    return desc != nullptr;
}

static int TestGzPrintf(gzFile file, const char *format, ...)
{
    std::lock_guard<std::mutex> lock(g_gzMutex);
    va_list va;
    int ret;

    va_start(va, format);
    ret = gzvprintf(file, format, va);
    va_end(va);
    return ret;
}

struct MemItem {
    void *ptr;
    size_t size;
    struct MemItem *next;
};

struct MemZone {
    struct MemItem *first;
    size_t total;
    size_t highwater;
    size_t limit;
    int notlifo;
    int rogue;
};
}

int ActsZlibTestCompress(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != nullptr && uncompr != nullptr)) {
        return -1;
    }
    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + 1;
    err = compress(compr, &comprLen,
        reinterpret_cast<const Bytef*>(HELLO), len);
    if (err != Z_OK) {
        return -1;
    }
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    err = uncompress(uncompr, &uncomprLen, compr, comprLen);
    if (err != Z_OK) {
        return -1;
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

static int ActsZlibTestGzioWrite(void)
{
    gzFile file = gzopen(TEST_FILE, "wb");
    if (file == nullptr) {
        return -1;
    }
    gzputc(file, 'h');
    if (gzputs(file, "ello") != FOUR) {
        gzclose(file);
        return -1;
    }
    int err = Z_OK;
    if (gzprintf(file, ", %s!", "hello") != EIGHT) {
        gzclose(file);
        return -1;
    }
    gzputc(file, '\0');
    gzclose(file);
    return OH_NN_SUCCESS;
}

static int ActsZlibTestGzioReadSeekAndGet(gzFile file, Byte *uncompr)
{
    gzrewind(file);
    z_off_t pos = gzseek(file, G_SEEK_OFFSET, SEEK_SET);
    if (pos != SIX || gztell(file) != pos) {
        return -1;
    }
    if (gzgetc(file) != ' ') {
        return -1;
    }
    if (gzungetc(' ', file) != ' ') {
        return -1;
    }
    gzgets(file, reinterpret_cast<char *>(uncompr),
        static_cast<int>(strlen(HELLO)) + 1);
    if (strcmp(reinterpret_cast<char *>(uncompr), HELLO + SIX)) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

static int ActsZlibTestGzioRead(void)
{
    gzFile file = gzopen(TEST_FILE, "rb");
    if (file == nullptr) {
        return -1;
    }
    Byte *uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(BUFFER_SIZE_FACTOR * sizeof(int)), CALLOC_SIZE));
    if (uncompr == nullptr) {
        gzclose(file);
        return -1;
    }
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    if (gzread(file, uncompr, static_cast<unsigned>(strlen(HELLO)) + 1) !=
        (static_cast<int>(strlen(HELLO)) + 1)) {
        gzclose(file);
        free(uncompr);
        return -1;
    }
    if (strcmp(reinterpret_cast<char *>(uncompr), HELLO)) {
        gzclose(file);
        free(uncompr);
        return -1;
    }
    if (ActsZlibTestGzioReadSeekAndGet(file, uncompr) != OH_NN_SUCCESS) {
        gzclose(file);
        free(uncompr);
        return -1;
    }
    gzclose(file);
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzio(void)
{
    if (chdir("/data/storage/el2/base/files") != 0) {
        chdir("/data/local/tmp");
    }
    std::lock_guard<std::mutex> lock(g_fileMutex);
    if (ActsZlibTestGzioWrite() != OH_NN_SUCCESS) {
        return -1;
    }
    if (ActsZlibTestGzioRead() != OH_NN_SUCCESS) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

int ActsZlibTestDeflate(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    if (compr == nullptr) {
        return -1;
    }
    ZStream cStream;
    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + 1;
    cStream.zalloc = nullptr;
    cStream.zfree = nullptr;
    cStream.opaque = nullptr;
    err = deflateInit(&cStream, Z_DEFAULT_COMPRESSION);
    if (err != Z_OK) {
        return -1;
    }
    cStream.next_in  = reinterpret_cast<z_const unsigned char *>(HELLO);
    cStream.next_out = compr;
    while (cStream.total_in != len && cStream.total_out < comprLen) {
        cStream.avail_out = 1;
        cStream.avail_in = 1;
        err = deflate(&cStream, Z_NO_FLUSH);
        if (err != Z_OK) {
            return -1;
        }
    }
    bool exitLoop = false;
    for (; !exitLoop;) {
        cStream.avail_out = 1;
        err = deflate(&cStream, Z_FINISH);
        if (err == Z_STREAM_END) {
            exitLoop = true;
        } else if (err != Z_OK) {
            return -1;
        }
    }
    err = deflateEnd(&cStream);
    if (err != Z_OK) {
        return -1;
    }
    free(compr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestInflate(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != nullptr && uncompr != nullptr)) {
        return -1;
    }
    int err = Z_OK;
    z_stream strm;
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.opaque = nullptr;
    strm.next_in  = compr;
    strm.avail_in = 0;
    strm.next_out = uncompr;
    err = inflateInit(&strm);
    if (err != Z_OK) {
        return -1;
    }
    while (strm.total_out < uncomprLen && strm.total_in < comprLen) {
        strm.avail_out = 1;
        strm.avail_in = 1;
        err = inflate(&strm, Z_NO_FLUSH);
        if (err == Z_STREAM_END || err == Z_DATA_ERROR) {
            break;
        }
        if (err != Z_OK) {
            return -1;
        }
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

static int ActsZlibTestLargeDeflatePart2(ZStream *cStream, Byte *compr, Byte *uncompr,
    uLong comprLen, uLong uncomprLen)
{
    const int halfFactor = 2;
    int err = Z_OK;
    deflateParams(cStream, Z_NO_COMPRESSION, Z_DEFAULT_STRATEGY);
    cStream->next_in = compr;
    cStream->avail_in = static_cast<uInt>(comprLen) / halfFactor;
    err = deflate(cStream, Z_NO_FLUSH);
    if (err != Z_OK) {
        deflateEnd(cStream);
        return -1;
    }
    deflateParams(cStream, Z_BEST_COMPRESSION, Z_FILTERED);
    cStream->next_in = uncompr;
    cStream->avail_in = static_cast<uInt>(uncomprLen);
    err = deflate(cStream, Z_NO_FLUSH);
    if (err != Z_OK) {
        deflateEnd(cStream);
        return -1;
    }
    err = deflate(cStream, Z_FINISH);
    if (err != Z_STREAM_END) {
        deflateEnd(cStream);
        return -1;
    }
    err = deflateEnd(cStream);
    if (err != Z_OK) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

static int ActsZlibTestLargeDeflatePart1(Byte *compr, Byte *uncompr, uLong comprLen, uLong uncomprLen)
{
    ZStream cStream;
    int err = Z_OK;
    cStream.zalloc = nullptr;
    cStream.zfree = nullptr;
    cStream.opaque = nullptr;

    err = deflateInit(&cStream, Z_BEST_SPEED);
    if (err != Z_OK) {
        return -1;
    }
    cStream.next_out = compr;
    cStream.avail_out = static_cast<uInt>(comprLen);
    cStream.next_in = uncompr;
    cStream.avail_in = static_cast<uInt>(uncomprLen);
    err = deflate(&cStream, Z_NO_FLUSH);
    if (err != Z_OK) {
        deflateEnd(&cStream);
        return -1;
    }
    if (cStream.avail_in != 0) {
        deflateEnd(&cStream);
        return -1;
    }
    return ActsZlibTestLargeDeflatePart2(&cStream, compr, uncompr, comprLen, uncomprLen);
}

int ActsZlibTestLargeDeflate(void)
{
    chdir("/data/local/tmp");
    Byte *compr = nullptr;
    Byte *uncompr = nullptr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (compr == nullptr || uncompr == nullptr) {
        free(compr);
        free(uncompr);
        return -1;
    }

    if (ActsZlibTestLargeDeflatePart1(compr, uncompr, comprLen, uncomprLen) != OH_NN_SUCCESS) {
        free(compr);
        free(uncompr);
        return -1;
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

static int ProcessLargeInflateLoop(ZStream *dStream, Byte *uncompr, uLong uncomprLen)
{
    int err = Z_OK;
    bool exitLoop = false;
    for (; !exitLoop;) {
        dStream->next_out = uncompr;
        dStream->avail_out = static_cast<uInt>(uncomprLen);
        err = inflate(dStream, Z_NO_FLUSH);
        if (err == Z_STREAM_END || err == Z_DATA_ERROR) {
            exitLoop = true;
        } else if (err != Z_OK) {
            inflateEnd(dStream);
            return -1;
        }
    }
    return OH_NN_SUCCESS;
}

int ActsZlibTestLargeInflate(void)
{
    chdir("/data/local/tmp");
    Byte *compr = nullptr;
    Byte *uncompr = nullptr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (compr == nullptr || uncompr == nullptr) {
        free(compr);
        free(uncompr);
        return -1;
    }
    ZStream dStream;
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    dStream.zalloc = nullptr;
    dStream.zfree = nullptr;
    dStream.opaque = nullptr;
    dStream.next_in  = compr;
    dStream.avail_in = static_cast<uInt>(comprLen);
    if (inflateInit(&dStream) != Z_OK) {
        free(compr);
        free(uncompr);
        return -1;
    }

    if (ProcessLargeInflateLoop(&dStream, uncompr, uncomprLen) != OH_NN_SUCCESS) {
        free(compr);
        free(uncompr);
        return -1;
    }

    if (inflateEnd(&dStream) != Z_OK) {
        free(compr);
        free(uncompr);
        return -1;
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestFlush(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    if (compr == nullptr) {
        return -1;
    }
    z_stream cStream;
    int err = Z_OK;
    uInt len = static_cast<uInt>(strlen(HELLO)) + 1;
    cStream.zalloc = nullptr;
    cStream.zfree = nullptr;
    cStream.opaque = nullptr;
    err = deflateInit(&cStream, Z_DEFAULT_COMPRESSION);
    if (err != Z_OK) {
        return -1;
    }
    cStream.next_in  = reinterpret_cast<z_const unsigned char *>(HELLO);
    cStream.next_out = compr;
    cStream.avail_in = G_FLUSH_BLOCK_SIZE;
    cStream.avail_out = static_cast<uInt>(comprLen);
    err = deflate(&cStream, Z_FULL_FLUSH);
    if (err != Z_OK) {
        return -1;
    }
    compr[G_FLUSH_BLOCK_SIZE]++;
    cStream.avail_in = len - G_FLUSH_BLOCK_SIZE;
    err = deflate(&cStream, Z_FINISH);
    if (err != Z_STREAM_END) {
        if (err != Z_OK) {
            return -1;
        }
    }
    err = deflateEnd(&cStream);
    if (err != Z_OK) {
        return -1;
    }
    comprLen = cStream.total_out;
    free(compr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestSync(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != nullptr && uncompr != nullptr)) {
        return -1;
    }
    int err = Z_OK;
    ZStream dStream;
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    dStream.zalloc = nullptr;
    dStream.zfree = nullptr;
    dStream.opaque = nullptr;
    dStream.next_in  = compr;
    dStream.avail_in = G_ZLIB_HEADER_SIZE;
    err = inflateInit(&dStream);
    if (err != Z_OK) {
        return -1;
    }
    dStream.next_out = uncompr;
    dStream.avail_out = static_cast<uInt>(uncomprLen);
    inflate(&dStream, Z_NO_FLUSH);
    dStream.avail_in = static_cast<uInt>(comprLen) - G_ZLIB_HEADER_SIZE;
    inflateSync(&dStream);
    inflate(&dStream, Z_FINISH);
    inflateEnd(&dStream);
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestDictDeflate(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != nullptr && uncompr != nullptr)) {
        return -1;
    }
    ZStream cStream;
    int err = Z_OK;
    cStream.zalloc = nullptr;
    cStream.zfree = nullptr;
    cStream.opaque = nullptr;
    err = deflateInit(&cStream, Z_BEST_COMPRESSION);
    if (err != Z_OK) {
        return -1;
    }
    err = deflateSetDictionary(&cStream,
        reinterpret_cast<const Bytef*>(DICTIONARY),
        static_cast<int>(sizeof(DICTIONARY)));
    if (err != Z_OK) {
        return -1;
    }
    cStream.next_out = compr;
    cStream.avail_out = static_cast<uInt>(comprLen);
    cStream.next_in  = reinterpret_cast<z_const unsigned char *>(HELLO);
    cStream.avail_in = static_cast<uInt>(strlen(HELLO)) + 1;
    err = deflate(&cStream, Z_FINISH);
    if (err != Z_STREAM_END) {
        return -1;
    }
    err = deflateEnd(&cStream);
    if (err != Z_OK) {
        return -1;
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

static int ProcessInflateDictLoop(z_stream *strm)
{
    bool exitLoop = false;
    for (; !exitLoop;) {
        int err = inflate(strm, Z_NO_FLUSH);
        if (err == Z_STREAM_END) {
            exitLoop = true;
        } else {
            if (err == Z_NEED_DICT) {
                err = inflateSetDictionary(strm,
                    reinterpret_cast<const Bytef*>(DICTIONARY),
                    static_cast<int>(sizeof(DICTIONARY)));
            }
            if (err == Z_DATA_ERROR) {
                exitLoop = true;
            } else if (err != Z_OK) {
                return -1;
            }
        }
    }
    return OH_NN_SUCCESS;
}

static int InitBuffers(Byte **compr, Byte **uncompr, uLong len)
{
    *compr = static_cast<Byte*>(calloc(static_cast<uInt>(len), CALLOC_SIZE));
    *uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(len), CALLOC_SIZE));
    if (*compr == nullptr || *uncompr == nullptr) {
        free(*compr);
        free(*uncompr);
        return -1;
    }
    return OH_NN_SUCCESS;
}

static int InflateDict(z_stream *strm, Byte *compr, Byte *uncompr, uLong len)
{
    strm->zalloc = nullptr;
    strm->zfree = nullptr;
    strm->opaque = nullptr;
    strm->next_in  = compr;
    strm->avail_in = static_cast<uInt>(len);
    strm->next_out = uncompr;
    strm->avail_out = static_cast<uInt>(len);

    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));

    if (inflateInit(strm) != Z_OK) {
        return -1;
    }

    if (ProcessInflateDictLoop(strm) != OH_NN_SUCCESS) {
        inflateEnd(strm);
        return -1;
    }

    if (inflateEnd(strm) != Z_OK) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

int ActsZlibTestDictInflate(void)
{
    chdir("/data/local/tmp");
    uLong len = BUFFER_SIZE_FACTOR * sizeof(int);
    Byte *compr = nullptr;
    Byte *uncompr = nullptr;

    if (InitBuffers(&compr, &uncompr, len) != OH_NN_SUCCESS) {
        return -1;
    }

    z_stream strm;
    if (InflateDict(&strm, compr, uncompr, len) != OH_NN_SUCCESS) {
        free(compr);
        free(uncompr);
        return -1;
    }

    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestCompress2(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != nullptr && uncompr != nullptr)) {
        return -1;
    }
    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + 1;
    uLong outLen = compressBound(len);
    err = compress2(compr, &comprLen,
        reinterpret_cast<const Bytef*>(HELLO),
        outLen, Z_BEST_COMPRESSION);
    if (err != Z_OK) {
        return -1;
    }
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    err = uncompress2(uncompr, &uncomprLen, compr, &comprLen);
    if (err != Z_OK) {
        return -1;
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestAdler(void)
{
    chdir("/data/local/tmp");
    uLong err = Z_ERRNO;
    uLong adler1 = 0L;
    uLong adler2 = 0L;
    const Bytef *buf = reinterpret_cast<const Bytef*>(DICTIONARY);
    err = adler32(0L, buf, 0);
    if (err == Z_ERRNO) {
        return -1;
    }
    err = adler32_z(0L, buf, 0);
    if (err == Z_ERRNO) {
        return -1;
    }
#ifdef Z_LARGE64
    err = adler32_combine64(adler1, adler2, 0);
    if (err == Z_ERRNO) {
        return -1;
    }
#else
    err = adler32_combine(adler1, adler2, 0);
    if (err == Z_ERRNO) {
        return -1;
    }
#endif
    return OH_NN_SUCCESS;
}

static int AllocDeflateBuffers(Byte **compr, Byte **uncompr, uLong *len)
{
    *len = BUFFER_SIZE_FACTOR * sizeof(int);
    *compr = static_cast<Byte*>(calloc(static_cast<uInt>(*len), CALLOC_SIZE));
    *uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(*len), CALLOC_SIZE));
    if (!(*compr != nullptr && *uncompr != nullptr)) {
        return -1;
    }
    return 0;
}

static void FreeDeflateBuffers(Byte *compr, Byte *uncompr)
{
    free(compr);
    free(uncompr);
}

static int InitDeflateStream(ZStream *cStream)
{
    cStream->zalloc = nullptr;
    cStream->zfree = nullptr;
    cStream->opaque = nullptr;
    return deflateInit2_(cStream, Z_BEST_COMPRESSION,
        Z_DEFLATED, EIGHT, EIGHT, Z_FILTERED,
        ZLIB_VERSION, static_cast<int>(sizeof(z_stream)));
}

static int RunDeflateConfigTests(ZStream *cStream, Byte *uncompr)
{
    int err = deflateSetHeader(cStream, nullptr);
    if (err != Z_OK) {
        return err;
    }
    err = deflateTune(cStream, ONE, FOUR, EIGHT, ONE);
    if (err != Z_OK) {
        return err;
    }
    err = deflateParams(cStream, ONE, Z_DEFAULT_STRATEGY);
    if (err != Z_OK) {
        return err;
    }
    err = deflatePending(cStream, nullptr, nullptr);
    if (err != Z_OK) {
        return err;
    }
    err = deflateSetDictionary(cStream,
        reinterpret_cast<const Bytef*>(DICTIONARY),
        static_cast<int>(sizeof(DICTIONARY)));
    if (err != Z_OK) {
        return err;
    }
    err = deflateGetDictionary(cStream, uncompr, nullptr);
    err = deflatePrime(cStream, EIGHT, ONE);
    return Z_OK;
}

static int ExecuteDeflate(ZStream *cStream, Byte *compr, uLong comprLen)
{
    cStream->next_out = compr;
    cStream->avail_out = static_cast<uInt>(comprLen);
    cStream->next_in  = reinterpret_cast<z_const unsigned char *>(HELLO);
    cStream->avail_in = static_cast<uInt>(strlen(HELLO)) + 1;
    int err = deflate(cStream, Z_FINISH);
    if (err != Z_STREAM_END) {
        return -1;
    }
    err = deflateEnd(cStream);
    if (err != Z_OK) {
        return -1;
    }
    err = deflateReset(cStream);
    return OH_NN_SUCCESS;
}

int ActsZlibTestDeflateState(void)
{
    if (chdir("/data/local/tmp") != 0) {
        return 0;
    }
    Byte *compr;
    Byte *uncompr;
    uLong comprLen;
    if (AllocDeflateBuffers(&compr, &uncompr, &comprLen) != 0) {
        return 0;
    }
    z_stream strm;
    if (InitDeflateStream(&strm) != Z_OK) {
        FreeDeflateBuffers(compr, uncompr);
        return 0;
    }
    if (RunDeflateConfigTests(&strm, uncompr) != Z_OK) {
        FreeDeflateBuffers(compr, uncompr);
        return 0;
    }
    int ret = ExecuteDeflate(&strm, compr, comprLen);
    FreeDeflateBuffers(compr, uncompr);
    if (ret == -1) {
        return 0;
    }
    return ret;
}

int ActsZlibTestDeflateBound(void)
{
    if (chdir("/data/local/tmp") != 0) {
        return 0;
    }
    z_stream defstream;
    char *inBuf = reinterpret_cast<char *>(HELLO);
    uint32_t inLen = strlen(inBuf) + 1;
    defstream.zfree = nullptr;
    defstream.avail_in = static_cast<uInt>(inLen);
    defstream.next_in = reinterpret_cast<Bytef *>(inBuf);
    defstream.avail_out = 0;
    defstream.next_out = nullptr;
    z_stream dummy = {};
    defstream = dummy;
    defstream.zalloc = nullptr;
    defstream.zfree = nullptr;
    int err = deflateInit_(&defstream, Z_DEFAULT_COMPRESSION,
        ZLIB_VERSION, static_cast<int>(sizeof(z_stream)));
    if (err != Z_OK) {
        return 0;
    }
    uLong estimateLen = deflateBound(&defstream, inLen);
    if (estimateLen == 0 || estimateLen > (UINT32_MAX - sizeof(uint8_t))) {
        deflateEnd(&defstream);
        return 0;
    }
    uint8_t *outBuf = reinterpret_cast<uint8_t *>(malloc(estimateLen));
    if (outBuf == nullptr) {
        deflateEnd(&defstream);
        return 0;
    }
    defstream.avail_out = static_cast<uInt>(estimateLen);
    defstream.next_out = reinterpret_cast<Bytef *>(outBuf);
    deflate(&defstream, Z_FINISH);
    z_stream outStream;
    err = deflateCopy(&outStream, &defstream);
    deflateEnd(&defstream);
    if (err == Z_OK) {
        deflateEnd(&outStream);
    }
    free(outBuf);
    return OH_NN_SUCCESS;
}

int ActsZlibTestCRC(void)
{
    if (chdir("/data/local/tmp") != 0) {
        return 0;
    }
    const Bytef *buf = reinterpret_cast<const Bytef*>(DICTIONARY);
    uLong err = crc32(0L, buf, 0);
    if (err == Z_ERRNO) {
        return 0;
    }
    err = crc32_z(0L, buf, 0);
    if (err == Z_ERRNO) {
        return 0;
    }
#ifdef Z_LARGE64
    uLong crc1 = 0L;
    uLong crc2 = 0L;
    err = crc32_combine64(crc1, crc2, 0);
    if (err == Z_ERRNO) {
        return 0;
    }
#else
    uLong crc1 = 0L;
    uLong crc2 = 0L;
    err = crc32_combine(crc1, crc2, 0);
    if (err == Z_ERRNO) {
        return 0;
    }
#endif
    return OH_NN_SUCCESS;
}

int ActsZlibTestGetCrcTable(void)
{
    chdir("/data/local/tmp");
    auto table = get_crc_table();
    if (!(table != nullptr)) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

static int ActsZlibTestGzBufferInternal(void)
{
    gzFile file = gzopen(TEST_FILE, "rb");
    if (file == nullptr) {
        return -1;
    }
    int res = gzdirect(file);
    uLong uncomprLen = 100 * sizeof(int);
    Byte *uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (uncompr == nullptr) {
        gzclose_r(file);
        return -1;
    }
    int ret = -1;
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    int len = static_cast<int>(strlen(HELLO)) + 1;
    if (gzread(file, uncompr, static_cast<unsigned>(uncomprLen)) == len &&
        strcmp(reinterpret_cast<char *>(uncompr), HELLO) == 0) {
        gzrewind(file);
        z_off_t pos = gzseek(file, G_SEEK_OFFSET, SEEK_SET);
        if (pos == SIX && gztell(file) == pos &&
            gzgetc(file) == ' ' && gzungetc(' ', file) == ' ') {
            gzgets(file, reinterpret_cast<char *>(uncompr), static_cast<int>(uncomprLen));
            if (strcmp(reinterpret_cast<char *>(uncompr), HELLO + SIX) == 0) {
                ret = OH_NN_SUCCESS;
            }
        }
    }
    gzclose_r(file);
    free(uncompr);
    return ret;
}

static int ActsZlibTestGzBufferWrite(void)
{
    gzFile file = gzopen(TEST_FILE, "wb");
    if (file == nullptr) {
        return -1;
    }
    if (gzbuffer(file, BUFFER_SIZE) != Z_OK) {
        gzclose_w(file);
        return -1;
    }
    gzclearerr(file);
    gzputc(file, 'h');
    if (gzputs(file, "ello") != FOUR) {
        gzclose_w(file);
        return -1;
    }
    if (gzprintf(file, ", %s!", "hello") != EIGHT) {
        gzclose_w(file);
        return -1;
    }
    gzputc(file, '\0');
    gzclearerr(file);
    gzclose_w(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzBuffer(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);

    if (ActsZlibTestGzBufferWrite() != OH_NN_SUCCESS) {
        return -1;
    }

    return ActsZlibTestGzBufferInternal();
}

int ActsZlibTestGzFlush(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    int err = Z_OK;
    gzFile file = gzopen(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    gzputc(file, 'h');
    if (!(gzputs(file, "ello") == FOUR)) {
        return -1;
    }
    if (gzprintf(file, ", %s!", "hello") != EIGHT) {
        if (!false) {
            return -1;
        }
    }
    gzputc(file, '\0');
    gzflush(file, Z_FINISH);
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzFread(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    int err = Z_OK;
    int len = static_cast<int>(strlen(HELLO)) + 1;
    gzFile file = gzopen(TEST_FILE, "rb");
    if (!(file != nullptr)) {
        return -1;
    }
    err = gzfread(HELLO, len, len, file);
    if (err != 1) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzWrite(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    int err = Z_OK;
    int len = static_cast<int>(strlen(HELLO)) + 1;
    gzFile file = gzopen(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    err = gzfwrite(HELLO, len, len, file);
    if (err != len) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzGetc(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    int err = Z_OK;
    gzFile file = gzopen(TEST_FILE, "rb");
    if (!(file != nullptr)) {
        return -1;
    }
    err = gzgetc(file);
    if (!(err == 'h')) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzUnGetc(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    gzFile file = gzopen(TEST_FILE, "rb");
    if (!(file != nullptr)) {
        return -1;
    }
    int err = gzgetc(file);
    if (!(err == 'h')) {
        return -1;
    }
    if (gzungetc('h', file) != 'h') {
        return -1;
    }
    char sz[5] = {0};
    gzread(file, sz, 1);
    if (!(sz[0] == 'h')) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzGetcx(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    int err = Z_OK;
    gzFile file = gzopen(TEST_FILE, "rb");
    if (!(file != nullptr)) {
        return -1;
    }
    err = gzgetc_(file);
    if (!(err == 'h')) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzGets(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    gzFile file = gzopen(TEST_FILE, "rb");
    if (!(file != nullptr)) {
        return -1;
    }
    Byte *uncompr;
    uLong uncomprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    gzgets(file, reinterpret_cast<char *>(uncompr), static_cast<int>(uncomprLen));
    if (strcmp(reinterpret_cast<char *>(uncompr), HELLO) != 0) {
        return -1;
    }
    gzclose(file);
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzOffset64(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    int err = Z_OK;
    int len = static_cast<int>(strlen(HELLO)) + 1;
    gzFile file = gzopen(TEST_FILE, "rb");
    if (!(file != nullptr)) {
        return -1;
    }
    err = gzoffset64(file);
    if (err != 0) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

static int ZlibTestGzOpen(void)
{
    int err = Z_OK;
    gzFile file = gzopen(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    gzputc(file, 'h');
    if (!(gzputs(file, "ello") == FOUR)) {
        return -1;
    }
    if (gzprintf(file, ", %s!", "hello") != EIGHT) {
        if (!false) {
            return -1;
        }
    }
    gzputc(file, '\0');
    gzclose(file);
    file = gzopen(TEST_FILE, "rb");
    if (!(file != nullptr)) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

static int ActsZlibTestGzOpenInternal(void)
{
#ifdef Z_LARGE64
    int err = Z_OK;
    gzFile file = gzopen64(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    gzputc(file, 'h');
    if (!(gzputs(file, "ello") == FOUR)) {
        return -1;
    }
    if (gzprintf(file, ", %s!", "hello") != EIGHT) {
        if (!false) {
            return -1;
        }
    }
    gzputc(file, '\0');
    gzclose(file);
    file = gzopen64(TEST_FILE, "rb");
    if (!(file != nullptr)) {
        return -1;
    }
    gzclose(file);
#endif
#if (defined(_WIN32) || defined(__CYGWIN__))
    gzFile file = gzopen_w(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    gzclose(file);
#endif
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzOpen(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    if (ZlibTestGzOpen() != OH_NN_SUCCESS) {
        return -1;
    }
    if (ActsZlibTestGzOpenInternal() != OH_NN_SUCCESS) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzPrintf(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    gzFile file = gzopen(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    if (!(gzprintf(file, ", %s!", "hello") == EIGHT)) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}


int ActsZlibTestGzPutc(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    char err;
    gzFile file = gzopen(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    err = gzputc(file, 'h');
    if (!(err == 'h')) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzPuts(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    gzFile file = gzopen(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    if (!(gzputs(file, "ello") == FOUR)) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzRead(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    int err = Z_OK;
    int len = static_cast<int>(strlen(HELLO)) + 1;
    gzFile file = gzopen(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    gzputc(file, 'h');
    if (!(gzputs(file, "ello") == FOUR)) {
        return -1;
    }
    if (gzprintf(file, ", %s!", "hello") != EIGHT) {
        if (!false) {
            return -1;
        }
    }
    gzputc(file, '\0');
    gzclose(file);
    file = gzopen(TEST_FILE, "rb");
    if (!(file != nullptr)) {
        return -1;
    }
    Byte *uncompr;
    uLong uncomprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(uncompr != nullptr)) {
        return -1;
    }
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    if (!(gzread(file, uncompr,
        static_cast<unsigned>(uncomprLen)) == len)) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzRewind(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    int err = Z_OK;
    gzFile file = gzopen(TEST_FILE, "wb");
    gzseek(file, 0L, SEEK_SET);
    err = gzrewind(file);
    if (!(err == -1)) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzseek(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    long err = 0L;
    gzFile file = gzopen(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    err = gzseek(file, 1L, SEEK_CUR);
    if (!(err == 1L)) {
        return -1;
    }
#ifdef Z_LARGE64
    gzclose(file);
    file = gzopen (TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    err = gzseek64(file, 1L, SEEK_CUR);
#endif
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzSetParams(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    int err = Z_OK;
    gzFile file = gzopen(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    err = gzsetparams(file, Z_DEFAULT_COMPRESSION, Z_DEFAULT_STRATEGY);
    if (!(err == Z_OK)) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

static int ActsZlibTestGzTellWrite(void)
{
    gzFile file = gzopen(TEST_FILE, "wb");
    if (file == nullptr) {
        return -1;
    }
    gzputc(file, 'h');
    if (!(gzputs(file, "ello") == FOUR)) {
        return -1;
    }
    if (gzprintf(file, ", %s!", "hello") != EIGHT) {
        if (!false) {
            return -1;
        }
    }
    gzputc(file, '\0');
    gzclose(file);
    return OH_NN_SUCCESS;
}

static int ActsZlibTestGzTellRead(void)
{
    gzFile file = gzopen(TEST_FILE, "rb");
    if (file == nullptr) {
        return -1;
    }
    gzrewind(file);
#  ifndef Z_LARGE64
    z_off64_t pos = gzseek(file, 6L, SEEK_SET);
    if (gztell(file) != pos) {
        gzclose(file);
        return -1;
    }
#else
    z_off_t pos = gzseek(file, 6L, SEEK_SET);
    if (gztell64(file) != pos) {
        gzclose(file);
        return -1;
    }
#endif
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzTell(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    if (ActsZlibTestGzTellWrite() != OH_NN_SUCCESS) {
        return -1;
    }
    if (ActsZlibTestGzTellRead() != OH_NN_SUCCESS) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzVprintf(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    gzFile file = gzopen(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    int err = TestGzPrintf(file, ", %s!", "hello");
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzwrite(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    int len = static_cast<int>(strlen(HELLO)) + 1;
    gzFile file = gzopen(TEST_FILE, "wb");
    if (!(file != nullptr)) {
        return -1;
    }
    int err = gzwrite(file, HELLO, len);
    if (err != len) {
        return -1;
    }
    gzclose(file);
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzInflateBack(void)
{
    chdir("/data/local/tmp");
    int err = Z_OK;
    unsigned char *window;
    z_stream strm;
    unsigned char match[65280 + 2];
    Byte *uncompr;
    uLong uncomprLen = 100 * sizeof(int);
    uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    window = match;
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.opaque = nullptr;
    err = inflateBackInit_(
        &strm, 15, window, ZLIB_VERSION, static_cast<int>(sizeof(z_stream)));
    if (err != Z_OK) {
        return -1;
    }
    if (err != Z_OK) {
        if (!false) {
            return -1;
        }
    }
    strm.next_in = uncompr;
    strm.avail_in = 1;
    err = inflateBack(&strm, pull, nullptr, Push, &strm);
    if (!(err != Z_OK)) {
        return -1;
    }
    err = inflateBackEnd(&strm);
    if (err != Z_OK) {
        return -1;
    }
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestInflateCodesUsed(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != nullptr && uncompr != nullptr)) {
        return -1;
    }
    unsigned long err;
    ZStream dStream;
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    dStream.zalloc = nullptr;
    dStream.zfree = nullptr;
    dStream.opaque = nullptr;
    dStream.next_in  = compr;
    dStream.avail_in = 0;
    dStream.next_out = uncompr;
    err = inflateCodesUsed(&dStream);
    if (!(err != Z_OK)) {
        return -1;
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestInflateCopyEnd(void)
{
    chdir("/data/local/tmp");
    int err = Z_OK;
    err = inflate(nullptr, 0);
    if (!(err == Z_STREAM_ERROR)) {
        return -1;
    }
    err = inflateEnd(nullptr);
    if (!(err == Z_STREAM_ERROR)) {
        return -1;
    }
    err = inflateCopy(nullptr, nullptr);
    if (!(err == Z_STREAM_ERROR)) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

int ActsZlibTestInflateGetDictionary(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != nullptr && uncompr != nullptr)) {
        return -1;
    }
    int err = Z_OK;
    ZStream dStream;
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    dStream.zalloc = nullptr;
    dStream.zfree = nullptr;
    dStream.opaque = nullptr;
    dStream.next_in  = compr;
    dStream.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&dStream);
    if (err != Z_OK) {
        return -1;
    }
    dStream.next_out = uncompr;
    dStream.avail_out = static_cast<uInt>(uncomprLen);
    err = inflate(&dStream, Z_NO_FLUSH);
    err = inflateGetDictionary(&dStream, uncompr, nullptr);
    if (err != Z_OK) {
        return -1;
    }
    inflateMark(&dStream);
    err = inflateEnd(&dStream);
    if (err != Z_OK) {
        return -1;
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestInflateGetHeader(void)
{
    chdir("/data/local/tmp");
    struct MemZone *zone;
    zone = (struct MemZone *)malloc(sizeof(struct MemZone));
    if (!(zone != nullptr)) {
        return -1;
    }
    zone->first = nullptr;
    zone->total = 0;
    zone->highwater = 0;
    zone->limit = 0;
    zone->notlifo = 0;
    zone->rogue = 0;
    int err = Z_OK;
    unsigned len = 1;
    unsigned char *out;
    z_stream strm;
    gz_header head;
    strm.opaque = zone;
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.avail_in = 0;
    strm.next_in = nullptr;
    err = inflateInit2(&strm, G_WINDOW_BITS_1);
    if (!(err != Z_OK)) {
        return -1;
    }
    out = (unsigned char *)malloc(len);
    if (!(out != nullptr)) {
        return -1;
    }
    head.extra = out;
    head.extra_max = len;
    head.name = out;
    head.name_max = len;
    head.comment = out;
    head.comm_max = len;
    err = inflateGetHeader(&strm, &head);
    if (!(err != Z_DATA_ERROR)) {
        return -1;
    }
    free(out);
    free(zone);
    return OH_NN_SUCCESS;
}

static int ProcessInflateInitTest(z_stream *strm)
{
    int err = inflateInit(strm);
    if (err != Z_OK) {
        return -1;
    }
    err = inflatePrime(strm, G_PRIME_BITS, G_PRIME_VALUE);
    if (err != Z_OK) {
        return -1;
    }
    err = inflatePrime(strm, G_PRIME_BITS_NEG, 0);
    if (err != Z_OK) {
        return -1;
    }
    err = inflateSetDictionary(strm, nullptr, 0);
    if (err != Z_STREAM_ERROR) {
        return -1;
    }
    err = inflateEnd(strm);
    if (err != Z_OK) {
        return -1;
    }
    strm->avail_in = 0;
    strm->next_in = nullptr;
    err = inflateInit_(strm, ZLIB_VERSION - 1, static_cast<int>(sizeof(z_stream)));
    if (err != Z_VERSION_ERROR) {
        return -1;
    }

    err = inflateInit2_(strm, G_WINDOW_BITS_8, ZLIB_VERSION - 1,
        static_cast<int>(sizeof(z_stream)));
    if (err != Z_VERSION_ERROR) {
        return -1;
    }

#ifdef Z_PREFIX
    deflate_state state;
    _tr_init(&state);
    _dist_code distCode = SIX;
    _length_code engthCode = FOUR;
    _tr_align trAlign;
    _tr_flush_bits bits;
    _tr_flush_block flushBlock;
    _tr_stored_block storedBlock;
    _tr_tally tally;
#endif
    return OH_NN_SUCCESS;
}

static int InitInflateZone(z_stream *strm, struct MemZone **zone)
{
    *zone = (struct MemZone *)malloc(sizeof(struct MemZone));
    if (*zone == nullptr) {
        return -1;
    }
    (*zone)->first = nullptr;
    (*zone)->total = 0;
    (*zone)->highwater = 0;
    (*zone)->limit = 0;
    (*zone)->notlifo = 0;
    (*zone)->rogue = 0;
    strm->opaque = *zone;
    strm->zalloc = nullptr;
    strm->zfree = nullptr;
    strm->avail_in = 0;
    strm->next_in = nullptr;
    return OH_NN_SUCCESS;
}

int ActsZlibTestInflateInitx(void)
{
    chdir("/data/local/tmp");
    z_stream strm;
    struct MemZone *zone = nullptr;

    if (InitInflateZone(&strm, &zone) != OH_NN_SUCCESS) {
        return -1;
    }

    if (ProcessInflateInitTest(&strm) != OH_NN_SUCCESS) {
        free(zone);
        return -1;
    }
    free(zone);
    return OH_NN_SUCCESS;
}

int ActsZlibTestInflatePrime(void)
{
    chdir("/data/local/tmp");
    int ret;
    z_stream strm;
    struct MemZone *zone;
    zone = (struct MemZone *)malloc(sizeof(struct MemZone));
    if (!(zone != nullptr)) {
        return -1;
    }
    zone->first = nullptr;
    zone->total = 0;
    zone->highwater = 0;
    zone->limit = 0;
    zone->notlifo = 0;
    zone->rogue = 0;
    strm.opaque = zone;
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.avail_in = 0;
    strm.next_in = nullptr;
    ret = inflateInit(&strm);
    if (!(ret == Z_OK)) {
        return -1;
    }
    ret = inflatePrime(&strm, G_PRIME_BITS, G_PRIME_VALUE);
    if (!(ret == Z_OK)) {
        return -1;
    }
    free(zone);
    return OH_NN_SUCCESS;
}

int ActsZlibTestInflateReset(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != nullptr && uncompr != nullptr)) {
        return -1;
    }
    int err = Z_OK;
    int windowBits = G_WINDOW_BITS_8;
    ZStream dStream;
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    dStream.zalloc = nullptr;
    dStream.zfree = nullptr;
    dStream.opaque = nullptr;
    dStream.next_in  = compr;
    dStream.avail_in = G_ZLIB_HEADER_SIZE;
    err = inflateInit(&dStream);
    if (err != Z_OK) {
        return -1;
    }
    dStream.next_out = uncompr;
    dStream.avail_out = static_cast<uInt>(uncomprLen);
    inflate(&dStream, Z_NO_FLUSH);
    err = inflateReset(&dStream);
    if (!(err == Z_OK)) {
        return -1;
    }
    err = inflateResetKeep(&dStream);
    if (!(err == Z_OK)) {
        return -1;
    }
    err = inflateInit2(&dStream, windowBits);
    inflate(&dStream, Z_NO_FLUSH);
    err = inflateReset2(&dStream, windowBits);
    if (!(err == Z_OK)) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

int ActsZlibTestInflateSetDictionary(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != nullptr && uncompr != nullptr)) {
        return -1;
    }

    int err = Z_OK;
    ZStream dStream;
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    dStream.zalloc = nullptr;
    dStream.zfree = nullptr;
    dStream.opaque = nullptr;
    dStream.next_in  = compr;
    dStream.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&dStream);
    if (err != Z_OK) {
        return -1;
    }
    dStream.next_out = uncompr;
    dStream.avail_out = static_cast<uInt>(uncomprLen);
    inflate(&dStream, Z_NO_FLUSH);
    inflateSetDictionary(&dStream,
        reinterpret_cast<const Bytef*>(DICTIONARY),
        static_cast<int>(sizeof(DICTIONARY)));
    err = inflateEnd(&dStream);
    if (err != Z_OK) {
        return -1;
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestInflateSyncPoint(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != nullptr && uncompr != nullptr)) {
        return -1;
    }

    int err = Z_OK;
    z_stream strm;
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.opaque = nullptr;
    strm.next_in  = compr;
    strm.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&strm);
    if (err != Z_OK) {
        return -1;
    }
    strm.next_out = uncompr;
    strm.avail_out = static_cast<uInt>(uncomprLen);
    err = inflateSyncPoint(&strm);
    if (err != Z_OK) {
        return -1;
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}


int ActsZlibTestInflateUndermine(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != Z_NULL && uncompr != Z_NULL)) {
        return -1;
    }

    int err = Z_OK;
    z_stream strm;
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.opaque = nullptr;
    strm.next_in  = compr;
    strm.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&strm);
    if (err != Z_OK) {
        return -1;
    }
    strm.next_out = uncompr;
    strm.avail_out = static_cast<uInt>(uncomprLen);
    err = inflateUndermine(&strm, G_ENABLE_FLAG);
    if (err != Z_DATA_ERROR) {
        return -1;
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestInflateValidate(void)
{
    chdir("/data/local/tmp");
    Byte *compr;
    Byte *uncompr;
    uLong comprLen = BUFFER_SIZE_FACTOR * sizeof(int);
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(
        static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(
        static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    if (!(compr != Z_NULL && uncompr != Z_NULL)) {
        return -1;
    }
    int err = Z_OK;
    ZStream dStream;
    std::copy(std::begin(GARBAGE_DATA), std::end(GARBAGE_DATA), reinterpret_cast<char*>(uncompr));
    dStream.zalloc = nullptr;
    dStream.zfree = nullptr;
    dStream.opaque = nullptr;
    dStream.next_in  = compr;
    dStream.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&dStream);
    if (err != Z_OK) {
        return -1;
    }
    dStream.next_out = uncompr;
    dStream.avail_out = static_cast<uInt>(uncomprLen);
    err = inflateValidate(&dStream, G_ENABLE_FLAG);
    if (err != Z_OK) {
        return -1;
    }
    free(compr);
    free(uncompr);
    return OH_NN_SUCCESS;
}

int ActsZlibTestzlibCompileFlags(void)
{
    chdir("/data/local/tmp");
    static const char* myVersion = ZLIB_VERSION;
    if (zlibVersion()[0] != myVersion[0]) {
        if (!false) {
            return -1;
        }
    } else if (strcmp(zlibVersion(), ZLIB_VERSION)) {
    }
    return OH_NN_SUCCESS;
}

int ActsZlibTestzError(void)
{
    chdir("/data/local/tmp");
    const char* err;
    err = zError(Z_DATA_ERROR);
    if (strcmp(err, "data error") != 0) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

int ActsZlibTestzlibVersion(void)
{
    chdir("/data/local/tmp");
    static const char* myVersion = ZLIB_VERSION;
    static const char* err;
    err = zlibVersion();
    if (strcmp(err, myVersion) != 0) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

int ActsZlibTestGzdopen(void)
{
    chdir("/data/local/tmp");
    std::lock_guard<std::mutex> lock(g_fileMutex);
    FILE *fp = fopen(TEST_FILE, "r");
    int fd = fileno(fp);
    gzFile file = gzdopen(fd, "r");
    if (!(file != nullptr)) {
        return -1;
    }
    int err = gzeof(file);
    gzclose(file);
    return OH_NN_SUCCESS;
}

inline napi_property_descriptor DeclareNapiMethod(const char* name, napi_callback func)
{
    return { name, 0, func, 0, 0, 0, napi_default, 0 };
}

static napi_value RunTest(napi_env env, napi_callback_info info, int (*testFunc)(void))
{
    int result = testFunc();
    napi_value output;
    napi_create_int32(env, result, &output);
    return output;
}

template<int (*Func)()>
static napi_value Wrapper(napi_env env, napi_callback_info info) {
    return RunTest(env, info, Func);
}

static napi_property_descriptor NAPI_METHODS[] = {
    DeclareNapiMethod("ActsZlibTestCompress", Wrapper<ActsZlibTestCompress>),
    DeclareNapiMethod("ActsZlibTestGzio", Wrapper<ActsZlibTestGzio>),
    DeclareNapiMethod("ActsZlibTestDeflate", Wrapper<ActsZlibTestDeflate>),
    DeclareNapiMethod("ActsZlibTestInflate", Wrapper<ActsZlibTestInflate>),
    DeclareNapiMethod("ActsZlibTestLargeDeflate", Wrapper<ActsZlibTestLargeDeflate>),
    DeclareNapiMethod("ActsZlibTestLargeInflate", Wrapper<ActsZlibTestLargeInflate>),
    DeclareNapiMethod("ActsZlibTestFlush", Wrapper<ActsZlibTestFlush>),
    DeclareNapiMethod("ActsZlibTestSync", Wrapper<ActsZlibTestSync>),
    DeclareNapiMethod("ActsZlibTestDictDeflate", Wrapper<ActsZlibTestDictDeflate>),
    DeclareNapiMethod("ActsZlibTestDictInflate", Wrapper<ActsZlibTestDictInflate>),
    DeclareNapiMethod("ActsZlibTestCompress2", Wrapper<ActsZlibTestCompress2>),
    DeclareNapiMethod("ActsZlibTestAdler", Wrapper<ActsZlibTestAdler>),
    DeclareNapiMethod("ActsZlibTestDeflateState", Wrapper<ActsZlibTestDeflateState>),
    DeclareNapiMethod("ActsZlibTestDeflateBound", Wrapper<ActsZlibTestDeflateBound>),
    DeclareNapiMethod("ActsZlibTestCRC", Wrapper<ActsZlibTestCRC>),
    DeclareNapiMethod("ActsZlibTestGetCrcTable", Wrapper<ActsZlibTestGetCrcTable>),
    DeclareNapiMethod("ActsZlibTestGzBuffer", Wrapper<ActsZlibTestGzBuffer>),
    DeclareNapiMethod("ActsZlibTestGzFlush", Wrapper<ActsZlibTestGzFlush>),
    DeclareNapiMethod("ActsZlibTestGzFread", Wrapper<ActsZlibTestGzFread>),
    DeclareNapiMethod("ActsZlibTestGzWrite", Wrapper<ActsZlibTestGzWrite>),
    DeclareNapiMethod("ActsZlibTestGzGetc", Wrapper<ActsZlibTestGzGetc>),
    DeclareNapiMethod("ActsZlibTestGzUnGetc", Wrapper<ActsZlibTestGzUnGetc>),
    DeclareNapiMethod("ActsZlibTestGzGetcx", Wrapper<ActsZlibTestGzGetcx>),
    DeclareNapiMethod("ActsZlibTestGzGets", Wrapper<ActsZlibTestGzGets>),
    DeclareNapiMethod("ActsZlibTestGzOffset64", Wrapper<ActsZlibTestGzOffset64>),
    DeclareNapiMethod("ActsZlibTestGzOpen", Wrapper<ActsZlibTestGzOpen>),
    DeclareNapiMethod("ActsZlibTestGzPrintf", Wrapper<ActsZlibTestGzPrintf>),
    DeclareNapiMethod("ActsZlibTestGzPutc", Wrapper<ActsZlibTestGzPutc>),
    DeclareNapiMethod("ActsZlibTestGzPuts", Wrapper<ActsZlibTestGzPuts>),
    DeclareNapiMethod("ActsZlibTestGzRead", Wrapper<ActsZlibTestGzRead>),
    DeclareNapiMethod("ActsZlibTestGzRewind", Wrapper<ActsZlibTestGzRewind>),
    DeclareNapiMethod("ActsZlibTestGzseek", Wrapper<ActsZlibTestGzseek>),
    DeclareNapiMethod("ActsZlibTestGzSetParams", Wrapper<ActsZlibTestGzSetParams>),
    DeclareNapiMethod("ActsZlibTestGzTell", Wrapper<ActsZlibTestGzTell>),
    DeclareNapiMethod("ActsZlibTestGzVprintf", Wrapper<ActsZlibTestGzVprintf>),
    DeclareNapiMethod("ActsZlibTestGzwrite", Wrapper<ActsZlibTestGzwrite>),
    DeclareNapiMethod("ActsZlibTestGzInflateBack", Wrapper<ActsZlibTestGzInflateBack>),
    DeclareNapiMethod("ActsZlibTestInflateCodesUsed", Wrapper<ActsZlibTestInflateCodesUsed>),
    DeclareNapiMethod("ActsZlibTestInflateCopyEnd", Wrapper<ActsZlibTestInflateCopyEnd>),
    DeclareNapiMethod("ActsZlibTestInflateGetDictionary", Wrapper<ActsZlibTestInflateGetDictionary>),
    DeclareNapiMethod("ActsZlibTestInflateGetHeader", Wrapper<ActsZlibTestInflateGetHeader>),
    DeclareNapiMethod("ActsZlibTestInflateInitx", Wrapper<ActsZlibTestInflateInitx>),
    DeclareNapiMethod("ActsZlibTestInflatePrime", Wrapper<ActsZlibTestInflatePrime>),
    DeclareNapiMethod("ActsZlibTestInflateReset", Wrapper<ActsZlibTestInflateReset>),
    DeclareNapiMethod("ActsZlibTestInflateSetDictionary", Wrapper<ActsZlibTestInflateSetDictionary>),
    DeclareNapiMethod("ActsZlibTestInflateSyncPoint", Wrapper<ActsZlibTestInflateSyncPoint>),
    DeclareNapiMethod("ActsZlibTestInflateUndermine", Wrapper<ActsZlibTestInflateUndermine>),
    DeclareNapiMethod("ActsZlibTestInflateValidate", Wrapper<ActsZlibTestInflateValidate>),
    DeclareNapiMethod("ActsZlibTestzlibCompileFlags", Wrapper<ActsZlibTestzlibCompileFlags>),
    DeclareNapiMethod("ActsZlibTestzError", Wrapper<ActsZlibTestzError>),
    DeclareNapiMethod("ActsZlibTestzlibVersion", Wrapper<ActsZlibTestzlibVersion>),
    DeclareNapiMethod("ActsZlibTestGzdopen", Wrapper<ActsZlibTestGzdopen>),
};

static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(NAPI_METHODS) / sizeof(NAPI_METHODS[0]), NAPI_METHODS);
    return exports;
}

static __attribute__((constructor)) void RegisterModule(void)
{
    static napi_module module = {
        .nm_version = 1,
        .nm_flags = 0,
        .nm_filename = nullptr,
        .nm_register_func = Init,
        .nm_modname = "entry",
        .nm_priv = nullptr,
        .reserved = { 0 },
    };
    napi_module_register(&module);
}