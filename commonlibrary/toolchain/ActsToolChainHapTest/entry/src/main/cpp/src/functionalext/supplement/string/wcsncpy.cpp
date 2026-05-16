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

#include <csignal>
#include <cstdlib>
#include <cwchar>

#include "test.h"

#define SIZEOF_WCHAR(x) (sizeof(x) / sizeof(wchar_t))

// Test constants for wcsncpy operations
#define BUFFER_SIZE_SMALL 5
#define BUFFER_SIZE_MEDIUM 6
#define BUFFER_SIZE_LARGE 8
#define BUFFER_SIZE_XLARGE 10
#define BUFFER_SIZE_HUGE 20
#define BUFFER_SIZE_1000 1000
#define COPY_SIZE_7 7
#define COPY_SIZE_8 8
#define COPY_SIZE_10 10
#define NULL_CHAR_INDEX_0 0
#define NULL_CHAR_INDEX_1 1
#define NULL_CHAR_INDEX_2 2

static void Handler(int sig)
{
    exit(g_tStatus);
}

/**
 * @tc.name      : wcsncpy_0100
 * @tc.desc      : copy a fixed-size string of wide characters
 * @tc.level     : Level 0
 */
void Wcsncpy0100(void)
{
    const wchar_t src[] = L"Hello";
    wchar_t buf[SIZEOF_WCHAR(src) + 1];
    wmemset(buf, L'A', SIZEOF_WCHAR(buf));
    wchar_t *dest = (wchar_t *)buf;

    if (dest != wcsncpy(dest, src, SIZEOF_WCHAR(src))) {
        t_error("%s failed: wcsncpy. src = %ls, dest = %ls\n", __func__, src, dest);
    }
}

/**
 * @tc.name      : wcsncpy_0200
 * @tc.desc      : copy a 0-size string of wide characters
 * @tc.level     : Level 1
 */
void Wcsncpy0200(void)
{
    const wchar_t src[] = L"Hello";
    wchar_t buf[SIZEOF_WCHAR(src)];
    wmemset(buf, L'A', SIZEOF_WCHAR(buf));
    wchar_t *dest = (wchar_t *)buf;

    if (dest != wcsncpy(dest, src, 0)) {
        t_error("%s failed: wcsncpy. src = %ls, dest = %ls\n", __func__, src, dest);
    }
}

/**
 * @tc.name      : wcsncpy_0300
 * @tc.desc      : copy a fixed-size string of wide characters with a larger size
 * @tc.level     : Level 1
 */
void Wcsncpy0300(void)
{
    const wchar_t src[] = L"Hello";
    wchar_t buf[SIZEOF_WCHAR(src) + SIZEOF_WCHAR(src)];
    wmemset(buf, L'A', SIZEOF_WCHAR(buf));
    wchar_t *dest = (wchar_t *)buf;

    if (dest != wcsncpy(dest, src, SIZEOF_WCHAR(src) + SIZEOF_WCHAR(src) - 1)) {
        t_error("%s failed: wcsncpy. src = %ls, dest = %ls\n", __func__, src, dest);
    }

    int i = 0;
    for (i = SIZEOF_WCHAR(src) + 1; i < SIZEOF_WCHAR(buf) - 1; i++) {
        if (buf[i] != L'\0') {
            t_error("%s failed: buf[%d] = %lc\n", __func__, i, buf[i]);
        }
    }

    if (buf[i] != L'A') {
        t_error("%s failed: buf[%d] = %lc\n", __func__, i, buf[i]);
    }
}

/**
 * @tc.name      : wcsncpy_0400
 * @tc.desc      : copy a fixed-size string of wide characters to a nullptr pointer
 * @tc.level     : Level 2
 */
void Wcsncpy0400(void)
{
    signal(SIGSEGV, Handler);

    const wchar_t src[] = L"Hello";
    wcsncpy(nullptr, src, SIZEOF_WCHAR(src));
}

/**
 * @tc.name      : wcsncpy_0500
 * @tc.desc      : Copy n = 0
 * @tc.level     : Level 1
 */
void Wcsncpy0500(void)
{
    const wchar_t src[] = L"Hello";
    wchar_t dest[BUFFER_SIZE_XLARGE];
    wmemset(dest, L'Z', BUFFER_SIZE_XLARGE);
    
    wchar_t *result = wcsncpy(dest, src, 0);
    
    if (result != dest) {
        t_error("%s Return value incorrect\n", __func__);
    }
    
    // Destination should be unchanged
    for (int i = 0; i < BUFFER_SIZE_XLARGE; i++) {
        if (dest[i] != L'Z') {
            t_error("%s Buffer modified when n=0\n", __func__);
        }
    }
}

/**
 * @tc.name      : wcsncpy_0600
 * @tc.desc      : Copy wide characters including non-ASCII
 * @tc.level     : Level 0
 */
void Wcsncpy0600(void)
{
    const wchar_t src[] = L"中文测试Hello";
    wchar_t dest[BUFFER_SIZE_XLARGE];
    
    wcsncpy(dest, src, COPY_SIZE_7);  // Copy 4 Chinese chars + 3 English
    
    wchar_t expected[] = L"中文测";
    if (wcsncmp(dest, expected, 3) != 0) {  // Compare first 3 wide chars
        t_error("%s Wide character copy failed\n", __func__);
    }
}

/**
 * @tc.name      : wcsncpy_0700
 * @tc.desc      : Test restrict qualifier compliance
 * @tc.level     : Level 2
 */
void Wcsncpy0700(void)
{
    wchar_t buffer[BUFFER_SIZE_HUGE] = L"Original Content";
    wchar_t *src = buffer;
    wchar_t *dest = buffer + BUFFER_SIZE_SMALL;
    
    // This tests restrict behavior - may be undefined but we test
    wcsncpy(dest, src, COPY_SIZE_8);
    
    // Verify the copy happened
    if (wcsncmp(dest, L"Original", COPY_SIZE_8) != 0) {
        t_error("%s Overlap copy failed\n", __func__);
    }
}

