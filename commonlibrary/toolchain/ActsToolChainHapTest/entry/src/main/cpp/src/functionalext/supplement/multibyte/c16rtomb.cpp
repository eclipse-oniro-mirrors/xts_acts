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
#include <climits>
#include <clocale>
#include <cstring>
#include <cuchar>
#include "test.h"

namespace {
constexpr size_t K_UTF8_ONE_BYTE = 1U;
constexpr size_t K_UTF8_TWO_BYTES = 2U;
constexpr size_t K_UTF8_THREE_BYTES = 3U;
constexpr size_t K_UTF8_FOUR_BYTES = 4U;
constexpr size_t K_C16RTOMB_ZERO = 0U;
constexpr char16_t K_CENT_SIGN_CODEPOINT = 0x00a2;
constexpr char16_t K_EURO_BMP_CODEPOINT = 0x20ac;
constexpr char16_t K_HIGH_SURROGATE_DBEA = 0xdbea;
constexpr char16_t K_LOW_SURROGATE_DFCD = 0xdfcd;
constexpr size_t K_C16RTOMB_ERROR = static_cast<size_t>(-1);
constexpr size_t K_UTF8_B0 = 0U;
constexpr size_t K_UTF8_B1 = 1U;
constexpr size_t K_UTF8_B2 = 2U;
constexpr size_t K_UTF8_B3 = 3U;
} // namespace

/**
 * @tc.name      : C16rtomb0100
 * @tc.desc      : Converts a variable-length 16-bit wide character representation to its narrow multibyte character
 *                 representation.
 * @tc.level     : Level 0
 */
void C16rtomb0100(void)
{
    char bytes[MB_LEN_MAX];
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    size_t result = c16rtomb(bytes, L'h', nullptr);
    if (result != K_UTF8_ONE_BYTE) {
        t_error("%s c16rtomb failed, result is %d\n", __func__, result);
    }
    if (bytes[K_UTF8_B0] != 'h') {
        t_error("%s bytes[0] is %c, not \'h\'\n", bytes[K_UTF8_B0]);
    }

    char* ret = setlocale(LC_CTYPE, "C.UTF-8");
    if (strcmp(ret, "C.UTF-8")) {
        t_error("%s setlocale failed\n", __func__);
    }
    uselocale(LC_GLOBAL_LOCALE);

    // 1-byte UTF-8.
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    result = c16rtomb(bytes, L'h', nullptr);
    if (result != K_UTF8_ONE_BYTE) {
        t_error("%s c16rtomb failed, result is %d\n", __func__, result);
    }
    if (bytes[K_UTF8_B0] != 'h') {
        t_error("%s bytes[0] is %c, not \'h\'\n", bytes[K_UTF8_B0]);
    }

    // 2-byte UTF-8.
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    result = c16rtomb(bytes, K_CENT_SIGN_CODEPOINT, nullptr);
    if (result != K_UTF8_TWO_BYTES) {
        t_error("%s c16rtomb failed, result is %d\n", __func__, result);
    }
    if (bytes[K_UTF8_B0] != '\xc2') {
        t_error("%s bytes[0] is %c, not \'\\xc2\'\n", bytes[K_UTF8_B0]);
    }
    if (bytes[K_UTF8_B1] != '\xa2') {
        t_error("%s bytes[0] is %c, not \'\\xa2\'\n", bytes[K_UTF8_B1]);
    }

    // 3-byte UTF-8.
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    result = c16rtomb(bytes, K_EURO_BMP_CODEPOINT, nullptr);
    if (result != K_UTF8_THREE_BYTES) {
        t_error("%s c16rtomb failed, result is %d\n", __func__, result);
    }
    if (bytes[K_UTF8_B0] != '\xe2') {
        t_error("%s bytes[0] is %c, not \'\\xe2\'\n", bytes[K_UTF8_B0]);
    }
    if (bytes[K_UTF8_B1] != '\x82') {
        t_error("%s bytes[0] is %c, not \'\\x82\'\n", bytes[K_UTF8_B1]);
    }
    if (bytes[K_UTF8_B2] != '\xac') {
        t_error("%s bytes[0] is %c, not \'\\xac\'\n", bytes[K_UTF8_B2]);
    }
}

/**
 * @tc.name      : C16rtomb0200
 * @tc.desc      : When the s parameter is invalid, test the return value of the function.
 * @tc.level     : Level 1
 */
void C16rtomb0200(void)
{
    size_t result = c16rtomb(nullptr, L'\0', nullptr);
    if (result != K_UTF8_ONE_BYTE) {
        t_error("%s c16rtomb failed, result is %d\n", __func__, result);
    }

    result = c16rtomb(nullptr, L'h', nullptr);
    if (result != K_UTF8_ONE_BYTE) {
        t_error("%s c16rtomb failed, result is %d\n", __func__, result);
    }
}

/**
 * @tc.name      : C16rtomb0300
 * @tc.desc      : test the return value of this function when c16 is equal to 0xdbea.
 * @tc.leve      : Level 1
 */
void C16rtomb0300(void)
{
    char bytes[MB_LEN_MAX];
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    size_t result = c16rtomb(bytes, K_HIGH_SURROGATE_DBEA, nullptr);
    if (result != K_C16RTOMB_ZERO) {
        t_error("%s c16rtomb failed\n", __func__);
    }
}

/**
 * @tc.name      : C16rtomb0400
 * @tc.desc      : test the return value of this function when c16 is equal to 0xdfcd.
 * @tc.leve      : Level 1
 */
void C16rtomb0400(void)
{
    char bytes[MB_LEN_MAX];
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    size_t result = c16rtomb(bytes, K_LOW_SURROGATE_DFCD, nullptr);
    if (result != K_UTF8_FOUR_BYTES) {
        t_error("%s c16rtomb failed\n", __func__);
    }

    if (bytes[K_UTF8_B0] != '\xf4') {
        t_error("%s bytes[0] is %c, not \'\\xf4\'\n", bytes[K_UTF8_B0]);
    }
    if (bytes[K_UTF8_B1] != '\x8a') {
        t_error("%s bytes[0] is %c, not \'\\x8a\'\n", bytes[K_UTF8_B1]);
    }
    if (bytes[K_UTF8_B2] != '\xaf') {
        t_error("%s bytes[0] is %c, not \'\\xaf\'\n", bytes[K_UTF8_B2]);
    }
    if (bytes[K_UTF8_B3] != '\x8d') {
        t_error("%s bytes[0] is %c, not \'\\x8d\'\n", bytes[K_UTF8_B3]);
    }
}

/**
 * @tc.name      : C16rtomb0500
 * @tc.desc      : test the return value of this function when c16 is equal to 0xdfcd.
 * @tc.leve      : Level 2
 */
void C16rtomb0500(void)
{
    char bytes[MB_LEN_MAX];
    std::fill_n(bytes, MB_LEN_MAX, '\0');
    size_t result = c16rtomb(bytes, K_LOW_SURROGATE_DFCD, nullptr);
    if (result != K_C16RTOMB_ERROR) {
        t_error("%s c16rtomb failed\n", __func__);
    }
}

static int C16rtombTestWithArgs(int argc, char* argv[])
{
    C16rtomb0100();
    C16rtomb0200();
    C16rtomb0300();
    C16rtomb0400();
    C16rtomb0500();
    return T_STATUS;
}

int C16rtombTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return C16rtombTestWithArgs(1, libcArgvStub);
}
