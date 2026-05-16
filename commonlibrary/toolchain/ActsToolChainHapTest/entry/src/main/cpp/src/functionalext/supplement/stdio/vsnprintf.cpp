/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "functionalext.h"
#include "test.h"

namespace {
constexpr size_t K_EXPECTED_FULL_VALUE_IS_USE_LEN = 13U;
constexpr size_t K_TRUNCATED_VALUE_IS_LEN = 10U;
constexpr size_t K_PADDED_VALUE_IS_USE_BUF_LEN = 15U;
constexpr size_t K_NULL_ONLY_OUTPUT_BUF = 1U;
constexpr size_t K_TWO_CHAR_SCRATCH_BUF = 2U;
constexpr size_t K_WRITE_AT_MOST_ONE_BYTE = 1U;
constexpr size_t K_PROBE_STACK_BUF10 = 10U;
constexpr size_t K_NO_BUFFER_SIZE = 0U;
} // namespace

void VsnprintfTest(char* str, size_t n, char* fmt, const char* funcName, ...)
{
    char s[n];
    va_list ap;
    va_start(ap, funcName);
    int result = std::vsnprintf(s, n, fmt, ap);
    va_end(ap);
    if (result < 0) {
        t_error("%s vsnprintf get result is %d are less 0\n", funcName, result);
    }
    if (strcmp(s, str) != 0) {
        t_error("%s vsnprintf get is '%s' are not '%s'\n", funcName, s, str);
    }
}

void VsnprintfTest2(char* fmt, const char* funcName, ...)
{
    char s[K_TWO_CHAR_SCRATCH_BUF] = "a";
    va_list ap;
    va_start(ap, funcName);
    int result = std::vsnprintf(s, K_WRITE_AT_MOST_ONE_BYTE, fmt, ap);
    va_end(ap);
    if (result < 0) {
        t_error("%s vsnprintf get result is %d are less 0\n", funcName, result);
    }
    if (s[0] != '\0') {
        t_error("%s vsnprintf n is 1 but s[0] is not a mull character\n", funcName);
        ;
    }
}

void VsnprintfZeron(char* str, char* fmt, const char* funcName, ...)
{
    char s[K_PROBE_STACK_BUF10];
    va_list ap;
    va_start(ap, funcName);
    int result = std::vsnprintf(s, K_NO_BUFFER_SIZE, fmt, ap);
    va_end(ap);
    if (result < 0) {
        t_error("%s vsnprintf get result is %d are less 0\n", funcName, result);
    }
    if (strcmp(s, str) == 0) {
        t_error("%s vsnprintf get is '%s' but donnot want that\n", funcName, s);
    }
}

void VsnprintfZeronAll(char* str, char* fmt, const char* funcName, ...)
{
    va_list ap;
    va_start(ap, funcName);
    int result = std::vsnprintf(nullptr, K_NO_BUFFER_SIZE, fmt, ap);
    va_end(ap);
    EXPECT_EQ(funcName, result, strlen(str));
}

static int VsnprintfTestImpl(int argc, char* argv[])
{
    /**
     * @tc.name      : vsnprintf_0100
     * @tc.desc      : Call vsnprinf to get formatted output
     * @tc.level     : Level 0
     */
    VsnprintfTest("value is use", K_EXPECTED_FULL_VALUE_IS_USE_LEN, "value is %s", "vsnprintf_0100", "use");
    /**
     * @tc.name      : vsnprintf_0200
     * @tc.desc      : The number of digits to be truncated is less than the length of the format string
     * @tc.level     : Level 1
     */
    VsnprintfTest("value is ", K_TRUNCATED_VALUE_IS_LEN, "value is %s", "vsnprintf_0200", "use");
    /**
     * @tc.name      : vsnprintf_0300
     * @tc.desc      : The number of bits to be truncated is greater than the format string length
     * @tc.level     : Level 1
     */
    VsnprintfTest("value is use", K_PADDED_VALUE_IS_USE_BUF_LEN, "value is %s", "vsnprintf_0300", "use");
    /**
     * @tc.name      : vsnprintf_0400
     * @tc.desc      : Truncate bits to 0
     * @tc.level     : Level 2
     */
    VsnprintfZeron("value is use", "value is %s", "vsnprintf_0400", "use");
    /**
     * @tc.name      : vsnprintf_0500
     * @tc.desc      : truncate buffer, and bits to 0
     * @tc.level     : Level 3
     */
    VsnprintfZeronAll("value is use", "value is %s", "vsnprintf_0500", "use");
    /**
     * @tc.name      : vsnprintf_0600
     * @tc.desc      : The number of bits to be 1
     * @tc.level     : Level 2
     */
    VsnprintfTest("", K_NULL_ONLY_OUTPUT_BUF, "value is %s", "vsnprintf_0600", "use");
    /**
     * @tc.name      : vsnprintf_0700
     * @tc.desc      : This test case aims to validate that when vsnprintf is called with a buffer size of 1,
     *                 and the buffer initially contains data, it properly overwrites the buffer to contain only a null
     * character.
     * @tc.level     : Level 2
     */
    VsnprintfTest2("value is %s", "vsnprintf_0700", "use");

    return T_STATUS;
}

int VsnprintfTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return VsnprintfTestImpl(1, libcArgvStub);
}
