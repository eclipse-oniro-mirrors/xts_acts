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
#include <cstdlib>
#include <csignal>
#include <cwchar>
#include "test.h"

// Test constants for wcsdup operations
#define NUM_COPIES 5
#define LONG_STRING_SIZE 1024
#define LONG_STRING_LENGTH 1023
#define ALPHABET_SIZE 26
#define WRITE_INDEX_0 0
#define WRITE_INDEX_1 1
#define WRITE_INDEX_2 2
#define WRITE_INDEX_3 3
#define WRITE_INDEX_4 4
#define WRITE_INDEX_5 5

static void DealAberrant(int code)
{
    if (code != SIGSEGV) {
        t_error("wcsdup_0200 code is %d are not SIGSEGV", __func__, code);
    }
    exit(g_tStatus);
}

/**
 * @tc.name      : wcsdup_0100
 * @tc.desc      : Call wcsdup to get a newly allocated wide string
 * @tc.level     : Level 0
 */
void Wcsdup0100(void)
{
    wchar_t *src = L"hello";
    wchar_t *result = wcsdup(src);
    if (result == nullptr) {
        t_error("%s Memory allocation failed\n", __func__);
        return;
    }
    if (wcscmp(src, result) != 0) {
        t_error("%s wcscmp get result is %ls are not want %ls\n", __func__, result, src);
    }
    free(result);
}

/**
 * @tc.name      : wcsdup_0200
 * @tc.desc      : Test the wcsdup result when the incoming null
 * @tc.level     : Level 2
 */
void Wcsdup0200(void)
{
    signal(SIGSEGV, DealAberrant);
    wchar_t *result = wcsdup(nullptr);
}

/**
 * @tc.name      : wcsdup_0300
 * @tc.desc      : Copy an empty wide string
 * @tc.level     : Level 1
 */
void Wcsdup0300(void)
{
    wchar_t *src = L"";
    wchar_t *result = wcsdup(src);
    
    if (result == nullptr) {
        t_error("%s Memory allocation failed for empty string\n", __func__);
        return;
    }
    
    if (wcscmp(src, result) != 0) {
        t_error("%s Empty strings are not equal\n", __func__);
    }
    
    // Check length
    if (wcslen(result) != 0) {
        t_error("%s Copied empty string has non-zero length: %zu\n", __func__, wcslen(result));
    }
    
    free(result);
}

/**
 * @tc.name      : wcsdup_0400
 * @tc.desc      : Copy wide string with Unicode characters
 * @tc.level     : Level 1
 */
void Wcsdup0400(void)
{
    wchar_t *src = L"Hello, 世界! 🌍";
    wchar_t *result = wcsdup(src);
    
    if (result == nullptr) {
        t_error("%s Memory allocation failed for Unicode string\n", __func__);
        return;
    }
    
    if (wcscmp(src, result) != 0) {
        t_error("%s Unicode strings are not equal\n", __func__);
    }
    
    // Verify length
    size_t srcLen = wcslen(src);
    size_t resultLen = wcslen(result);
    if (srcLen != resultLen) {
        t_error("%s Length mismatch: src=%zu, result=%zu\n", __func__, srcLen, resultLen);
    }
    
    free(result);
}

/**
 * @tc.name      : wcsdup_0500
 * @tc.desc      : Verify copied string is independent memory
 * @tc.level     : Level 2
 */
void Wcsdup0500(void)
{
    wchar_t src[] = L"TestString";
    wchar_t *result = wcsdup(src);
    
    if (result == nullptr) {
        t_error("%s Memory allocation failed\n", __func__);
        return;
    }
    
    // Modify original
    src[0] = L'X';
    
    // Copy should remain unchanged
    if (wcscmp(result, L"TestString") != 0) {
        t_error("%s Copied string was modified when original changed\n", __func__);
    }
    
    // Modify copy
    result[0] = L'Y';
    
    // Original should remain unchanged
    if (wcscmp(src, L"XestString") != 0) {
        t_error("%s Original was modified when copy changed\n", __func__);
    }
    
    free(result);
}

/**
 * @tc.name      : wcsdup_0600
 * @tc.desc      : Test with extremely large string
 * @tc.level     : Level 2
 */
void Wcsdup0600(void)
{
    // This test might fail on systems with enough memory
    // It's testing edge case for memory allocation
    size_t hugeSize = (size_t)-1 / sizeof(wchar_t);  // Near SIZE_MAX
    wchar_t *src = (wchar_t *)malloc(hugeSize * sizeof(wchar_t));
    
    if (src == nullptr) {
        // Can't test if we can't allocate source
        return;
    }
    
    // Fill with something (optional)
    wmemset(src, L'A', hugeSize - 1);
    src[hugeSize - 1] = L'\0';
    
    wchar_t *result = wcsdup(src);
    
    // This should fail (return nullptr) due to huge memory request
    if (result != nullptr) {
        t_error("%s wcsdup should fail for huge string\n", __func__);
        free(result);
    }
    
    free(src);
}

/**
 * @tc.name      : wcsdup_0700
 * @tc.desc      : Copy string with control characters
 * @tc.level     : Level 1
 */
