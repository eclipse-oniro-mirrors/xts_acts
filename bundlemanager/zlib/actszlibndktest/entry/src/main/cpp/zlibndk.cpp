/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "native_common.h"
#include "zconf.h"
#include "zlib.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>

#define NO_ERR 0
#define SUCCESS 1
#define FAIL -1

struct mem_zone {
    struct mem_item *first;
    size_t total, highwater;
    size_t limit;
    int notlifo, rogue;
};

static const char DICTIONARY[] = "hello";
static unsigned int CALLOC_SIZE = 1;
static thread_local char HELLO[] = "hello, hello!";
static const char GARBAGE[] = "garbage";
static int GARBAGE_LEN = strlen(GARBAGE) + 1;
static const char TESTFILE[] = "/data/storage/el2/base/files/test.txt";
static int VALUE_ZERO = 0;
static int VALUE_ONE = 1;
static int VALUE_TWO = 2;
static int VALUE_THREE = 3;
static int VALUE_FOUR = 4;
static int VALUE_FIVE = 5;
static int VALUE_SIX = 6;
static int VALUE_EIGHT = 8;
static int VALUE_FOURTEEN = 14;
static int VALUE_FIFTEEN = 15;
static int VALUE_TWENTYSEVEN = 27;
static int VALUE_THIRTYONE = 31;
static int STREAM_STATE = -65536;
static unsigned BUFFER_SIZE = 8192;

