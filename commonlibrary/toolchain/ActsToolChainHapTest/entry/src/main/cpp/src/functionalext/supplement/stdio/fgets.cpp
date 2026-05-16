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

#include "functionalext.h"

/**
 * @tc.name      : Fgets0100
 * @tc.desc      : The parameter n is greater than the number of characters,and all content can be read.
 * @tc.level     : Level 0
 */
void Fgets0100(void)
{
    bool successFlag = false;
    char str[100];
    const char *ptr = "/data/storage/el2/base/cache/fgetstest.txt";
    char *wrString = "this is a test\n";
    FILE *fptr = fopen(ptr, "wr+");
    (void)fwrite(wrString, sizeof(char), strlen(wrString), fptr);
    if (fflush(fptr) != 0) {
        t_error("%s fflush failed\n", __func__);
    }
    if (fseek(fptr, 0L, SEEK_SET) != 0) {
        t_error("%s fseek failed\n", __func__);
    }
    char *content = fgets(str, 100, fptr);
    if (strcmp(content, "this is a test\n") == 0) {
        successFlag = true;
    }
    EXPECT_TRUE("Fgets0100", successFlag);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
    wrString = nullptr;
}

/**
 * @tc.name      : Fgets0200
 * @tc.desc      : The parameter n is greater than 2,and part of the content can be read.
 * @tc.level     : Level 0
 */
void Fgets0200(void)
{
    char str[5];
    bool successFlag = false;
    const char *ptr = "/data/storage/el2/base/cache/fgetstest.txt";
    char *wrString = "this is a test\n";
    FILE *fptr = fopen(ptr, "wr+");
    (void)fwrite(wrString, sizeof(char), strlen(wrString), fptr);
    if (fflush(fptr) != 0) {
        t_error("%s fflush failed\n", __func__);
    }
    if (fseek(fptr, 0L, SEEK_SET) != 0) {
        t_error("%s fseek failed\n", __func__);
    }
    char *content = fgets(str, 5, fptr);
    if (strcmp(content, "this") == 0) {
        successFlag = true;
    }
    EXPECT_TRUE("Fgets0200", successFlag);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : Fgets0300
 * @tc.desc      : The parameter n is equal to 2,and part of the content can be read.
 * @tc.level     : Level 1
 */
void Fgets0300(void)
{
    char str[2];
    bool successFlag = false;
    const char *ptr = "/data/storage/el2/base/cache/fgetstest.txt";
    char *wrString = "this is a test\n";
    FILE *fptr = fopen(ptr, "wr+");
    (void)fwrite(wrString, sizeof(char), strlen(wrString), fptr);
    if (fflush(fptr) != 0) {
        t_error("%s fflush failed\n", __func__);
    }
    if (fseek(fptr, 0L, SEEK_SET) != 0) {
        t_error("%s fseek failed\n", __func__);
    }
    char *content = fgets(str, 2, fptr);
    if (strcmp(content, "t") == 0) {
        successFlag = true;
    }
    EXPECT_TRUE("Fgets0300", successFlag);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : Fgets0400
 * @tc.desc      : The parameter n is equal to 1,and the content cannot be read.
 * @tc.level     : Level 2
 */
void Fgets0400(void)
{
    char str[2];
    bool successFlag = false;
    const char *ptr = "/data/storage/el2/base/cache/fgetstest.txt";
    char *wrString = "this is a test\n";
    FILE *fptr = fopen(ptr, "wr+");
    (void)fwrite(wrString, sizeof(char), strlen(wrString), fptr);
    if (fflush(fptr) != 0) {
        t_error("%s fflush failed\n", __func__);
    }
    if (fseek(fptr, 0L, SEEK_SET) != 0) {
        t_error("%s fseek failed\n", __func__);
    }
    char *content = fgets(str, 1, fptr);
    if (*content == 0) {
        successFlag = true;
    }
    EXPECT_TRUE("Fgets0400", successFlag);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : Fgets0500
 * @tc.desc      : The parameter n is equal to 0,and the content cannot be read.
 * @tc.level     : Level 2
 */
void Fgets0500(void)
{
    char str[2];
    bool successFlag = false;
    const char *ptr = "/data/storage/el2/base/cache/fgetstest.txt";
    char *wrString = "this is a test\n";
    FILE *fptr = fopen(ptr, "wr+");
    (void)fwrite(wrString, sizeof(char), strlen(wrString), fptr);
    if (fflush(fptr) != 0) {
        t_error("%s fflush failed\n", __func__);
    }
    if (fseek(fptr, 0L, SEEK_SET) != 0) {
        t_error("%s fseek failed\n", __func__);
    }
    char *content = fgets(str, 0, fptr);
    if (content == NULL) {
        successFlag = true;
    }
    EXPECT_TRUE("Fgets0500", successFlag);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : Fgets0600
 * @tc.desc      : Points to the end of the file,and the content cannot be read.
 * @tc.level     : Level 2
 */
void Fgets0600(void)
{
    char str[100];
    bool successFlag = false;
    const char *ptr = "/data/storage/el2/base/cache/fgetstest.txt";
    char *wrString = "this is a test\n";
    FILE *fptr = fopen(ptr, "wr+");
    (void)fwrite(wrString, sizeof(char), strlen(wrString), fptr);
    if (fflush(fptr) != 0) {
        t_error("%s fflush failed\n", __func__);
    }
    if (fseek(fptr, 0L, SEEK_END) != 0) {
        t_error("%s fseek failed\n", __func__);
    }
    char *content = fgets(str, 100, fptr);
    if (content == NULL) {
        successFlag = true;
    }
    EXPECT_TRUE("Fgets0600", successFlag);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

static int FgetsTestImpl(int argc, char *argv[])
{
    Fgets0100();
    Fgets0200();
    Fgets0300();
    Fgets0400();
    Fgets0500();
    Fgets0600();

    return g_tStatus;
}

int FgetsTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return FgetsTestImpl(1, libcArgv);
}
