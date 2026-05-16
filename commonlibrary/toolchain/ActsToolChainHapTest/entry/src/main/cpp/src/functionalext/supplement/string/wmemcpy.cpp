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
#include <cstdlib>
#include <cstring>
#include <cwchar>
#include "test.h"

namespace {
constexpr size_t K_LATIN_ALPHABET_SIZE = 26U;
constexpr size_t K_PARTIAL_DEST_WIDE_ELEMS = 20U;
constexpr wchar_t K_WIDE_FILL_Z = L'Z';
} // namespace

/**
 * @tc.name      : Wmemcpy0100
 * @tc.desc      : Copies specified number of characters from one string to another
 * @tc.level     : Level 0
 */
void Wmemcpy0100(void)
{
    wchar_t dest[30];
    wchar_t src[] = L"This is a c test for wmemcpy";
    int n = 13;
    std::wmemcpy(dest, src, n);
    if (wcsncmp(dest, src, n)) {
        t_error("%s The string of dest is not equal to src\n", __func__);
    }
}

/**
 * @tc.name      : Wmemcpy0200
 * @tc.desc      : test wmemcpy when 'n' is equal to the number characters in src string
 * @tc.level     : Level 0
 */
void Wmemcpy0200(void)
{
    wchar_t dest[3];
    wchar_t src[] = L"aaa";
    int n = 3;
    std::wmemcpy(dest, src, n);
    if (wcsncmp(dest, src, n)) {
        t_error("%s The string of dest is not equal to src\n", __func__);
    }
}

/**
 * @tc.name      : Wmemcpy0300
 * @tc.desc      : test wmemcpy when 'n' is equal to 0
 * @tc.level     : Level 0
 */
void Wmemcpy0300(void)
{
    wchar_t dest[3];
    wchar_t src[] = L"aaa";
    int n = 0;
    std::wmemcpy(dest, src, n);
    if (!wcscmp(dest, src)) {
        t_error("%s The string of dest is equal to src\n", __func__);
    }
}

/**
 * @tc.name      : Wmemcpy0400
 * @tc.desc      : Copies zero characters (n = 0)
 * @tc.level     : Level 1
 */
void Wmemcpy0400(void)
{
    wchar_t dest[30] = L"Original content";
    wchar_t src[] = L"Should not be copied";
    std::wmemcpy(dest, src, 0);
    if (wcscmp(dest, L"Original content")) {
        t_error("%s Destination was modified when n=0\n", __func__);
    }
}

/**
 * @tc.name      : Wmemcpy0500
 * @tc.desc      : Copies from empty source string
 * @tc.level     : Level 1
 */
void Wmemcpy0500(void)
{
    wchar_t dest[30] = L"Original content";
    wchar_t src[] = L"";
    size_t n = 0;
    std::wmemcpy(dest, src, n);
    if (wcscmp(dest, L"Original content")) {
        t_error("%s Destination was modified when copying empty string\n", __func__);
    }
}

/**
 * @tc.name      : Wmemcpy0600
 * @tc.desc      : Verifies return value is the destination pointer
 * @tc.level     : Level 1
 */
void Wmemcpy0600(void)
{
    wchar_t dest[30];
    wchar_t src[] = L"test return value";
    size_t n = wcslen(src);
    wchar_t* ret = std::wmemcpy(dest, src, n);
    if (ret != dest) {
        t_error("%s Return value is not destination pointer\n", __func__);
    }
}

/**
 * @tc.name      : Wmemcpy0700
 * @tc.desc      : Copies to the exact size of destination buffer
 * @tc.level     : Level 1
 */
void Wmemcpy0700(void)
{
    wchar_t src[] = L"ExactFit";
    wchar_t dest[8]; // Exactly fits the 7 characters + no null terminator
    size_t n = 7;    // Copy exactly 7 characters

    std::wmemcpy(dest, src, n);

    if (wcsncmp(dest, src, n)) {
        t_error("%s Exact buffer copy failed\n", __func__);
    }
}

/**
 * @tc.name      : Wmemcpy0800
 * @tc.desc      : Tests copying with restrict qualifier compliance
 * @tc.level     : Level 2
 */
void Wmemcpy0800(void)
{
    wchar_t dest[30];
    wchar_t src[] = L"Testing restrict semantics";
    size_t n = 10;

    std::wmemcpy(dest, src, n);

    // Verify independent memory regions
    src[0] = L'X'; // Modify source
    if (dest[0] == L'X') {
        t_error("%s restrict qualifier violation detected\n", __func__);
    }
}

/**
 * @tc.name      : Wmemcpy0900
 * @tc.desc      : Large copy operation
 * @tc.level     : Level 1
 */
