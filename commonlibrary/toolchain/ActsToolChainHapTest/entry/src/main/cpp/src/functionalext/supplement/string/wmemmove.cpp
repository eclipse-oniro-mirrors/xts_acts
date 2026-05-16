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
 * @tc.name      : Wmemmove0100
 * @tc.desc      : Copies the specified number of wide characters from the source to the destination
 * @tc.level     : Level 0
 */
void Wmemmove0100(void)
{
    wchar_t dest[] = L"This is a c test for wmemmove function";
    const wchar_t src[] = L"src content";
    int count = 5;
    wchar_t tmp[count + 1];
    std::wcsncpy(tmp, src, count);
    std::wmemmove(dest, src, count);
    if (wcsncmp(dest, tmp, count)) {
        t_error("The dest specified bits are not equal to the src\n", __func__);
    }
}

/**
 * @tc.name      : Wmemmove0200
 * @tc.desc      : Dest and src overlaps
 * @tc.level     : Level 1
 */
void Wmemmove0200(void)
{
    wchar_t src[] = L"This is a c test for wmemmove function";
    wchar_t* dest = &src[2];
    int count = 5;
    wchar_t tmp[count + 1];
    std::wcsncpy(tmp, src, count);
    std::wmemmove(dest, src, count);
    if (wcsncmp(dest, tmp, count)) {
        t_error("The dest specified bits are not equal to the src\n", __func__);
    }
}

/**
 * @tc.name      : Wmemmove0300
 * @tc.desc      : The first address of dest is the same as src
 * @tc.level     : Level 1
 */
void Wmemmove0300(void)
{
    wchar_t src[] = L"This is a c test for wmemmove function";
    wchar_t* dest = &src[0];
    int count = 5;
    wchar_t* result = std::wmemmove(dest, src, count);
    if (!(result == dest)) {
        t_error("The first address of dest is not the same as src\n", __func__);
    }
}

/**
 * @tc.name      : Wmemmove0400
 * @tc.desc      : Copies entire string from source to destination
 * @tc.level     : Level 0
 */
void Wmemmove0400(void)
{
    wchar_t dest[30];
    wchar_t src[] = L"Complete wmemmove test";
    size_t n = wcslen(src);
    std::wmemmove(dest, src, n);
    if (wcsncmp(dest, src, n)) {
        t_error("%s The string of dest is not equal to src\n", __func__);
    }
}

/**
 * @tc.name      : Wmemmove0500
 * @tc.desc      : Copies zero wide characters (n = 0)
 * @tc.level     : Level 1
 */
void Wmemmove0500(void)
{
    wchar_t dest[20] = L"Original content";
    wchar_t src[] = L"Should not be copied";
    wchar_t original[20];
    for (size_t wi = 0; wi < sizeof(original) / sizeof(original[0]); ++wi) {
        original[wi] = dest[wi];
    }
    std::wmemmove(dest, src, 0);
    if (wcscmp(dest, original)) {
        t_error("%s Destination was modified when n=0\n", __func__);
    }
}

/**
 * @tc.name      : Wmemmove0600
 * @tc.desc      : Source and destination are the same pointer
 * @tc.level     : Level 1
 */
void Wmemmove0600(void)
{
    wchar_t buf[30] = L"Same pointer test";
    wchar_t* src = buf;
    wchar_t* dest = buf;
    size_t n = 5;
    wchar_t original[30];
    for (size_t wi = 0; wi < sizeof(original) / sizeof(original[0]); ++wi) {
        original[wi] = buf[wi];
    }
    std::wmemmove(dest, src, n);
    if (wcscmp(buf, original)) {
        t_error("%s Buffer changed when src and dest are same\n", __func__);
    }
}

/**
 * @tc.name      : Wmemmove0700
 * @tc.desc      : Copies wide characters including non-ASCII characters
 * @tc.level     : Level 0
 */
void Wmemmove0700(void)
{
    wchar_t dest[30];
    wchar_t src[] = L"中文测试 こんにちは Hello";
    size_t n = 6;
    std::wmemmove(dest, src, n);
    if (wcsncmp(dest, src, n)) {
        t_error("%s Wide character copy failed\n", __func__);
    }
}

/**
 * @tc.name      : Wmemmove0800
 * @tc.desc      : Verifies return value is the destination pointer
 * @tc.level     : Level 1
 */
void Wmemmove0800(void)
{
    wchar_t dest[20];
    wchar_t src[] = L"test return value";
    size_t n = wcslen(src);
    wchar_t* ret = std::wmemmove(dest, src, n);
    if (ret != dest) {
        t_error("%s Return value is not destination pointer\n", __func__);
    }
}

/**
 * @tc.name      : Wmemmove0900
 * @tc.desc      : Handles exact buffer size copy
 * @tc.level     : Level 1
 */
void Wmemmove0900(void)
{
    wchar_t src[] = L"Exact";
    wchar_t dest[6]; // Exactly fits the string + null terminator
    size_t n = wcslen(src);
    std::wmemmove(dest, src, n);
    dest[n] = L'\0';
    if (wcscmp(dest, src)) {
        t_error("%s Exact buffer copy failed\n", __func__);
    }
}

/**
 * @tc.name      : Wmemmove1000
 * @tc.desc      : Handles overlapping memory when source is before destination
 * @tc.level     : Level 1
 */
void Wmemmove1000(void)
{
    wchar_t buf[50] = L"abcdefghijklmnopqrstuvwxyz";
    wchar_t* src = buf;
    wchar_t* dest = buf + 5;
    size_t n = 10;
    std::wmemmove(dest, src, n);
    wchar_t expected[] = L"abcdeabcdefghijpqrstuvwxyz";
    if (wcscmp(buf, expected)) {
        t_error("%s Forward overlapping copy failed\n", __func__);
    }
}

static int WmemmoveTestImpl(int argc, char* argv[])
{
    Wmemmove0100();
    Wmemmove0200();
    Wmemmove0300();
    Wmemmove0400();
    Wmemmove0500();
    Wmemmove0600();
    Wmemmove0700();
    Wmemmove0800();
    Wmemmove0900();
    Wmemmove1000();
    return T_STATUS;
}

int WmemmoveTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WmemmoveTestImpl(1, libcArgvStub);
}
