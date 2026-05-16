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

#include <cstdlib>
#include <unistd.h>
#include <sys/stat.h>
#include "functionalext.h"

typedef void (*TEST_FUN)();

const int SUCCESS = 0;
const int FAILED = -1;
#define FILE_PERMISSIONS_ALL 0777

/**
 * @tc.name      : access_0100
 * @tc.desc      : The parameter filename is the specified file and exists,
 *                 the parameter amode is F_OK,function returns successfully.
 * @tc.level     : Level 0
 *
 * /data/storage/el2/base/cache/
 */
void Access0100(void)
{
    const char *ptr = "/data/storage/el2/base/cache/accesstest.txt";
    FILE *fptr = fopen(ptr, "w");
    EXPECT_PTRNE("access_0100", fptr, nullptr);
    int isExist = access(ptr, F_OK);
    EXPECT_EQ("access_0100", isExist, SUCCESS);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : access_0200
 * @tc.desc      : The parameter filename is the specified directory and exists,
 *                 the parameter amode is F_OK,function returns SUCCESSfully.
 * @tc.level     : Level 0
 */
void Access0200(void)
{
    char passbuff[90];
    const char *ptr = "/data/storage/el2/base/cache/accesstest.txt";
    FILE *fptr = fopen(ptr, "w");
    EXPECT_PTRNE("access_0200", fptr, NULL);
    getcwd(passbuff, sizeof(passbuff));
    int isExist = access(passbuff, F_OK);
    EXPECT_EQ("access_0200", isExist, SUCCESS);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : access_0300
 * @tc.desc      : The parameter filename is the specified file and not exists,
 *                 the parameter amode is F_OK,function returns failure.
 * @tc.level     : Level 2
 */
void Access0300(void)
{
    const char *ptr = "/data/storage/el2/base/cache/noaccesstest.txt";
    int isExist = access(ptr, F_OK);
    EXPECT_EQ("access_0300", isExist, FAILED);
    (void)remove(ptr);
}

/**
 * @tc.name      : Access0400
 * @tc.desc      : The parameter filename is the specified directory and not exists,
 *                 the parameter amode is F_OK,function returns failure.
 * @tc.level     : Level 2
 */
void Access0400(void)
{
    const char *ptr = "/data/storage/el2/base/cache/noaccesstest";
    int isExist = access(ptr, F_OK);
    EXPECT_EQ("Access0400", isExist, FAILED);
    (void)remove(ptr);
}

/**
 * @tc.name      : access_0500
 * @tc.desc      : The file attribute specified by the parameter filename is readable,
 *                 the parameter amode is R_OK,function returns successfully.
 * @tc.level     : Level 0
 */
void Access0500(void)
{
    const char *ptr = "/data/storage/el2/base/cache/accesstest.txt";
    FILE *fptr = fopen(ptr, "w");
    EXPECT_PTRNE("access_0500", fptr, NULL);
    int isRead = access(ptr, R_OK);
    EXPECT_EQ("access_0500", isRead, SUCCESS);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : access_0600
 * @tc.desc      : The file attribute specified by the parameter filename is writable,
 *                 the parameter amode is W_OK,function returns successfully.
 * @tc.level     : Level 0
 */
void Access0600(void)
{
    const char *ptr = "/data/storage/el2/base/cache/accesstest.txt";
    FILE *fptr = fopen(ptr, "w");
    EXPECT_PTRNE("access_0600", fptr, NULL);
    int isWrite = access(ptr, W_OK);
    EXPECT_EQ("access_0600", isWrite, SUCCESS);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : access_0700
 * @tc.desc      : The file attribute specified by the parameter filename is executable,
 *                 the parameter amode is W_OK,function returns successfully.
 * @tc.level     : Level 0
 */
void Access0700(void)
{
    const char *ptr = "/data/storage/el2/base/cache/accesstest.txt";
    FILE *fptr = fopen(ptr, "w");
    EXPECT_PTRNE("access_0700", fptr, NULL);
    chmod(ptr, FILE_PERMISSIONS_ALL);
    int isExecute = access(ptr, X_OK);
    EXPECT_EQ("access_0700", isExecute, SUCCESS);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : access_0800
 * @tc.desc      : The file attribute specified by the parameter filename is not executable,
 *                 the parameter amode is R_OK,function returns failure.
 * @tc.level     : Level 2
 */
void Access0800(void)
{
    const char *ptr = "/data/storage/el2/base/cache/accesstest.txt";
    FILE *fptr = fopen(ptr, "w");
    EXPECT_PTRNE("access_0800", fptr, NULL);
    int isExecute = access(ptr, X_OK);
    EXPECT_EQ("access_0800", isExecute, FAILED);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

TEST_FUN g_funArray[] = {
    Access0100,
    Access0200,
    Access0300,
    Access0400,
    Access0500,
    Access0600,
    Access0700,
    Access0800,
};

static int AccessTestWithArgs(int argc, char *argv[])
{
    int num = sizeof(g_funArray) / sizeof(g_funArray[0]);
    for (int pos = 0; pos < num; ++pos) {
        g_funArray[pos]();
    }
    return g_tStatus;
}

int AccessTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return AccessTestWithArgs(1, libcArgv);
}