void Wmemcpy0900(void)
{
    const size_t bufferSize = 1000;
    wchar_t* src = (wchar_t*)malloc(bufferSize * sizeof(wchar_t));
    wchar_t* dest = (wchar_t*)malloc(bufferSize * sizeof(wchar_t));

    if (src == nullptr || dest == nullptr) {
        t_error("%s Memory allocation failed\n", __func__);
        return;
    }

    // Fill source with pattern
    for (size_t i = 0; i < bufferSize; i++) {
        src[i] = L'A' + (i % K_LATIN_ALPHABET_SIZE);
    }

    std::wmemcpy(dest, src, bufferSize);

    for (size_t i = 0; i < bufferSize; i++) {
        if (dest[i] != src[i]) {
            t_error("%s Large copy failed at position %zu\n", __func__, i);
            break;
        }
    }

    free(src);
    free(dest);
}

/**
 * @tc.name      : Wmemcpy1000
 * @tc.desc      : Partial copy leaving remaining destination unchanged
 * @tc.level     : Level 1
 */
void Wmemcpy1000(void)
{
    wchar_t dest[K_PARTIAL_DEST_WIDE_ELEMS];
    wmemset(dest, K_WIDE_FILL_Z, K_PARTIAL_DEST_WIDE_ELEMS); // Fill with 'Z'
    wchar_t src[] = L"Partial";
    size_t n = 7; // Copy 7 characters

    std::wmemcpy(dest, src, n);

    // Check copied part
    if (wcsncmp(dest, src, n)) {
        t_error("%s Partial copy failed\n", __func__);
    }

    // Check remaining part is still 'Z'
    for (size_t i = n; i < K_PARTIAL_DEST_WIDE_ELEMS; i++) {
        if (dest[i] != K_WIDE_FILL_Z) {
            t_error("%s Destination after n was modified\n", __func__);
            break;
        }
    }
}

/**
 * @tc.name      : Wmemcpy1100
 * @tc.desc      : Copies entire string including null terminator
 * @tc.level     : Level 0
 */
void Wmemcpy1100(void)
{
    wchar_t dest[30];
    wchar_t src[] = L"Complete copy test";
    size_t n = wcslen(src) + 1; // Include null terminator
    std::wmemcpy(dest, src, n);
    if (wcscmp(dest, src)) {
        t_error("%s The string of dest is not equal to src\n", __func__);
    }
}

/**
 * @tc.name      : Wmemcpy1200
 * @tc.desc      : Copies zero characters (n = 0)
 * @tc.level     : Level 1
 */
void Wmemcpy1200(void)
{
    wchar_t dest[20] = L"Original content";
    wchar_t src[] = L"New content";
    wchar_t original[20];
    for (size_t wi = 0; wi < sizeof(original) / sizeof(original[0]); ++wi) {
        original[wi] = dest[wi];
    }

    std::wmemcpy(dest, src, 0);

    if (wcscmp(dest, original)) {
        t_error("%s Destination was modified when n=0\n", __func__);
    }
}

/**
 * @tc.name      : Wmemcpy1300
 * @tc.desc      : Copies wide characters including non-ASCII characters
 * @tc.level     : Level 0
 */
void Wmemcpy1300(void)
{
    wchar_t dest[30];
    wchar_t src[] = L"中文测试 こんにちは Привет";
    size_t n = 8; // Copy first 8 wide characters
    std::wmemcpy(dest, src, n);

    dest[n] = L'\0'; // Null terminate for comparison

    wchar_t expected[9];
    std::wcsncpy(expected, src, n);
    expected[n] = L'\0';

    if (wcscmp(dest, expected)) {
        t_error("%s Wide character copy failed\n", __func__);
    }
}

/**
 * @tc.name      : Wmemcpy1400
 * @tc.desc      : Verifies return value is the destination pointer
 * @tc.level     : Level 1
 */
void Wmemcpy1400(void)
{
    wchar_t dest[20];
    wchar_t src[] = L"test return value";
    size_t n = wcslen(src);
    wchar_t* ret = std::wmemcpy(dest, src, n);

    if (ret != dest) {
        t_error("%s Return value is not destination pointer\n", __func__);
    }
}

static int WmemcpyTestImpl(int argc, char* argv[])
{
    Wmemcpy0100();
    Wmemcpy0200();
    Wmemcpy0300();
    Wmemcpy0400();
    Wmemcpy0500();
    Wmemcpy0600();
    Wmemcpy0700();
    Wmemcpy0800();
    Wmemcpy0900();
    Wmemcpy1000();
    Wmemcpy1100();
    Wmemcpy1200();
    Wmemcpy1300();
    Wmemcpy1400();
    return T_STATUS;
}

int WmemcpyTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WmemcpyTestImpl(1, libcArgvStub);
}
