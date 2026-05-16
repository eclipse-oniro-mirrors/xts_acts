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

#include <sys/stat.h>
#include <unistd.h>
#include "functionalext.h"

const int SUCCESS = 0;
const int FAILED = -1;
const int FILE_ZERO = 0;
const int FILE_FIRST = 10;
const int FILE_SECOND = 100;

/**
 * @tc.name      : ftruncate_0100
 * @tc.desc      : The parameter length is 0, which can clear the file content.
 * @tc.level     : Level 0
 */
void Ftruncate0100(void)
{
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    FILE* fptr = fopen(ptr, "w");
    struct stat statbuff;
    int writeRet = fprintf(fptr, "%s", "this is a sample!");
    EXPECT_NE("ftruncate_0100", writeRet, FAILED);
    int freturn = ftruncate(fileno(fptr), 0);
    EXPECT_EQ("ftruncate_0100", freturn, SUCCESS);
    stat(ptr, &statbuff);
    EXPECT_EQ("ftruncate_0100", statbuff.st_size, FILE_ZERO);
    int closeRet = fclose(fptr);
    EXPECT_EQ("ftruncate_0100", closeRet, SUCCESS);
    int removeRet = remove(ptr);
    EXPECT_EQ("ftruncate_0100", removeRet, SUCCESS);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : ftruncate_0200
 * @tc.desc      : The parameter length is greater than 0 and less than the file size,
 *                 which can clear the file content.
 * @tc.level     : Level 0
 */
void Ftruncate0200(void)
{
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    FILE* fptr = fopen(ptr, "w");
    struct stat statbuff;
    int writeRet = fprintf(fptr, "%s", "this is a sample!");
    EXPECT_NE("ftruncate_0200", writeRet, FAILED);
    int freturn = ftruncate(fileno(fptr), 10);
    EXPECT_EQ("ftruncate_0200", freturn, SUCCESS);
    stat(ptr, &statbuff);
    EXPECT_EQ("ftruncate_0200", static_cast<int>(statbuff.st_size), FILE_FIRST);
    int closeRet = fclose(fptr);
    EXPECT_EQ("ftruncate_0200", closeRet, SUCCESS);
    int removeRet = remove(ptr);
    EXPECT_EQ("ftruncate_0200", removeRet, SUCCESS);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : ftruncate_0300
 * @tc.desc      : The parameter length is greater than the file size,which can clear the file content.
 * @tc.level     : Level 0
 */
void Ftruncate0300(void)
{
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    FILE* fptr = fopen(ptr, "w");
    struct stat statbuff;
    int writeRet = fprintf(fptr, "%s", "this is a sample!");
    EXPECT_NE("ftruncate_0300", writeRet, FAILED);
    int freturn = ftruncate(fileno(fptr), 100);
    EXPECT_EQ("ftruncate_0300", freturn, SUCCESS);
    stat(ptr, &statbuff);
    EXPECT_EQ("ftruncate_0300", static_cast<int>(statbuff.st_size), FILE_SECOND);
    int closeRet = fclose(fptr);
    EXPECT_EQ("ftruncate_0300", closeRet, SUCCESS);
    int removeRet = remove(ptr);
    EXPECT_EQ("ftruncate_0300", removeRet, SUCCESS);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : ftruncate_0400
 * @tc.desc      : The fd parameter is nullptr,the file content cannot be cleared.
 * @tc.level     : Level 2
 */
void Ftruncate0400(void)
{
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    FILE* fptr = fopen(ptr, "w");
    int writeRet = fprintf(fptr, "%s", "this is a sample!");
    EXPECT_NE("ftruncate_0400", writeRet, FAILED);
    int freturn = ftruncate(0, 10);
    EXPECT_EQ("ftruncate_0400", freturn, FAILED);
    int closeRet = fclose(fptr);
    EXPECT_EQ("ftruncate_0400", closeRet, SUCCESS);
    int removeRet = remove(ptr);
    EXPECT_EQ("ftruncate_0400", removeRet, SUCCESS);
    fptr = nullptr;
    ptr = nullptr;
}

static int FtruncateTestImpl(int argc, char* argv[])
{
    Ftruncate0100();
    Ftruncate0200();
    Ftruncate0300();
    Ftruncate0400();

    return T_STATUS;
}

int FtruncateTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FtruncateTestImpl(1, libcArgv);
}