/**
 * @tc.name      : wcsncpy_0800
 * @tc.desc      : Copy exactly to buffer size
 * @tc.level     : Level 1
 */
void Wcsncpy0800(void)
{
    const wchar_t src[] = L"Exactly";
    wchar_t dest[BUFFER_SIZE_LARGE];  // 7 chars + 1 null
    
    wcsncpy(dest, src, COPY_SIZE_7);
    
    // All 7 chars copied
    if (wcsncmp(dest, src, COPY_SIZE_7) != 0) {
        t_error("%s Exact copy failed\n", __func__);
    }
    
    // Should NOT be null-terminated because n=7
    // dest[7] is uninitialized, not guaranteed null
}

/**
 * @tc.name      : wcsncpy_0900
 * @tc.desc      : String with null character in middle
 * @tc.level     : Level 2
 */
void Wcsncpy0900(void)
{
    wchar_t src[] = L"A\0BC";  // Null in middle
    wchar_t dest[BUFFER_SIZE_XLARGE];
    wmemset(dest, L'X', BUFFER_SIZE_XLARGE);
    
    wcsncpy(dest, src, COPY_SIZE_8);
    
    // Should copy 'A' and null, then pad with nulls
    if (dest[NULL_CHAR_INDEX_0] != L'A' || dest[NULL_CHAR_INDEX_1] != L'\0') {
        t_error("%s Copy of string with null failed\n", __func__);
    }
    
    // Positions 2-7 should be null
    for (int i = NULL_CHAR_INDEX_2; i < COPY_SIZE_8; i++) {
        if (dest[i] != L'\0') {
            t_error("%s Position %d not null\n", __func__, i);
        }
    }
}

/**
 * @tc.name      : wcsncpy_1000
 * @tc.desc      : Large n value
 * @tc.level     : Level 2
 */
void Wcsncpy1000(void)
{
    const wchar_t src[] = L"Short";
    wchar_t dest[BUFFER_SIZE_1000];
    
    wcsncpy(dest, src, BUFFER_SIZE_1000);
    
    // First 5 chars should be copied
    if (wcsncmp(dest, src, BUFFER_SIZE_SMALL) != 0) {
        t_error("%s Source not copied\n", __func__);
    }
    
    // Next 995 chars should be null
    for (int i = BUFFER_SIZE_SMALL; i < BUFFER_SIZE_1000; i++) {
        if (dest[i] != L'\0') {
            t_error("%s Position %d not null\n", __func__, i);
        }
    }
}

/**
 * @tc.name      : wcsncpy_1100
 * @tc.desc      : Verify null padding when source is shorter
 * @tc.level     : Level 1
 */
void Wcsncpy1100(void)
{
    const wchar_t src[] = L"AB";
    wchar_t dest[BUFFER_SIZE_MEDIUM] = {L'1', L'2', L'3', L'4', L'5', L'6'};
    
    wcsncpy(dest, src, BUFFER_SIZE_SMALL);
    
    // dest should be: 'A', 'B', '\0', '\0', '\0', '6'
    if (dest[0] != L'A' || dest[1] != L'B') {
        t_error("%s Source not copied\n", __func__);
    }
    
    // Positions 2-4 should be null
    for (int i = 2; i < BUFFER_SIZE_SMALL; i++) {
        if (dest[i] != L'\0') {
            t_error("%s Position %d not null\n", __func__, i);
        }
    }
    
    // Position 5 should be unchanged
    if (dest[BUFFER_SIZE_MEDIUM - 1] != L'6') {
        t_error("%s Position 5 was modified\n", __func__);
    }
}

/**
 * @tc.name      : wcsncpy_1200
 * @tc.desc      : Case sensitivity test
 * @tc.level     : Level 0
 */
void Wcsncpy1200(void)
{
    const wchar_t src[] = L"Hello";
    wchar_t dest[BUFFER_SIZE_XLARGE];
    
    wcsncpy(dest, src, BUFFER_SIZE_SMALL);
    
    // Should copy exactly, case sensitive
    wchar_t lower[] = L"hello";
    if (wcsncmp(dest, lower, BUFFER_SIZE_SMALL) == 0) {
        t_error("%s Case sensitivity issue\n", __func__);
    }
    
    if (wcsncmp(dest, src, BUFFER_SIZE_SMALL) != 0) {
        t_error("%s Copy not exact\n", __func__);
    }
}

/**
 * @tc.name      : wcsncpy_1300
 * @tc.desc      : Test with spaces and special characters
 * @tc.level     : Level 1
 */
void Wcsncpy1300(void)
{
    const wchar_t src[] = L"  Hello\tWorld\n";
    wchar_t dest[BUFFER_SIZE_HUGE];
    
    wcsncpy(dest, src, COPY_SIZE_10);
    
    if (wcsncmp(dest, src, COPY_SIZE_10) != 0) {
        t_error("%s Special chars not copied correctly\n", __func__);
    }
}

static int WcsncpyTestImpl(int argc, char *argv[])
{
    Wcsncpy0100();
    Wcsncpy0200();
    Wcsncpy0300();
    Wcsncpy0400();
    Wcsncpy0500();
    Wcsncpy0600();
    Wcsncpy0700();
    Wcsncpy0800();
    Wcsncpy0900();
    Wcsncpy1000();
    Wcsncpy1100();
    Wcsncpy1200();
    Wcsncpy1300();
    return g_tStatus;
}

int WcsncpyTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return WcsncpyTestImpl(1, libcArgv);
}
