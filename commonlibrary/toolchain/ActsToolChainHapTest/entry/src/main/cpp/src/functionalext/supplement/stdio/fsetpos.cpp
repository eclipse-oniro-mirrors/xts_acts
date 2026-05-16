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
#include "functionalext.h"

const int SUCCESS = 0;
const int SIZE = 20;
const int HALF_SIZE = 10;
const int END_SIZE = 0;

/**
 * @tc.name      : fsetpos_0100
 * @tc.desc      : Each parameter is valid, and the file pointer is set to the beginning of the file.
 * @tc.level     : Level 0
 */
void Fsetpos0100()
{
    char str[100] = {0};
    const char *ptr = "/data/storage/el2/base/cache/test.txt";
    const char *wstring = "This is a test case!";
    fpos_t pos;
    FILE *fptr = fopen(ptr, "w+");
    EXPECT_TRUE("fsetpos_0100", fptr != nullptr);
    fwrite(wstring, sizeof(char), strlen(wstring), fptr);
    fseek(fptr, 0, SEEK_SET);
    fgetpos(fptr, &pos);
    int result = fsetpos(fptr, &pos);
    EXPECT_EQ("fsetpos_0100", result, SUCCESS);
    int rsize = fread(str, sizeof(char), 100, fptr);
    EXPECT_EQ("fsetpos_0100", rsize, SIZE);
    fclose(fptr);
    remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : fsetpos_0200
 * @tc.desc      : Each parameter is valid, and the file pointer is set to the middle of the file.
 * @tc.level     : Level 0
 */
void Fsetpos0200()
{
    char str[100] = {0};
    const char *ptr = "/data/storage/el2/base/cache/test.txt";
    const char *wstring = "This is a test case!";
    fpos_t pos;
    FILE *fptr = fopen(ptr, "w+");
    fwrite(wstring, sizeof(char), strlen(wstring), fptr);
    fseek(fptr, HALF_SIZE, SEEK_SET);
    fgetpos(fptr, &pos);
    int data = fsetpos(fptr, &pos);
    EXPECT_EQ("fsetpos_0200", data, SUCCESS);
    int rsize = fread(str, 1, 100, fptr);
    EXPECT_EQ("fsetpos_0200", rsize, HALF_SIZE);
    fclose(fptr);
    remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
    wstring = nullptr;
}

/**
 * @tc.name      : fsetpos_0300
 * @tc.desc      : Each parameter is valid, and the file pointer is set to the end of the file.
 * @tc.level     : Level 0
 */
void Fsetpos0300()
{
    char str[100] = {0};
    const char *ptr = "/data/storage/el2/base/cache/test.txt";
    const char *wstring = "This is a test case!";
    fpos_t pos;
    FILE *fptr = fopen(ptr, "w+");
    fwrite(wstring, sizeof(char), strlen(wstring), fptr);
    fseek(fptr, SIZE, SEEK_SET);
    fgetpos(fptr, &pos);
    int data = fsetpos(fptr, &pos);
    EXPECT_EQ("fsetpos_0300", data, SUCCESS);
    int rsize = fread(str, 1, 100, fptr);
    EXPECT_EQ("fsetpos_0300", rsize, END_SIZE);
    fclose(fptr);
    remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
    wstring = nullptr;
}

/**
 * @tc.name      : fsetpos_0400
 * @tc.desc      : The pos parameter is valid, and the file pointer cannot be set.
 * @tc.level     : Level 2
 */
void Fsetpos0400()
{
    char str[100] = {0};
    const char *ptr = "/data/storage/el2/base/cache/test.txt";
    const char *wrstring = "This is a test case!";
    fpos_t pos;
    FILE *fptr = fopen(ptr, "w+");
    fwrite(wrstring, sizeof(char), strlen(wrstring), fptr);
    memset(&pos, 0xFF, sizeof(pos));
    int data = fsetpos(fptr, &pos);
    EXPECT_NE("fsetpos_0400", data, SUCCESS);
    fclose(fptr);
    remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
    wrstring = nullptr;
}

static int FsetposTestImpl(int argc, char *argv[])
{
    Fsetpos0100();
    Fsetpos0200();
    Fsetpos0300();
    Fsetpos0400();
    return g_tStatus;
}

int FsetposTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FsetposTestImpl(1, libcArgv);
}
