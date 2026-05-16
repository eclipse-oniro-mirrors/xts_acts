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
 * @tc.name      : Wcsspn0100
 * @tc.desc      : test the wcsspn function to get the length of the largest initial segment of the wide string pointed
 * @tc.level     : Level 0
 */
void Wcsspn0100(void)
{
    size_t result = wcsspn(L"hello world", L"abcdefghijklmnopqrstuvwxyz");
    size_t want = 5U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 5U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn0200
 * @tc.desc      : test the wcsspn result when the search string contains spaces
 * @tc.level     : Level 1
 */
void Wcsspn0200(void)
{
    size_t result = wcsspn(L"hello world", L"abcdefghijklmnopqrstuvwxyz ");
    size_t want = 11U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 11U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn0300
 * @tc.desc      : The result of the wcsspn function when no target exists for the retrieved string
 * @tc.level     : Level 1
 */
void Wcsspn0300(void)
{
    size_t result = wcsspn(L"hello world", L"!");
    if (result != 0U) {
        t_error("%s wcsspn get result is %d are not want 0U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn0400
 * @tc.desc      : Empty string as input
 * @tc.level     : Level 1
 */
void Wcsspn0400(void)
{
    size_t result = wcsspn(L"", L"abcdefghijklmnopqrstuvwxyz");
    size_t want = 0U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 0U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn0500
 * @tc.desc      : Empty accept set
 * @tc.level     : Level 1
 */
void Wcsspn0500(void)
{
    size_t result = wcsspn(L"hello world", L"");
    size_t want = 0U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 0U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn0600
 * @tc.desc      : Mixed alphanumeric characters in accept set
 * @tc.level     : Level 0
 */
void Wcsspn0600(void)
{
    size_t result = wcsspn(L"abc123def", L"abcdefghijklmnopqrstuvwxyz0123456789");
    size_t want = 9U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 9U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn0700
 * @tc.desc      : Non-ASCII wide characters in accept set
 * @tc.level     : Level 0
 */
void Wcsspn0700(void)
{
    size_t result = wcsspn(L"中文测试English", L"中文测试");
    size_t want = 4U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 4U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn0800
 * @tc.desc      : Space and punctuation characters in accept set
 * @tc.level     : Level 0
 */
void Wcsspn0800(void)
{
    size_t result = wcsspn(L"   Hello, World!", L" ,.!?");
    size_t want = 3U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 3U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn0900
 * @tc.desc      : Partial match with digits and letters
 * @tc.level     : Level 0
 */
void Wcsspn0900(void)
{
    size_t result = wcsspn(L"abc123!@#", L"abcdefghijklmnopqrstuvwxyz0123456789");
    size_t want = 6U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 6U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn1000
 * @tc.desc      : Single character accept set
 * @tc.level     : Level 1
 */
void Wcsspn1000(void)
{
    size_t result = wcsspn(L"aaaaabbbbb", L"a");
    size_t want = 5U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 5U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn1100
 * @tc.desc      : Characters not in order in accept set
 * @tc.level     : Level 1
 */
void Wcsspn1100(void)
{
    size_t result = wcsspn(L"hello", L"oleh"); // Same characters, different order
    size_t want = 5U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 5U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn1200
 * @tc.desc      : Null character in the middle of accept set
 * @tc.level     : Level 2
 */
void Wcsspn1200(void)
{
    wchar_t acceptSet[] = L"abc\0def"; // Null character in the middle
    size_t result = wcsspn(L"abcdef", acceptSet);
    size_t want = 3U; // Should only match up to 'c'
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 3U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn1300
 * @tc.desc      : Entire string consists of characters from accept set
 * @tc.level     : Level 0
 */
void Wcsspn1300(void)
{
    size_t result = wcsspn(L"abcdef", L"abcdefghijklmnopqrstuvwxyz");
    size_t want = 6U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 6U\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsspn1400
 * @tc.desc      : No characters from accept set at the beginning
 * @tc.level     : Level 0
 */
void Wcsspn1400(void)
{
    size_t result = wcsspn(L"123hello", L"abcdefghijklmnopqrstuvwxyz");
    size_t want = 0U;
    if (result != want) {
        t_error("%s wcsspn get result is %d are not want 0U\n", __func__, result);
    }
}

static int WcsspnTestImpl(int argc, char* argv[])
{
    Wcsspn0100();
    Wcsspn0200();
    Wcsspn0300();
    Wcsspn0400();
    Wcsspn0500();
    Wcsspn0600();
    Wcsspn0700();
    Wcsspn0800();
    Wcsspn0900();
    Wcsspn1000();
    Wcsspn1100();
    Wcsspn1200();
    Wcsspn1300();
    Wcsspn1400();
    return T_STATUS;
}

int WcsspnTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcsspnTestImpl(1, libcArgvStub);
}