void Wcsdup0700(void)
{
    wchar_t src[] = L"Line1\nLine2\tTab\\Backslash\x01Control";
    wchar_t *result = wcsdup(src);
    
    if (result == nullptr) {
        t_error("%s Memory allocation failed for string with special chars\n", __func__);
        return;
    }
    
    if (wcscmp(src, result) != 0) {
        t_error("%s Strings with special chars are not equal\n", __func__);
    }
    
    // Check length
    if (wcslen(result) != wcslen(src)) {
        t_error("%s Length mismatch for special chars\n", __func__);
    }
    
    free(result);
}

/**
 * @tc.name      : wcsdup_0800
 * @tc.desc      : Verify null terminator is properly copied
 * @tc.level     : Level 1
 */
void Wcsdup0800(void)
{
    wchar_t *src = L"Test";
    wchar_t *result = wcsdup(src);
    
    if (result == nullptr) {
        t_error("%s Memory allocation failed\n", __func__);
        return;
    }
    
    // Check that string is properly null-terminated
    size_t len = wcslen(src);
    if (result[len] != L'\0') {
        t_error("%s String not properly null-terminated at position %zu\n", __func__, len);
    }
    
    // Check that wcslen works on the result
    size_t resultLen = wcslen(result);
    if (len != resultLen) {
        t_error("%s wcslen mismatch: expected %zu, got %zu\n", __func__, len, resultLen);
    }
    
    free(result);
}

/**
 * @tc.name      : wcsdup_0900
 * @tc.desc      : Call wcsdup multiple times
 * @tc.level     : Level 1
 */
void Wcsdup0900(void)
{
    wchar_t *src = L"MultipleCopy";
    wchar_t *copies[NUM_COPIES];
    int i;
    
    // Create multiple copies
    for (i = 0; i < NUM_COPIES; i++) {
        copies[i] = wcsdup(src);
        if (copies[i] == nullptr) {
            t_error("%s Memory allocation failed at iteration %d\n", __func__, i);
            // Clean up any already allocated
            for (int j = 0; j < i; j++) {
                free(copies[j]);
            }
            return;
        }
        
        if (wcscmp(src, copies[i]) != 0) {
            t_error("%s Copy %d doesn't match original\n", __func__, i);
        }
    }
    
    // Verify all copies are independent
    for (i = 0; i < NUM_COPIES; i++) {
        copies[i][0] = L'0' + i;  // Modify first character
    }
    
    for (i = 0; i < NUM_COPIES; i++) {
        for (int j = i + 1; j < NUM_COPIES; j++) {
            if (wcscmp(copies[i], copies[j]) == 0) {
                t_error("%s Copies %d and %d are not independent\n", __func__, i, j);
            }
        }
    }
    
    // Clean up
    for (i = 0; i < NUM_COPIES; i++) {
        free(copies[i]);
    }
}

/**
 * @tc.name      : wcsdup_1000
 * @tc.desc      : Verify returned pointer is valid for writing
 * @tc.level     : Level 2
 */
void Wcsdup1000(void)
{
    wchar_t *src = L"ReadOnly";
    wchar_t *result = wcsdup(src);
    
    if (result == nullptr) {
        t_error("%s Memory allocation failed\n", __func__);
        return;
    }
    
    // Test that we can write to the returned memory
    result[WRITE_INDEX_0] = L'W';
    result[WRITE_INDEX_1] = L'r';
    result[WRITE_INDEX_2] = L'i';
    result[WRITE_INDEX_3] = L't';
    result[WRITE_INDEX_4] = L'e';
    result[WRITE_INDEX_5] = L'\0';
    
    if (wcscmp(result, L"Write") != 0) {
        t_error("%s Cannot write to returned memory\n", __func__);
    }
    
    free(result);
}

/**
 * @tc.name      : wcsdup_1100
 * @tc.desc      : Copy a long wide string
 * @tc.level     : Level 1
 */
void Wcsdup1100(void)
{
    // Create a long string
    wchar_t longStr[LONG_STRING_SIZE];
    for (int i = 0; i < LONG_STRING_LENGTH; i++) {
        longStr[i] = L'A' + (i % ALPHABET_SIZE);
    }
    longStr[LONG_STRING_LENGTH] = L'\0';
    
    wchar_t *result = wcsdup(longStr);
    
    if (result == nullptr) {
        t_error("%s Memory allocation failed for long string\n", __func__);
        return;
    }
    
    if (wcscmp(longStr, result) != 0) {
        t_error("%s Long strings are not equal\n", __func__);
    }
    
    // Verify length
    if (wcslen(result) != LONG_STRING_LENGTH) {
        t_error("%s Long string length incorrect: %zu\n", __func__, wcslen(result));
    }
    
    free(result);
}

static int WcsdupTestImpl(int argc, char *argv[])
{
    Wcsdup0100();
    Wcsdup0200();
    Wcsdup0300();
    Wcsdup0400();
    Wcsdup0500();
    Wcsdup0600();
    Wcsdup0700();
    Wcsdup0800();
    Wcsdup0900();
    Wcsdup1000();
    Wcsdup1100();
    return g_tStatus;
}

int WcsdupTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return WcsdupTestImpl(1, libcArgv);
}
