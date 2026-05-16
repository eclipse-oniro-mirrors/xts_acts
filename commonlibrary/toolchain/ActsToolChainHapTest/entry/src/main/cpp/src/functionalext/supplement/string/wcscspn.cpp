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

#include <cstdio>
#include <cstring>
#include <cwchar>
#include "test.h"

/**
 * @tc.name      : Wcscspn0100
 * @tc.desc      : Call the wcscspn method to get the length of the maximum initial segment of the wide string points
 *                 to dest
 * @tc.level     : Level 0
 */
void Wcscspn0100(void)
{
    size_t result = wcscspn(L"hello world", L"abcdefghijklmnopqrstuvwxyz");
    if (result != 0U) {
        t_error("%s wcscspn get result is %d are not want 0U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn0200
 * @tc.desc      : The return result of wcscspn when dest is a space
 * @tc.level     : Level 1
 */
void Wcscspn0200(void)
{
    size_t result = wcscspn(L"hello world", L" ");
    size_t want = 5U;
    if (result != want) {
        t_error("%s wcscspn get result is %d are not want 5U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn0300
 * @tc.desc      : wcscspn returns result when dest is punctuation
 * @tc.level     : Level 1
 */
void Wcscspn0300(void)
{
    size_t result = wcscspn(L"hello world", L"!");
    size_t want = 11U;
    if (result != want) {
        t_error("%s wcscspn get result is %d are not want 11U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn0400
 * @tc.desc      : test with empty reject string
 * @tc.level     : Level 1
 */
void Wcscspn0400(void)
{
    size_t result = wcscspn(L"hello world", L"");
    size_t want = 11U; // Should return length of entire string
    if (result != want) {
        t_error("%s wcscspn with empty reject get %zu are not want 11U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn0500
 * @tc.desc      : test with single character reject that appears at start
 * @tc.level     : Level 1
 */
void Wcscspn0500(void)
{
    size_t result = wcscspn(L"hello world", L"h");
    if (result != 0U) {
        t_error("%s wcscspn get result is %zu are not want 0U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn0600
 * @tc.desc      : test with single character reject in middle
 * @tc.level     : Level 1
 */
void Wcscspn0600(void)
{
    size_t result = wcscspn(L"hello world", L"w");
    size_t want = 6U; // "hello " = 6 characters
    if (result != want) {
        t_error("%s wcscspn get result is %zu are not want 6U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn0700
 * @tc.desc      : test with multiple reject characters
 * @tc.level     : Level 0
 */
void Wcscspn0700(void)
{
    size_t result = wcscspn(L"123.456-789", L".-");
    size_t want = 3U; // "123" = 3 characters
    if (result != want) {
        t_error("%s wcscspn get result is %zu are not want 3U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn0800
 * @tc.desc      : test with wide characters in reject set
 * @tc.level     : Level 1
 */
void Wcscspn0800(void)
{
    size_t result = wcscspn(L"中文测试English", L"E");
    size_t want = 4U; // "中文测试" = 4 wide characters
    if (result != want) {
        t_error("%s wcscspn with wide chars get %zu are not want 4U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn0900
 * @tc.desc      : test with empty source string
 * @tc.level     : Level 1
 */
void Wcscspn0900(void)
{
    size_t result = wcscspn(L"", L"abc");
    if (result != 0U) {
        t_error("%s wcscspn with empty source get %zu are not want 0U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn1000
 * @tc.desc      : test with both source and reject empty
 * @tc.level     : Level 1
 */
void Wcscspn1000(void)
{
    size_t result = wcscspn(L"", L"");
    if (result != 0U) {
        t_error("%s wcscspn with both empty get %zu are not want 0U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn1100
 * @tc.desc      : test reject character at end of string
 * @tc.level     : Level 1
 */
void Wcscspn1100(void)
{
    size_t result = wcscspn(L"hello", L"o");
    size_t want = 4U; // "hell" = 4 characters
    if (result != want) {
        t_error("%s wcscspn get result is %zu are not want 4U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn1200
 * @tc.desc      : test with all characters in reject set
 * @tc.level     : Level 0
 */
void Wcscspn1200(void)
{
    size_t result = wcscspn(L"abcde", L"abcde");
    if (result != 0U) {
        t_error("%s wcscspn get result is %zu are not want 0U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscspn1300
 * @tc.desc      : test with overlapping characters in reject
 * @tc.level     : Level 2
 */
void Wcscspn1300(void)
{
    size_t result = wcscspn(L"test string", L"st ");
    size_t want = 0U; // 't' is in reject set, at position 0
    if (result != want) {
        t_error("%s wcscspn get result is %zu are not want 0U\n", __func__, result);
    }
}

static int WcscspnTestImpl(int argc, char* argv[])
{
    Wcscspn0100();
    Wcscspn0200();
    Wcscspn0300();
    Wcscspn0400();
    Wcscspn0500();
    Wcscspn0600();
    Wcscspn0700();
    Wcscspn0800();
    Wcscspn0900();
    Wcscspn1000();
    Wcscspn1100();
    Wcscspn1200();
    Wcscspn1300();
    return T_STATUS;
}

int WcscspnTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return WcscspnTestImpl(1, libcArgv);
}