static napi_value Crc32(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t bufferType;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &bufferType));

    uLong err = Z_ERRNO;
    if (bufferType == Z_NULL) {
        err = crc32(0L, Z_NULL, 0);
    } else {
        const Bytef *buf = reinterpret_cast<const Bytef *>(DICTIONARY);
        err = crc32(0L, buf, 0);
    }

    NAPI_ASSERT(env, err == Z_OK, "crc32 error");

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Crc32_z(napi_env env, napi_callback_info info)
{
    uLong err = Z_ERRNO;
    const Bytef *buf = reinterpret_cast<const Bytef *>(DICTIONARY);
    err = crc32_z(0L, buf, 0);
    NAPI_ASSERT(env, err == Z_OK, "crc32_z error");

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Crc32Combine(napi_env env, napi_callback_info info)
{
    uLong err = Z_ERRNO;
    err = crc32_combine(0L, 0L, 0);
    NAPI_ASSERT(env, err == Z_OK, "crc32_combine error");

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Adler32(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t bufferType;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &bufferType));

    uLong err = Z_ERRNO;
    if (bufferType == Z_NULL) {
        err = adler32(0L, Z_NULL, 0);
        NAPI_ASSERT(env, err == VALUE_ONE, "adler32 error");
    } else {
        const Bytef *buf = reinterpret_cast<const Bytef *>(DICTIONARY);
        err = adler32(0L, buf, 0);
        NAPI_ASSERT(env, err == Z_OK, "adler32 error");
    }

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Adler32_z(napi_env env, napi_callback_info info)
{
    uLong err = Z_ERRNO;
    const Bytef *buf = reinterpret_cast<const Bytef *>(DICTIONARY);
    err = adler32_z(0L, buf, 0);
    NAPI_ASSERT(env, err == Z_OK, "adler32_z error");

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Adler32Combine(napi_env env, napi_callback_info info)
{
    uLong expect = 65520;
    uLong err = Z_ERRNO;
    err = adler32_combine(0L, 0L, 0);
    NAPI_ASSERT(env, err == expect, "adler32_combine error");

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Deflate(napi_env env, napi_callback_info info)
{
    Byte *comp;
    uLong compLen = 100 * sizeof(int);
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != nullptr, "comp is nullptr");

    z_stream c_stream;
    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + VALUE_ONE;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit(&c_stream, Z_DEFAULT_COMPRESSION);
    NAPI_ASSERT(env, err == Z_OK, "deflateInit error");

    c_stream.next_in = reinterpret_cast<z_const unsigned char *>(HELLO);
    c_stream.next_out = comp;
    while (c_stream.total_in != len && c_stream.total_out < compLen) {
        c_stream.avail_in = c_stream.avail_out = VALUE_ONE;
        err = deflate(&c_stream, Z_NO_FLUSH);
        NAPI_ASSERT(env, err == Z_OK, "deflate Z_NO_FLUSH error");
    }

    for (;;) {
        c_stream.avail_out = VALUE_ONE;
        err = deflate(&c_stream, Z_FINISH);
        if (err == Z_STREAM_END) {
            break;
        }
        NAPI_ASSERT(env, err == Z_OK, "deflate Z_FINISH error");
    }

    err = deflateEnd(&c_stream);
    NAPI_ASSERT(env, err == Z_OK, "deflateEnd error");
    free(comp);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateFullFlush(napi_env env, napi_callback_info info)
{
    Byte *comp;
    uLong compLen = 100 * sizeof(int);
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != nullptr, "comp is nullptr");

    z_stream c_stream;
    int err = Z_OK;
    uInt len = static_cast<uInt>(strlen(HELLO)) + VALUE_ONE;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit(&c_stream, Z_DEFAULT_COMPRESSION);
    NAPI_ASSERT(env, err == Z_OK, "deflateInit error");

    int changeLen = VALUE_THREE;
    c_stream.next_in = reinterpret_cast<z_const unsigned char *>(HELLO);
    c_stream.next_out = comp;
    c_stream.avail_in = changeLen;
    c_stream.avail_out = static_cast<uInt>(compLen);
    err = deflate(&c_stream, Z_FULL_FLUSH);
    NAPI_ASSERT(env, err == Z_OK, "deflate error");

    comp[changeLen]++;
    c_stream.avail_in = len - changeLen;
    err = deflate(&c_stream, Z_FINISH);
    if (err != Z_STREAM_END) {
        NAPI_ASSERT(env, err == Z_OK, "deflate error");
    }

    err = deflateEnd(&c_stream);
    NAPI_ASSERT(env, err == Z_OK, "deflateEnd error");
    compLen = c_stream.total_out;
    free(comp);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateBound(napi_env env, napi_callback_info info)
{
    z_stream defstream;
    char *inBuf = reinterpret_cast<char *>(HELLO);
    uint32_t inLen = strlen(inBuf) + VALUE_ONE;
    uint8_t *outBuf = nullptr;
    uint32_t outLen = VALUE_ZERO;
    int err = Z_OK;

    defstream.zalloc = nullptr;
    defstream.zfree = nullptr;
    defstream.opaque = nullptr;
    defstream.avail_in = static_cast<uInt>(inLen);
    defstream.next_in = reinterpret_cast<Bytef *>(inBuf);
    defstream.avail_out = static_cast<uInt>(outLen);
    defstream.next_out = reinterpret_cast<Bytef *>(outBuf);
    err = deflateInit_(&defstream, Z_DEFAULT_COMPRESSION, ZLIB_VERSION, static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit_ error");
    uint32_t estimateLen = deflateBound(&defstream, inLen);
    NAPI_ASSERT(env, estimateLen == VALUE_TWENTYSEVEN, "deflateCopy error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Compress(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t expect;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &expect));

    Byte *comp;
    uLong compLen = expect == Z_OK ? 100 * sizeof(int) : VALUE_ONE;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");

    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + VALUE_ONE;
    err = compress(comp, &compLen, reinterpret_cast<const Bytef *>(HELLO), len);
    NAPI_ASSERT(env, err == expect, "compress error");

    free(comp);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value CompressBound(napi_env env, napi_callback_info info)
{
    Byte *comp;

    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + VALUE_ONE;
    uLong compLen = compressBound(len);
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");

    err = compress(comp, &compLen, reinterpret_cast<const Bytef *>(HELLO), len);
    NAPI_ASSERT(env, err == Z_OK, "compress error");

    free(comp);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Compress2(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t CompressType;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &CompressType));
    uint32_t expect;
    NAPI_CALL(env, napi_get_value_uint32(env, args[1], &expect));

    Byte *comp;
    uLong compLen = expect == Z_OK ? 100 * sizeof(int) : VALUE_ONE;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");

    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + VALUE_ONE;
    err = compress2(comp, &compLen, reinterpret_cast<const Bytef *>(HELLO), len, CompressType);
    NAPI_ASSERT(env, err == expect, "compress error");

    free(comp);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value UnCompress(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t expect;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &expect));

    Byte *comp;
    uLong compLen = 100 * sizeof(int);
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");

    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + VALUE_ONE;
    err = compress(comp, &compLen, reinterpret_cast<const Bytef *>(HELLO), len);
    NAPI_ASSERT(env, err == Z_OK, "compress error");

    Byte *unComp;
    uLong unCompLen = compLen;
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(unCompLen), CALLOC_SIZE));
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    if (expect == Z_BUF_ERROR) {
        unCompLen = VALUE_ONE;
        err = uncompress(unComp, &unCompLen, comp, compLen);
    } else if (expect == Z_DATA_ERROR) {
        err = uncompress(unComp, &unCompLen, comp, VALUE_ONE);
    } else {
        err = uncompress(unComp, &unCompLen, comp, compLen);
    }
    NAPI_ASSERT(env, err == expect, "uncompress error");

    free(comp);
    free(unComp);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value ZLibVersion(napi_env env, napi_callback_info info)
{
    static const char *myVersion = ZLIB_VERSION;
    static const char *err;
    err = zlibVersion();
    NAPI_ASSERT(env, err == myVersion, "zlibVersion error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value ZLibCompileFlags(napi_env env, napi_callback_info info)
{
    uLong ret = zlibCompileFlags();
    NAPI_ASSERT(env, ret >= NO_ERR, "zlibVersion error");
    napi_value result = nullptr;
    napi_create_uint32(env, SUCCESS, &result);
    return result;
}

static napi_value ZError(napi_env env, napi_callback_info info)
{
    const char *err;
    err = zError(Z_DATA_ERROR);
    napi_value result = nullptr;
    napi_create_string_utf8(env, err, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value UnCompress2(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t expect;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &expect));

    Byte *comp;
    uLong compLen = 100 * sizeof(int);
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");

    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + VALUE_ONE;
    err = compress2(comp, &compLen, reinterpret_cast<const Bytef *>(HELLO), len, Z_BEST_COMPRESSION);
    NAPI_ASSERT(env, err == Z_OK, "compress2 error");

    Byte *unComp;
    uLong unCompLen = compLen;
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(unCompLen), CALLOC_SIZE));
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    if (expect == Z_BUF_ERROR) {
        unCompLen = VALUE_ONE;
        err = uncompress2(unComp, &unCompLen, comp, &compLen);
    } else if (expect == Z_DATA_ERROR) {
        compLen = VALUE_ONE;
        err = uncompress2(unComp, &unCompLen, comp, &compLen);
    } else {
        err = uncompress2(unComp, &unCompLen, comp, &compLen);
    }
    NAPI_ASSERT(env, err == expect, "uncompress2 error");

    free(comp);
    free(unComp);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateValidate(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong compLen = 100 * sizeof(int);
    uLong unCompLen = compLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(unCompLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");
    int err = Z_OK;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = static_cast<uInt>(compLen);
    err = inflateInit(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    d_stream.next_out = unComp;
    d_stream.avail_out = static_cast<uInt>(unCompLen);
    err = inflateValidate(&d_stream, VALUE_ONE);
    NAPI_ASSERT(env, err == Z_OK, "inflateValidate error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateUndermine(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");
    int err = Z_OK;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    d_stream.next_out = unComp;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);
    err = inflateUndermine(&d_stream, VALUE_ONE);
    NAPI_ASSERT(env, err == Z_DATA_ERROR, "inflateUndermine OK");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateSyncPoint(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    int err = Z_OK;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    d_stream.next_out = unComp;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);
    err = inflateSyncPoint(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateSyncPoint error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateSetDictionary(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    int err = Z_OK;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    d_stream.next_out = unComp;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);
    inflate(&d_stream, Z_NO_FLUSH);
    inflateSetDictionary(&d_stream, reinterpret_cast<const Bytef *>(DICTIONARY), static_cast<int>(sizeof(DICTIONARY)));
    err = inflateEnd(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateEnd error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateSync(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    int err = Z_OK;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = VALUE_TWO;
    err = inflateInit(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");

    d_stream.next_out = unComp;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);

    inflate(&d_stream, Z_NO_FLUSH);
    d_stream.avail_in = static_cast<uInt>(comprLen) - VALUE_TWO;
    inflateSync(&d_stream);
    inflate(&d_stream, Z_FINISH);
    err = inflateEnd(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateEnd error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateResetKeep(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");
    int err = Z_OK;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = VALUE_TWO;
    err = inflateInit(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    d_stream.next_out = unComp;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);
    inflate(&d_stream, Z_NO_FLUSH);
    err = inflateResetKeep(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateResetKeep error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateReset2(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");
    int err = Z_OK;
    int windowBits = VALUE_EIGHT;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = VALUE_TWO;
    err = inflateInit(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    d_stream.next_out = unComp;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);
    err = inflateInit2(&d_stream, windowBits);
    inflate(&d_stream, Z_NO_FLUSH);
    err = inflateReset2(&d_stream, windowBits);
    NAPI_ASSERT(env, err == Z_OK, "inflateReset2 error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
static napi_value InflateReset(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");
    int err = Z_OK;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = VALUE_TWO;
    err = inflateInit(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    d_stream.next_out = unComp;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);
    inflate(&d_stream, Z_NO_FLUSH);
    err = inflateReset(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateReset error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflatePrime(napi_env env, napi_callback_info info)
{
    int ret;
    z_stream strm;
    struct mem_zone *zone;
    zone = (struct mem_zone *)malloc(sizeof(struct mem_zone));
    NAPI_ASSERT(env, zone != Z_NULL, "zone is Z_NULL");
    zone->first = nullptr;
    zone->total = VALUE_ZERO;
    zone->highwater = VALUE_ZERO;
    zone->limit = VALUE_ZERO;
    zone->notlifo = VALUE_ZERO;
    zone->rogue = VALUE_ZERO;
    strm.opaque = zone;
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.avail_in = VALUE_ZERO;
    strm.next_in = nullptr;
    ret = inflateInit(&strm);
    NAPI_ASSERT(env, ret == Z_OK, "inflateInit error");
    ret = inflatePrime(&strm, VALUE_FIVE, VALUE_THIRTYONE);
    NAPI_ASSERT(env, ret == Z_OK, "inflatePrime error");
    free(zone);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateMark(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    int err = Z_OK;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    d_stream.next_out = unComp;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);
    err = inflate(&d_stream, Z_NO_FLUSH);
    err = inflateGetDictionary(&d_stream, unComp, nullptr);
    NAPI_ASSERT(env, err == Z_OK, "inflateGetDictionary error");
    long mark = inflateMark(&d_stream);
    NAPI_ASSERT(env, mark == STREAM_STATE, "inflateEnd error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateInit2(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    int windowBits = VALUE_EIGHT;
    z_stream strm;
    struct mem_zone *zone;
    zone = (struct mem_zone *)malloc(sizeof(struct mem_zone));
    NAPI_ASSERT(env, zone != Z_NULL, "zone is Z_NULL");
    zone->first = nullptr;
    zone->total = VALUE_ZERO;
    zone->highwater = VALUE_ZERO;
    zone->limit = VALUE_ZERO;
    zone->notlifo = VALUE_ZERO;
    zone->rogue = VALUE_ZERO;
    strm.opaque = zone;
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.avail_in = VALUE_ZERO;
    strm.next_in = nullptr;
    err = inflateInit(&strm);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    err = inflatePrime(&strm, VALUE_FIVE, VALUE_THIRTYONE);
    NAPI_ASSERT(env, err == Z_OK, "inflatePrime error");
    err = inflatePrime(&strm, -1, VALUE_ZERO);
    NAPI_ASSERT(env, err == Z_OK, "inflatePrime error");
    err = inflateSetDictionary(&strm, nullptr, VALUE_ZERO);
    NAPI_ASSERT(env, err == Z_STREAM_ERROR, "inflateSetDictionary error");
    err = inflateEnd(&strm);
    NAPI_ASSERT(env, err == Z_OK, "inflateEnd error");
    strm.avail_in = VALUE_ZERO;
    strm.next_in = nullptr;
    err = inflateInit2_(&strm, windowBits, ZLIB_VERSION - VALUE_ONE, static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_VERSION_ERROR, "inflateInit2_ error");
    free(zone);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateInit(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    z_stream strm;
    struct mem_zone *zone;
    zone = (struct mem_zone *)malloc(sizeof(struct mem_zone));
    NAPI_ASSERT(env, zone != Z_NULL, "zone is Z_NULL");
    zone->first = nullptr;
    zone->total = VALUE_ZERO;
    zone->highwater = VALUE_ZERO;
    zone->limit = VALUE_ZERO;
    zone->notlifo = VALUE_ZERO;
    zone->rogue = VALUE_ZERO;
    strm.opaque = zone;
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.avail_in = VALUE_ZERO;
    strm.next_in = nullptr;
    err = inflateInit(&strm);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    err = inflatePrime(&strm, VALUE_FIVE, VALUE_THIRTYONE);
    NAPI_ASSERT(env, err == Z_OK, "inflatePrime error");
    err = inflatePrime(&strm, -1, VALUE_ZERO);
    NAPI_ASSERT(env, err == Z_OK, "inflatePrime error");
    err = inflateSetDictionary(&strm, nullptr, VALUE_ZERO);
    NAPI_ASSERT(env, err == Z_STREAM_ERROR, "inflateSetDictionary error");
    err = inflateEnd(&strm);
    NAPI_ASSERT(env, err == Z_OK, "inflateEnd error");
    strm.avail_in = VALUE_ZERO;
    strm.next_in = nullptr;
    err = inflateInit_(&strm, ZLIB_VERSION - VALUE_ONE, static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_VERSION_ERROR, "inflateInit_ error");
    free(zone);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateGetHeader(napi_env env, napi_callback_info info)
{
    struct mem_zone *zone;
    zone = (struct mem_zone *)malloc(sizeof(struct mem_zone));
    NAPI_ASSERT(env, zone != Z_NULL, "zone is Z_NULL");
    zone->first = nullptr;
    zone->total = VALUE_ZERO;
    zone->highwater = VALUE_ZERO;
    zone->limit = VALUE_ZERO;
    zone->notlifo = VALUE_ZERO;
    zone->rogue = VALUE_ZERO;
    int err = Z_OK;
    unsigned len = VALUE_ONE;
    unsigned char *out;
    z_stream strm;
    gz_header head;
    strm.opaque = zone;
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.avail_in = VALUE_ZERO;
    strm.next_in = nullptr;
    err = inflateInit2(&strm, VALUE_ONE);
    NAPI_ASSERT(env, err != Z_OK, "inflateInit2 error");
    out = (unsigned char *)malloc(len);
    NAPI_ASSERT(env, out != nullptr, "malloc error");
    head.extra = out;
    head.extra_max = len;
    head.name = out;
    head.name_max = len;
    head.comment = out;
    head.comm_max = len;
    err = inflateGetHeader(&strm, &head);
    NAPI_ASSERT(env, err == Z_STREAM_ERROR, "inflateGetHeader error");
    free(out);
    free(zone);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateGetDictionary(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    int err = Z_OK;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    d_stream.next_out = unComp;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);
    err = inflate(&d_stream, Z_NO_FLUSH);
    err = inflateGetDictionary(&d_stream, unComp, nullptr);
    NAPI_ASSERT(env, err == Z_OK, "inflateGetDictionary error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateEnd(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    err = inflate(nullptr, VALUE_ZERO);
    NAPI_ASSERT(env, err == Z_STREAM_ERROR, "inflate error");
    err = inflateEnd(nullptr);
    NAPI_ASSERT(env, err == Z_STREAM_ERROR, "inflateEnd error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateCopy(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    err = inflate(nullptr, VALUE_ZERO);
    NAPI_ASSERT(env, err == Z_STREAM_ERROR, "inflate error");
    err = inflateCopy(nullptr, nullptr);
    NAPI_ASSERT(env, err == Z_STREAM_ERROR, "inflateCopy error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateCodesUsed(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");
    unsigned long err;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = VALUE_ZERO;
    d_stream.next_out = unComp;
    err = inflateCodesUsed(&d_stream);
    NAPI_ASSERT(env, err != Z_OK, "inflateCodesUsed error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateBackInit(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    unsigned char *window;
    z_stream strm;
    unsigned char match[65280 + 2];
    window = match;
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.opaque = nullptr;
    err = inflateBackInit_(&strm, VALUE_FIFTEEN, window, ZLIB_VERSION, static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "inflateBackInit_ error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
static unsigned pull(void *desc, unsigned char **buf)
{
    static unsigned int next = VALUE_ZERO;
    static unsigned char dat[] = {0x63, 0, 2, 0};

    if (!desc) {
        next = VALUE_ZERO;
        return VALUE_ZERO;
    }
    return next < sizeof(dat) ? (*buf = dat + next++, VALUE_ONE) : 0;
}

static int push(void *desc, unsigned char *buf, unsigned len)
{
    buf += len;
    return desc != nullptr;
}
static napi_value InflateBack(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    unsigned char *window;
    z_stream strm;
    unsigned char match[65280 + 2];
    Byte *cunComp;
    uLong uncomprLen = 100 * sizeof(int);
    cunComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    window = match;
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.opaque = nullptr;
    err = inflateBackInit_(&strm, VALUE_FIFTEEN, window, ZLIB_VERSION, static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "inflateBackInit_ error");
    strm.next_in = cunComp;
    strm.avail_in = VALUE_ONE;
    err = inflateBack(&strm, pull, nullptr, push, &strm);
    NAPI_ASSERT(env, err == Z_BUF_ERROR, "inflateBack error");
    free(cunComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value InflateBackEnd(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    unsigned char *window;
    z_stream strm;
    unsigned char match[65280 + 2];
    Byte *cunComp;
    uLong uncomprLen = 100 * sizeof(int);
    cunComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));

    window = match;
    strm.zalloc = nullptr;
    strm.zfree = nullptr;
    strm.opaque = nullptr;
    err = inflateBackInit_(&strm, VALUE_FIFTEEN, window, ZLIB_VERSION, static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "inflateBackInit_ error");
    strm.next_in = cunComp;
    strm.avail_in = VALUE_ONE;
    err = inflateBackEnd(&strm);
    NAPI_ASSERT(env, err == Z_OK, "inflateBackEnd error");
    free(cunComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Inflate(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    int err = Z_OK;
    z_stream d_stream;
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in = comp;
    d_stream.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&d_stream);
    NAPI_ASSERT(env, err == Z_OK, "inflateInit error");
    d_stream.next_out = unComp;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);
    err = inflate(&d_stream, Z_NO_FLUSH);
    NAPI_ASSERT(env, err == Z_DATA_ERROR, "inflate error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzWrite(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int len = static_cast<int>(strlen(HELLO)) + VALUE_ONE;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    int err = gzwrite(file, HELLO, len);
    NAPI_ASSERT(env, err == len, "gzwrite error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
static int TestGzPrintf(gzFile file, const char *format, ...)
{
    va_list va;
    int ret;

    va_start(va, format);
    ret = gzvprintf(file, format, va);
    va_end(va);
    return ret;
}

static napi_value GzvPrintf(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    int err = TestGzPrintf(file, ", %s!", "hello");
    NAPI_ASSERT(env, err == VALUE_EIGHT, "gzopen error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzUnGetC(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    NAPI_ASSERT(env, gzungetc('a', file) != 'a', "gzungetc error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzTell64(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    gzseek(file, 1L, SEEK_CUR);
    gzclose(file);
    file = gzopen(TESTFILE, "rb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    z_off_t pos;
    pos = gzseek(file, -8L, SEEK_CUR);
    NAPI_ASSERT(env, pos != VALUE_SIX, "gzopen error");
#ifdef Z_LARGE64
    NAPI_ASSERT(env, gztell64(file) != pos, "gzopen error");
#endif
    gzclose(file);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzTell(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    char ret = VALUE_ZERO;
    NAPI_ASSERT(env, gztell(file) == ret, "gzseek error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzSetParams(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int err = Z_OK;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    err = gzsetparams(file, Z_DEFAULT_COMPRESSION, Z_DEFAULT_STRATEGY);
    NAPI_ASSERT(env, err == Z_OK, "gzopen error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzSeek64(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    long err = 0L;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
#ifdef Z_LARGE64
    err = gzseek64(file, 1L, SEEK_CUR);
#endif
    char ret = VALUE_ZERO;
    NAPI_ASSERT(env, err == ret, "gzseek64 error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzSeek(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    long err = 0L;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    err = gzseek(file, 1L, SEEK_CUR);
    NAPI_ASSERT(env, err == 1L, "gzseek error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzRewind(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int err = Z_OK;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    gzseek(file, 0L, SEEK_SET);
    err = gzrewind(file);
    NAPI_ASSERT(env, err == -1, "gzrewind error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzRead(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    NAPI_ASSERT(env, gzungetc('a', file) != 'a', "gzungetc error");
    char sz_read[5] = {0};
    gzread(file, sz_read, VALUE_ONE);
    char ret = VALUE_ZERO;
    NAPI_ASSERT(env, sz_read[0] == ret, "gzread error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzPuts(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    NAPI_ASSERT(env, gzputs(file, "ello") == VALUE_FOUR, "gzputs error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzPutc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char err;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    err = gzputc(file, 'h');
    NAPI_ASSERT(env, err == 'h', "gzputc error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzPrintf(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    NAPI_ASSERT(env, gzprintf(file, ", %s!", "hello") == VALUE_EIGHT, "gzprintf error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzOpenW(napi_env env, napi_callback_info info)
{
#if defined(_WIN32) && !defined(Z_SOLO)
    gzFile file = nullptr;
    file = gzopen_w(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen_w error");
    gzclose(file);
#endif
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzOpen(napi_env env, napi_callback_info info)
{
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    gzclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzOpen64(napi_env env, napi_callback_info info)
{
#ifdef Z_LARGE64
    gzFile file = nullptr;
    file = gzopen64(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen64 error");
    gzclose(file);
#endif
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzOffset64(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    gzFile file;
    file = gzopen(TESTFILE, "rb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
#ifdef Z_LARGE64
    err = gzoffset64(file);
#endif
    NAPI_ASSERT(env, err == Z_OK, "gzoffset64 error");
    gzclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzGets(napi_env env, napi_callback_info info)
{
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    Byte *unComp;
    uLong uncomprLen = 100 * sizeof(int);
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    gzgets(file, reinterpret_cast<char *>(unComp), static_cast<int>(uncomprLen));
    NAPI_ASSERT(env, strcmp(reinterpret_cast<char *>(unComp), HELLO + VALUE_SIX), "gzgets error");
    gzclose(file);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzGetC_(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    err = gzgetc_(file);
    NAPI_ASSERT(env, err == FAIL, "gzgetc_ error");
    gzclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzGetC(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    err = gzgetc(file);
    NAPI_ASSERT(env, err == FAIL, "gzgetc error");
    gzclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzFWrite(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    int len = static_cast<int>(strlen(HELLO)) + VALUE_ONE;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    err = gzfwrite(HELLO, len, len, file);
    NAPI_ASSERT(env, err == len, "gzfwrite error");
    gzclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzFRead(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    int len = static_cast<int>(strlen(HELLO)) + VALUE_ONE;
    gzFile file;
    file = gzopen(TESTFILE, "rb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    err = gzfread(HELLO, len, len, file);
    NAPI_ASSERT(env, err == VALUE_FOURTEEN, "gzfread error");
    gzclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzFlush(napi_env env, napi_callback_info info)
{
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");

    gzputc(file, 'h');
    NAPI_ASSERT(env, gzputs(file, "ello") == VALUE_FOUR, "gzopen error");
    if (gzprintf(file, ", %s!", "hello") != VALUE_EIGHT) {
        NAPI_ASSERT(env, false, "gzprintf error");
    }
    gzseek(file, 1L, SEEK_CUR);
    gzflush(file, Z_FINISH);
    gzclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzError(napi_env env, napi_callback_info info)
{
    int err = Z_OK;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");

    const char *error = gzerror(file, &err);
    NAPI_ASSERT(env, error != nullptr, "gzopen error");
    gzclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzEof(napi_env env, napi_callback_info info)
{
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    int err = gzeof(file);
    NAPI_ASSERT(env, err == VALUE_ZERO, "gzdopen error");
    gzclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzDOpen(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(TESTFILE, "r");
    NAPI_ASSERT(env, fp != nullptr, "fopen error");
    int fd = fileno(fp);
    gzFile file = gzdopen(fd, "r");
    NAPI_ASSERT(env, file != nullptr, "gzdopen error");
    fclose(fp);
    gzclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzDirect(napi_env env, napi_callback_info info)
{
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    int res = gzdirect(file);
    NAPI_ASSERT(env, res == VALUE_ZERO, "gzdirect error");
    gzclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzCloseW(napi_env env, napi_callback_info info)
{
    gzFile file;
    int err = Z_OK;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    gzclearerr(file);
    err = gzclose_w(file);
    NAPI_ASSERT(env, err == Z_OK, "gzclose_w error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzCloseR(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    gzFile file;
    int err = Z_OK;
    file = gzopen(TESTFILE, "rb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    err = gzclose_r(file);
    NAPI_ASSERT(env, err == Z_OK, "gzclose_r error");
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzClearErr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    gzFile file;
    int err = Z_OK;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    err = gzbuffer(file, BUFFER_SIZE);
    NAPI_ASSERT(env, err == Z_OK, "gzbuffer error");
    gzclearerr(file);
    err = gzclose_w(file);
    NAPI_ASSERT(env, err == Z_OK, "gzclose_w error");
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzClose(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int err = Z_OK;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");
    err = gzclose(file);
    NAPI_ASSERT(env, err == Z_OK, "gzopen error");
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GzBuffer(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int err = Z_OK;
    gzFile file;
    file = gzopen(TESTFILE, "wb");
    NAPI_ASSERT(env, file != nullptr, "gzopen error");

    err = gzbuffer(file, BUFFER_SIZE);
    NAPI_ASSERT(env, err == Z_OK, "gzopen error");
    gzclose(file);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value GetCrcTable(napi_env env, napi_callback_info info)
{
    auto table = get_crc_table();
    NAPI_ASSERT(env, table != nullptr, "get_crc_table error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateTune(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    gz_headerp headerp = nullptr;
    z_stream c_stream;
    int err = Z_OK;
    int windowBits = VALUE_EIGHT;
    int memLevel = VALUE_EIGHT;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit2_(&c_stream, Z_BEST_COMPRESSION, Z_DEFLATED, windowBits, memLevel, Z_FILTERED, ZLIB_VERSION,
                        static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit2_ error");
    deflateSetHeader(&c_stream, headerp);
    err = deflateTune(&c_stream, VALUE_ONE, VALUE_FOUR, VALUE_EIGHT, VALUE_ONE);
    NAPI_ASSERT(env, err == Z_OK, "deflateTune error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateSetHeader(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    gz_headerp headerp = nullptr;
    z_stream c_stream;
    int err = Z_OK;
    int windowBits = VALUE_EIGHT;
    int memLevel = VALUE_EIGHT;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit2_(&c_stream, Z_BEST_COMPRESSION, Z_DEFLATED, windowBits, memLevel, Z_FILTERED, ZLIB_VERSION,
                        static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit2_ error");
    err = deflateSetHeader(&c_stream, headerp);
    NAPI_ASSERT(env, err == Z_STREAM_ERROR, "deflateSetHeader error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateSetDictionary(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    z_stream c_stream;
    int err = Z_OK;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit(&c_stream, Z_BEST_COMPRESSION);
    NAPI_ASSERT(env, err == Z_OK, "deflateInit error");
    err = deflateSetDictionary(&c_stream, reinterpret_cast<const Bytef *>(DICTIONARY),
                               static_cast<int>(sizeof(DICTIONARY)));
    NAPI_ASSERT(env, err == Z_OK, "deflateSetDictionary error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateResetKeep(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    int *bits = nullptr;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    gz_headerp headerp = nullptr;
    z_stream c_stream;
    int err = Z_OK;
    int windowBits = VALUE_EIGHT;
    int memLevel = VALUE_EIGHT;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit2_(&c_stream, Z_BEST_COMPRESSION, Z_DEFLATED, windowBits, memLevel, Z_FILTERED, ZLIB_VERSION,
                        static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit2_ error");
    deflateSetHeader(&c_stream, headerp);
    deflateTune(&c_stream, VALUE_ONE, VALUE_FOUR, VALUE_EIGHT, VALUE_ONE);
    memLevel = VALUE_ONE;
    err = deflateParams(&c_stream, memLevel, Z_DEFAULT_STRATEGY);
    NAPI_ASSERT(env, err == Z_OK, "deflateParams error");
    err = deflatePending(&c_stream, nullptr, bits);
    NAPI_ASSERT(env, err == Z_OK, "deflatePending error");
    err = deflateSetDictionary(&c_stream, reinterpret_cast<const Bytef *>(DICTIONARY),
                               static_cast<int>(sizeof(DICTIONARY)));
    NAPI_ASSERT(env, err == Z_OK, "deflateSetDictionary error");
    err = deflateGetDictionary(&c_stream, unComp, nullptr);
    err = deflatePrime(&c_stream, VALUE_EIGHT, VALUE_ONE);
    c_stream.next_out = comp;
    c_stream.avail_out = static_cast<uInt>(comprLen);
    c_stream.next_in = reinterpret_cast<z_const unsigned char *>(HELLO);
    c_stream.avail_in = static_cast<uInt>(strlen(HELLO)) + VALUE_ONE;
    err = deflate(&c_stream, Z_FINISH);
    NAPI_ASSERT(env, err == Z_STREAM_END, "deflate error");
    err = deflateEnd(&c_stream);
    NAPI_ASSERT(env, err == Z_OK, "deflateEnd error");
    err = deflateResetKeep(&c_stream);
    NAPI_ASSERT(env, err == Z_STREAM_ERROR, "deflateResetKeep error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateReset(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    int *bits = nullptr;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    gz_headerp headerp = nullptr;
    z_stream c_stream;
    int err = Z_OK;
    int windowBits = VALUE_EIGHT;
    int memLevel = VALUE_EIGHT;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit2_(&c_stream, Z_BEST_COMPRESSION, Z_DEFLATED, windowBits, memLevel, Z_FILTERED, ZLIB_VERSION,
                        static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit2_ error");
    deflateSetHeader(&c_stream, headerp);
    deflateTune(&c_stream, VALUE_ONE, VALUE_FOUR, VALUE_EIGHT, VALUE_ONE);
    memLevel = VALUE_ONE;
    err = deflateParams(&c_stream, memLevel, Z_DEFAULT_STRATEGY);
    NAPI_ASSERT(env, err == Z_OK, "deflateParams error");
    err = deflatePending(&c_stream, nullptr, bits);
    NAPI_ASSERT(env, err == Z_OK, "deflatePending error");
    err = deflateSetDictionary(&c_stream, reinterpret_cast<const Bytef *>(DICTIONARY),
                               static_cast<int>(sizeof(DICTIONARY)));
    NAPI_ASSERT(env, err == Z_OK, "deflateSetDictionary error");
    err = deflateGetDictionary(&c_stream, unComp, nullptr);
    err = deflatePrime(&c_stream, VALUE_EIGHT, VALUE_ONE);
    c_stream.next_out = comp;
    c_stream.avail_out = static_cast<uInt>(comprLen);
    c_stream.next_in = reinterpret_cast<z_const unsigned char *>(HELLO);
    c_stream.avail_in = static_cast<uInt>(strlen(HELLO)) + VALUE_ONE;
    err = deflate(&c_stream, Z_FINISH);
    NAPI_ASSERT(env, err == Z_STREAM_END, "deflate error");
    err = deflateEnd(&c_stream);
    NAPI_ASSERT(env, err == Z_OK, "deflateEnd error");
    err = deflateReset(&c_stream);
    NAPI_ASSERT(env, err == Z_STREAM_ERROR, "deflateReset error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflatePrime(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    int *bits = nullptr;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    gz_headerp headerp = nullptr;
    z_stream c_stream;
    int err = Z_OK;
    int windowBits = VALUE_EIGHT;
    int memLevel = VALUE_EIGHT;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit2_(&c_stream, Z_BEST_COMPRESSION, Z_DEFLATED, windowBits, memLevel, Z_FILTERED, ZLIB_VERSION,
                        static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit2_ error");
    deflateSetHeader(&c_stream, headerp);
    deflateTune(&c_stream, VALUE_ONE, VALUE_FOUR, VALUE_EIGHT, VALUE_ONE);
    memLevel = VALUE_ONE;
    err = deflateParams(&c_stream, memLevel, Z_DEFAULT_STRATEGY);
    NAPI_ASSERT(env, err == Z_OK, "deflateParams error");
    err = deflatePending(&c_stream, nullptr, bits);
    NAPI_ASSERT(env, err == Z_OK, "deflatePending error");
    err = deflateSetDictionary(&c_stream, reinterpret_cast<const Bytef *>(DICTIONARY),
                               static_cast<int>(sizeof(DICTIONARY)));
    NAPI_ASSERT(env, err == Z_OK, "deflateSetDictionary error");
    err = deflateGetDictionary(&c_stream, unComp, nullptr);
    err = deflatePrime(&c_stream, VALUE_EIGHT, VALUE_ONE);
    NAPI_ASSERT(env, err == Z_OK, "deflatePrime error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflatePending(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    int *bits = nullptr;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    gz_headerp headerp = nullptr;
    z_stream c_stream;
    int err = Z_OK;
    int windowBits = VALUE_EIGHT;
    int memLevel = VALUE_EIGHT;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit2_(&c_stream, Z_BEST_COMPRESSION, Z_DEFLATED, windowBits, memLevel, Z_FILTERED, ZLIB_VERSION,
                        static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit2_ error");
    deflateSetHeader(&c_stream, headerp);
    deflateTune(&c_stream, VALUE_ONE, VALUE_FOUR, VALUE_EIGHT, VALUE_ONE);
    memLevel = VALUE_ONE;
    err = deflateParams(&c_stream, memLevel, Z_DEFAULT_STRATEGY);
    NAPI_ASSERT(env, err == Z_OK, "deflateParams error");
    err = deflatePending(&c_stream, nullptr, bits);
    NAPI_ASSERT(env, err == Z_OK, "deflatePending error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateParams(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    gz_headerp headerp = nullptr;
    z_stream c_stream;
    int err = Z_OK;
    int windowBits = VALUE_EIGHT;
    int memLevel = VALUE_EIGHT;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit2_(&c_stream, Z_BEST_COMPRESSION, Z_DEFLATED, windowBits, memLevel, Z_FILTERED, ZLIB_VERSION,
                        static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit2_ error");
    deflateSetHeader(&c_stream, headerp);
    deflateTune(&c_stream, VALUE_ONE, VALUE_FOUR, VALUE_EIGHT, VALUE_ONE);
    memLevel = VALUE_ONE;
    err = deflateParams(&c_stream, memLevel, Z_DEFAULT_STRATEGY);
    NAPI_ASSERT(env, err == Z_OK, "deflateParams error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateInit(napi_env env, napi_callback_info info)
{
    z_stream defstream;
    char *inBuf = reinterpret_cast<char *>(HELLO);
    uint32_t inLen = strlen(inBuf) + VALUE_ONE;
    uint8_t *outBuf = nullptr;
    uint32_t outLen = VALUE_ZERO;
    int err = Z_OK;

    defstream.zalloc = nullptr;
    defstream.zfree = nullptr;
    defstream.opaque = nullptr;
    defstream.avail_in = static_cast<uInt>(inLen);
    defstream.next_in = reinterpret_cast<Bytef *>(inBuf);
    defstream.avail_out = static_cast<uInt>(outLen);
    defstream.next_out = reinterpret_cast<Bytef *>(outBuf);
    err = deflateInit_(&defstream, Z_DEFAULT_COMPRESSION, ZLIB_VERSION, static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit_ error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateInit2(napi_env env, napi_callback_info info)
{
    z_stream c_stream;
    int err = Z_OK;
    int windowBits = VALUE_EIGHT;
    int memLevel = VALUE_EIGHT;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit2_(&c_stream, Z_BEST_COMPRESSION, Z_DEFLATED, windowBits, memLevel, Z_FILTERED, ZLIB_VERSION,
                        static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit2_ error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateGetDictionary(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    int *bits = nullptr;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    gz_headerp headerp = nullptr;
    z_stream c_stream;
    int err = Z_OK;
    int windowBits = VALUE_EIGHT;
    int memLevel = VALUE_EIGHT;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit2_(&c_stream, Z_BEST_COMPRESSION, Z_DEFLATED, windowBits, memLevel, Z_FILTERED, ZLIB_VERSION,
                        static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit2_ error");
    deflateSetHeader(&c_stream, headerp);
    deflateTune(&c_stream, VALUE_ONE, VALUE_FOUR, VALUE_EIGHT, VALUE_ONE);
    memLevel = VALUE_ONE;
    err = deflateParams(&c_stream, memLevel, Z_DEFAULT_STRATEGY);
    NAPI_ASSERT(env, err == Z_OK, "deflateParams error");
    err = deflatePending(&c_stream, nullptr, bits);
    NAPI_ASSERT(env, err == Z_OK, "deflatePending error");
    err = deflateSetDictionary(&c_stream, reinterpret_cast<const Bytef *>(DICTIONARY),
                               static_cast<int>(sizeof(DICTIONARY)));
    NAPI_ASSERT(env, err == Z_OK, "deflateSetDictionary error");
    err = deflateGetDictionary(&c_stream, unComp, nullptr);
    NAPI_ASSERT(env, err == Z_OK, "deflateGetDictionary error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateEnd(napi_env env, napi_callback_info info)
{
    Byte *comp, *unComp;
    uLong comprLen = 100 * sizeof(int);
    uLong uncomprLen = comprLen;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");

    z_stream c_stream;
    int err = Z_OK;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit(&c_stream, Z_BEST_COMPRESSION);
    NAPI_ASSERT(env, err == Z_OK, "deflateInit error");
    err = deflateSetDictionary(&c_stream, reinterpret_cast<const Bytef *>(DICTIONARY),
                               static_cast<int>(sizeof(DICTIONARY)));
    NAPI_ASSERT(env, err == Z_OK, "deflateSetDictionary error");
    c_stream.next_out = comp;
    c_stream.avail_out = static_cast<uInt>(comprLen);
    c_stream.next_in = reinterpret_cast<z_const unsigned char *>(HELLO);
    c_stream.avail_in = static_cast<uInt>(strlen(HELLO)) + VALUE_ONE;
    err = deflate(&c_stream, Z_FINISH);
    NAPI_ASSERT(env, err == Z_STREAM_END, "deflate error");
    err = deflateEnd(&c_stream);
    NAPI_ASSERT(env, err == Z_OK, "deflateEnd error");
    free(comp);
    free(unComp);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value DeflateCopy(napi_env env, napi_callback_info info)
{
    z_stream defstream;
    char *inBuf = reinterpret_cast<char *>(HELLO);
    uint32_t inLen = strlen(inBuf) + VALUE_ONE;
    uint8_t *outBuf = nullptr;
    uint32_t outLen = VALUE_ZERO;
    int err = Z_OK;

    defstream.zalloc = nullptr;
    defstream.zfree = nullptr;
    defstream.opaque = nullptr;
    defstream.avail_in = static_cast<uInt>(inLen);
    defstream.next_in = reinterpret_cast<Bytef *>(inBuf);
    defstream.avail_out = static_cast<uInt>(outLen);
    defstream.next_out = reinterpret_cast<Bytef *>(outBuf);
    err = deflateInit_(&defstream, Z_DEFAULT_COMPRESSION, ZLIB_VERSION, static_cast<int>(sizeof(z_stream)));
    NAPI_ASSERT(env, err == Z_OK, "deflateInit_ error");
    uint32_t estimateLen = deflateBound(&defstream, inLen);
    outBuf = reinterpret_cast<uint8_t *>(malloc(estimateLen));
    defstream.avail_out = static_cast<uInt>(estimateLen);
    deflate(&defstream, Z_FINISH);
    deflateEnd(&defstream);
    z_stream outStream;
    err = deflateCopy(&defstream, &outStream);
    NAPI_ASSERT(env, err == Z_STREAM_ERROR, "deflateCopy error");
    free(outBuf);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Crc32Combine64(napi_env env, napi_callback_info info)
{
    uLong err;
    err = Z_ERRNO;
    uLong adler1;
    adler1 = 0L;
    uLong adler2;
    adler2 = 0L;
#ifdef Z_LARGE64
    err = crc32_combine64(crc1, crc2, VALUE_ZERO);
    NAPI_ASSERT(env, err == Z_ERRNO, "crc32_combine64 error");
#endif
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Adler32Combine64(napi_env env, napi_callback_info info)
{
    uLong err;
    err = Z_ERRNO;
    uLong adler1;
    adler1 = 0L;
    uLong adler2;
    adler2 = 0L;
#ifdef Z_LARGE64
    err = adler32_combine64(adler1, adler2, VALUE_ZERO);
    NAPI_ASSERT(env, err == Z_ERRNO, "adler32_combine64 error");
#endif
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Types(napi_env env, napi_callback_info info)
{
#ifdef Z_PREFIX
    deflate_state state;
    _tr_init(&state);
    NAPI_ASSERT(env, state != nullptr, "_tr_init error");

    _dist_code distCode = VALUE_SIX;
    NAPI_ASSERT(env, distCode == VALUE_SIX, "_dist_code error");

    _length_code engthCode = VALUE_FOUR;
    NAPI_ASSERT(env, engthCode == VALUE_FOUR, "_tr_align error");

    _tr_align trAlign;
    NAPI_ASSERT(env, sizeof(trAlign) >= VALUE_ZERO, "_tr_align error");

    _tr_flush_bits bits;
    NAPI_ASSERT(env, sizeof(bits) >= VALUE_ZERO, "_tr_flush_bits error");

    _tr_flush_block flushBlock;
    NAPI_ASSERT(env, sizeof(flushBlock) >= VALUE_ZERO, "_tr_flush_block error");

    _tr_stored_block storedBlock;
    NAPI_ASSERT(env, sizeof(storedBlock) >= VALUE_ZERO, "_tr_stored_block error");

    _tr_tally tally;
    NAPI_ASSERT(env, sizeof(tally) >= VALUE_ZERO, "_tr_tally error");
#endif
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"compress", nullptr, Compress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"compress2", nullptr, Compress2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"compressBound", nullptr, CompressBound, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"crc32", nullptr, Crc32, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"crc32_z", nullptr, Crc32_z, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"crc32Combine", nullptr, Crc32Combine, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"adler32", nullptr, Adler32, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"adler32_z", nullptr, Adler32_z, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"adler32Combine", nullptr, Adler32Combine, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflate", nullptr, Deflate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateFullFlush", nullptr, DeflateFullFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateBound", nullptr, DeflateBound, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unCompress", nullptr, UnCompress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"zLibVersion", nullptr, ZLibVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"zLibCompileFlags", nullptr, ZLibCompileFlags, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"zError", nullptr, ZError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unCompress2", nullptr, UnCompress2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateValidate", nullptr, InflateValidate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateUndermine", nullptr, InflateUndermine, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateSyncPoint", nullptr, InflateSyncPoint, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateSync", nullptr, InflateSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateSetDictionary", nullptr, InflateSetDictionary, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateResetKeep", nullptr, InflateResetKeep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateReset2", nullptr, InflateReset2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateReset", nullptr, InflateReset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateMark", nullptr, InflateMark, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateInit2", nullptr, InflateInit2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateInit", nullptr, InflateInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflatePrime", nullptr, InflatePrime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateGetHeader", nullptr, InflateGetHeader, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateGetDictionary", nullptr, InflateGetDictionary, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateEnd", nullptr, InflateEnd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateCopy", nullptr, InflateCopy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateCodesUsed", nullptr, InflateCodesUsed, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateBackInit", nullptr, InflateBackInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateBack", nullptr, InflateBack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflateBackEnd", nullptr, InflateBackEnd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inflate", nullptr, Inflate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzWrite", nullptr, GzWrite, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzvPrintf", nullptr, GzvPrintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzUnGetC", nullptr, GzUnGetC, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzTell64", nullptr, GzTell64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzTell", nullptr, GzTell, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzSetParams", nullptr, GzSetParams, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzSeek64", nullptr, GzSeek64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzSeek", nullptr, GzSeek, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzRewind", nullptr, GzRewind, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzRead", nullptr, GzRead, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzPuts", nullptr, GzPuts, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzPutc", nullptr, GzPutc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzPrintf", nullptr, GzPrintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzOpenW", nullptr, GzOpenW, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzOpen64", nullptr, GzOpen64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzOpen", nullptr, GzOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzOffset64", nullptr, GzOffset64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzGets", nullptr, GzGets, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzGetC_", nullptr, GzGetC_, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzGetC", nullptr, GzGetC, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzFWrite", nullptr, GzFWrite, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzFRead", nullptr, GzFRead, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzFlush", nullptr, GzFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzError", nullptr, GzError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzEof", nullptr, GzEof, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzDOpen", nullptr, GzDOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzDirect", nullptr, GzDirect, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzCloseW", nullptr, GzCloseW, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzCloseR", nullptr, GzCloseR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzClose", nullptr, GzClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzClearErr", nullptr, GzClearErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gzBuffer", nullptr, GzBuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCrcTable", nullptr, GetCrcTable, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateTune", nullptr, DeflateTune, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateSetHeader", nullptr, DeflateSetHeader, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateSetDictionary", nullptr, DeflateSetDictionary, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateResetKeep", nullptr, DeflateResetKeep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateReset", nullptr, DeflateReset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflatePrime", nullptr, DeflatePrime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflatePending", nullptr, DeflatePending, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateParams", nullptr, DeflateParams, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateInit", nullptr, DeflateInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateInit2", nullptr, DeflateInit2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateGetDictionary", nullptr, DeflateGetDictionary, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateEnd", nullptr, DeflateEnd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateCopy", nullptr, DeflateCopy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"crc32Combine64", nullptr, Crc32Combine64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"adler32Combine64", nullptr, Adler32Combine64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"distCode", nullptr, Types, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lengthCode", nullptr, Types, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"trAlign", nullptr, Types, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"trFlushBits", nullptr, Types, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"trFlushBlock", nullptr, Types, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"trInit", nullptr, Types, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"trStoredBlock", nullptr, Types, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"trTally", nullptr, Types, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "zlibndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
