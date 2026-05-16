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

#include <cwchar>
#include <cstdio>
#include <cstring>
#include "test.h"

// Test constants for wcspbrk operations
#define CHARACTER_OFFSET_2 2
#define CHARACTER_OFFSET_5 5

/**
 * @tc.name      : wcspbrk_0100
 * @tc.desc      : Test wcspbrk to get the first occurrence of the target character in the source string
 * @tc.level     : Level 0
 */
void Wcspbrk0100(void)
{
    const wchar_t *s = L"hello, world!";
    // 修复：使用 const wchar_t* 接收返回值
    const wchar_t *result = wcspbrk(s, L"-");
    if (result) {
        t_error("%s wcspbrk get are not null\n", __func__);
    }
}

/**
 * @tc.name      : wcspbrk_0200
 * @tc.desc      : Test the result of wcspbrk when the target character appears at the first position of the source
 *                 character
 * @tc.level     : Level 1
 */
void Wcspbrk0200(void)
{
    const wchar_t *s = L"hello, world!";
    // 修复：使用 const wchar_t* 接收返回值
    const wchar_t *result = wcspbrk(s, L"abch");
    if (wcscmp(result, s) != 0) {
        t_error("%s wcspbrk get result is %lc are not %lc\n", __func__, *result, *s);
    }
}

/**
 * @tc.name      : wcspbrk_0300
 * @tc.desc      : Test the result of wcspbrk when the target character appears in the middle of the source character
 * @tc.level     : Level 1
 */
void Wcspbrk0300(void)
{
    const wchar_t *s = L"hello, world!";
    // 修复：使用 const wchar_t* 接收返回值
    const wchar_t *result = wcspbrk(s, L"l");
    if (wcscmp(result, s + CHARACTER_OFFSET_2) != 0) {
        t_error("%s wcspbrk get result is %lc are not %lc\n", __func__, *result, *(s + CHARACTER_OFFSET_2));
    }
}

/**
 * @tc.name      : wcspbrk_0400
 * @tc.desc      : Test the result of wcspbrk when the target character is punctuation
 * @tc.level     : Level 1
 */
void Wcspbrk0400(void)
{
    const wchar_t *s = L"hello, world!";
    // 修复：使用 const wchar_t* 接收返回值
    const wchar_t *result = wcspbrk(s, L",. !");
    if (wcscmp(result, s + CHARACTER_OFFSET_5) != 0) {
        t_error("%s wcspbrk get result is %lc are not %lc\n", __func__, *result, *(s + CHARACTER_OFFSET_5));
    }
}

static int WcspbrkTestImpl(int argc, char *argv[])
{
    Wcspbrk0100();
    Wcspbrk0200();
    Wcspbrk0300();
    Wcspbrk0400();
    return g_tStatus;
}

int WcspbrkTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return WcspbrkTestImpl(1, libcArgv);
}