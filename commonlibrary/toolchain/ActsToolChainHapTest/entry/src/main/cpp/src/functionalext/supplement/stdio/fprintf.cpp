/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include <fcntl.h>
#include <cstdio>
#include <cstdlib>
#include "functionalext.h"

const size_t ERRORLEN = -1;

/**
 * @tc.name:      Fprintf0100
 * @tc.desc:      Verify fprintf and stdout process success.
 * @tc.level:     level 0.
 */
void Fprintf0100(void)
{
    char str[] = "This is a fprintf_0100";
    size_t len = fprintf(stdout, "%s", str);
    EXPECT_EQ("Fprintf0100", len, strlen(str));
}

/**
 * @tc.name:      Fprintf0200
 * @tc.desc:      Verify fprintf and stderr process success.
 * @tc.level:     level 0.
 */
void Fprintf0200(void)
{
    char str[] = "This is a test fprintf_0200";
    size_t len = fprintf(stderr, "%s", str);
    EXPECT_EQ("Fprintf0200", len, strlen(str));
}

/**
 * @tc.name:      Fprintf0300
 * @tc.desc:      Verify fprintf and fopen("w") process success.
 * @tc.level:     level 0.
 */
void Fprintf0300(void)
{
    char str[] = "这是一个测试";
    int len = 0;
    FILE *fptr = fopen("/data/storage/el2/base/cache/tempory_testfprintf.txt", "w");
    if (fptr != nullptr) {
        len = fprintf(fptr, "%s", str);
        (void)fclose(fptr);
    }
    EXPECT_EQ("Fprintf0300", len, strlen(str));
}

/**
 * @tc.name:      Fprintf0400
 * @tc.desc:      Verify fflush and fopen("r") and fclose and return -1.
 * @tc.level:     level 2.
 */
void Fprintf0400(void)
{
    char str[] = "这是一个测试";
    size_t len = 0;
    FILE *fptr = fopen("/data/storage/el2/base/cache/tempory_testfprintf.txt", "r");
    if (fptr != nullptr) {
        len = fprintf(fptr, "%s", str);
        (void)fclose(fptr);
    }
    EXPECT_EQ("Fprintf0400", len, ERRORLEN);
    (void)remove("/data/storage/el2/base/cache/tempory_testfprintf.txt");
}

/**
 * @tc.name:      Fprintf0500
 * @tc.desc:      Verify fprintf with multiple format specifiers.
 * @tc.level:     level 0.
 */
void Fprintf0500(void)
{
    char str[] = "Test";
    int num = 123;
    double d = 45.67;
    size_t len = 0;
    FILE *fptr = fopen("/data/storage/el2/base/cache/tempory_testfprintf.txt", "w");
    if (fptr != nullptr) {
        len = fprintf(fptr, "String: %s, Int: %d, Double: %.2f", str, num, d);
        (void)fclose(fptr);
    }
    int expectedLen = strlen("String: Test, Int: 123, Double: 45.67");
    EXPECT_EQ("Fprintf0500", len, expectedLen);
    (void)remove("/data/storage/el2/base/cache/tempory_testfprintf.txt");
}


/**
 * @tc.name:      Fprintf0600
 * @tc.desc:      Verify fprintf with append mode.
 * @tc.level:     level 0.
 */
void Fprintf0600(void)
{
    char str1[] = "First line\n";
    char str2[] = "Second line\n";
    
    // Write first line
    FILE *fptr = fopen("/data/storage/el2/base/cache/tempory_testfprintf.txt", "w");
    if (fptr != nullptr) {
        (void)fprintf(fptr, "%s", str1);
        (void)fclose(fptr);
    }
    
    // Append second line
    fptr = fopen("/data/storage/el2/base/cache/tempory_testfprintf.txt", "a");
    size_t len = 0;
    if (fptr != nullptr) {
        len = fprintf(fptr, "%s", str2);
        (void)fclose(fptr);
    }
    
    EXPECT_EQ("Fprintf0600", len, strlen(str2));
    (void)remove("/data/storage/el2/base/cache/tempory_testfprintf.txt");
}

/**
 * @tc.name:      Fprintf0700
 * @tc.desc:      Verify fprintf with large string.
 * @tc.level:     level 0.
 */
void Fprintf0700(void)
{
    char largeStr[1024];
    memset(largeStr, 'A', sizeof(largeStr) - 1);
    largeStr[sizeof(largeStr) - 1] = '\0';
    
    size_t len = 0;
    FILE *fptr = fopen("/data/storage/el2/base/cache/tempory_testfprintf.txt", "w");
    if (fptr != nullptr) {
        len = fprintf(fptr, "%s", largeStr);
        (void)fclose(fptr);
    }
    
    EXPECT_EQ("Fprintf0700", len, strlen(largeStr));
    (void)remove("/data/storage/el2/base/cache/tempory_testfprintf.txt");
}

/**
 * @tc.name:      Fprintf0800
 * @tc.desc:      Verify fprintf with special characters.
 * @tc.level:     level 0.
 */
void Fprintf0800(void)
{
    char str[] = "Special chars: \t\n\r\\\"\'";
    size_t len = 0;
    FILE *fptr = fopen("/data/storage/el2/base/cache/tempory_testfprintf.txt", "w");
    if (fptr != nullptr) {
        len = fprintf(fptr, "%s", str);
        (void)fclose(fptr);
    }
    
    EXPECT_EQ("Fprintf0800", len, strlen(str));
    (void)remove("/data/storage/el2/base/cache/tempory_testfprintf.txt");
}

static int FprintfTestImpl(void)
{
    Fprintf0100();
    Fprintf0200();
    Fprintf0300();
    Fprintf0400();
    Fprintf0500();
    Fprintf0600();
    Fprintf0700();
    Fprintf0800();
    return g_tStatus;
}

int FprintfTest(void)
{
    return FprintfTestImpl();
}
