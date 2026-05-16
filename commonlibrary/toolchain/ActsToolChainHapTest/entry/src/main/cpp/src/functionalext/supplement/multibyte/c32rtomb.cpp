/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <algorithm>
#include <cerrno>
#include <climits>
#include <clocale>
#include <cstdint>
#include <cstring>
#include <cuchar>
#include "test.h"

namespace {
constexpr size_t K_UTF8_ONE_BYTE = 1U;
constexpr size_t K_UTF8_TWO_BYTES = 2U;
constexpr size_t K_UTF8_THREE_BYTES = 3U;
constexpr size_t K_UTF8_FOUR_BYTES = 4U;
constexpr size_t K_UTF8_BYTE0 = 0U;
constexpr size_t K_UTF8_BYTE1 = 1U;
constexpr size_t K_UTF8_BYTE2 = 2U;
constexpr size_t K_UTF8_BYTE3 = 3U;
constexpr char32_t K_CENT_SIGN_CODEPOINT = 0x00a2;
constexpr char32_t K_EURO_CODEPOINT = 0x20ac;
constexpr char32_t K_CJK_EXT_B_CODEPOINT = 0x24b62;
constexpr size_t K_C32RTOMB_ERROR = static_cast<size_t>(-1);
} // namespace

static void CheckUtf8OneByte(char* bytes)
{
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    size_t result = c32rtomb(bytes, L'h', nullptr);
    if (result != K_UTF8_ONE_BYTE) {
        t_error("%s c32rtomb failed\n", __func__);
    }
    if (bytes[0] != 'h') {
        t_error("%s bytes[0] failed\n", __func__);
    }
}

static void CheckUtf8TwoBytes(char* bytes)
{
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    size_t result = c32rtomb(bytes, K_CENT_SIGN_CODEPOINT, nullptr);
    if (result != K_UTF8_TWO_BYTES) {
        t_error("%s c32rtomb failed\n", __func__);
    }
    if (bytes[0] != '\xc2') {
        t_error("%s bytes[0] failed\n", __func__);
    }
    if (bytes[K_UTF8_BYTE1] != '\xa2') {
        t_error("%s bytes[1] failed\n", __func__);
    }
}

static void CheckUtf8ThreeBytes(char* bytes)
{
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    size_t result = c32rtomb(bytes, K_EURO_CODEPOINT, nullptr);
    if (result != K_UTF8_THREE_BYTES) {
        t_error("%s c32rtomb failed\n", __func__);
    }
    if (bytes[0] != '\xe2') {
        t_error("%s bytes[0] failed\n", __func__);
    }
    if (bytes[K_UTF8_BYTE1] != '\x82') {
        t_error("%s bytes[1] failed\n", __func__);
    }
    if (bytes[K_UTF8_BYTE2] != '\xac') {
        t_error("%s bytes[2] failed\n", __func__);
    }
}

static void CheckUtf8FourBytes(char* bytes)
{
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    size_t result = c32rtomb(bytes, K_CJK_EXT_B_CODEPOINT, nullptr);
    if (result != K_UTF8_FOUR_BYTES) {
        t_error("%s c32rtomb failed\n", __func__);
    }
    if (bytes[K_UTF8_BYTE0] != '\xf0') {
        t_error("%s bytes[0] failed\n", __func__);
    }
    if (bytes[K_UTF8_BYTE1] != '\xa4') {
        t_error("%s bytes[1] failed\n", __func__);
    }
    if (bytes[K_UTF8_BYTE2] != '\xad') {
        t_error("%s bytes[2] failed\n", __func__);
    }
    if (bytes[K_UTF8_BYTE3] != '\xa2') {
        t_error("%s bytes[3] failed\n", __func__);
    }
}

/**
 * @tc.name      : C32rtomb0100
 * @tc.desc      : Validate c32rtomb behavior with null output buffer.
 * @tc.leve      : Level 0
 */
void C32rtomb0100(void)
{
    size_t result = c32rtomb(nullptr, L'\0', nullptr);
    if (result != K_UTF8_ONE_BYTE) {
        t_error("%s c32rtomb failed\n", __func__);
    }

    result = c32rtomb(nullptr, L'h', nullptr);
    if (result != K_UTF8_ONE_BYTE) {
        t_error("%s c32rtomb failed\n", __func__);
    }
}

/**
 * @tc.name      : C32rtomb0200
 * @tc.desc      : Validate single-byte conversion output bytes.
 * @tc.leve      : Level 0
 */
void C32rtomb0200(void)
{
    char bytes[MB_LEN_MAX];
    std::fill_n(bytes, MB_LEN_MAX, '\x01');

    size_t result = c32rtomb(bytes, L'\0', nullptr);
    if (result != K_UTF8_ONE_BYTE) {
        t_error("%s c32rtomb failed\n", __func__);
    }
    if (bytes[0] != '\0') {
        t_error("%s bytes[0] failed\n", __func__);
    }
    if (bytes[K_UTF8_BYTE1] != '\x01') {
        t_error("%s bytes[1] failed\n", __func__);
    }

    std::fill_n(bytes, MB_LEN_MAX, '\0');
    result = c32rtomb(bytes, L'h', nullptr);
    if (result != K_UTF8_ONE_BYTE) {
        t_error("%s c32rtomb failed\n", __func__);
    }
    if (bytes[0] != 'h') {
        t_error("%s bytes[0] failed\n", __func__);
    }
}

/**
 * @tc.name      : C32rtomb0300
 * @tc.desc      : Validate UTF-8 encoding for 1 to 4 byte code points.
 * @tc.leve      : Level 0
 */
void C32rtomb0300(void)
{
    char bytes[MB_LEN_MAX];

    char* ret = setlocale(LC_CTYPE, "C.UTF-8");
    if (strcmp(ret, "C.UTF-8")) {
        t_error("%s setlocale failed\n", __func__);
    }
    uselocale(LC_GLOBAL_LOCALE);
    CheckUtf8OneByte(bytes);
    CheckUtf8TwoBytes(bytes);
    CheckUtf8ThreeBytes(bytes);
    CheckUtf8FourBytes(bytes);
}

/**
 * @tc.name      : C32rtomb0400
 * @tc.desc      : invalid code point should fail with (size_t)-1
 * @tc.leve      : Level 2
 */
void C32rtomb0400(void)
{
    char bytes[MB_LEN_MAX];
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    size_t result = c32rtomb(bytes, static_cast<char32_t>(UINT32_C(0xffffffff)), nullptr);
    if (result != K_C32RTOMB_ERROR) {
        t_error("%s c32rtomb should be failed\n", __func__);
    }
}

static int C32rtombTestWithArgs(int argc, char* argv[])
{
    C32rtomb0100();
    C32rtomb0200();
    C32rtomb0300();
    C32rtomb0400();
    return T_STATUS;
}

int C32rtombTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return C32rtombTestWithArgs(1, libcArgvStub);
}
