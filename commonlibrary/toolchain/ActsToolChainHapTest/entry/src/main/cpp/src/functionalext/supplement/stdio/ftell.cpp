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

#include <fcntl.h>
#include <cstdio>
#include <cstring>
#include "test.h"

#define STR_LEN 22
#define MID_OFFSET 8
static const char *WRSTRING = "This is a test sample!";
static const char *PATH = "/data/storage/el2/base/cache/test.txt";

/**
 * @tc.name      : ftell_0100
 * @tc.desc      : Verify that the file pointer is at the beginning (call the ftell function to see the return value)
 * @tc.level     : Level 0
 */
static void Ftell0100(void)
{
    FILE *fptr = fopen(PATH, "w+");
    if (!fptr) {
        t_error("%s fopen failed\n", __func__);
    }

    size_t ret = fwrite(WRSTRING, sizeof(char), strlen(WRSTRING), fptr);
    if (ret < 0) {
        t_error("%s fwrite failed\n", __func__);
    }

    int fret = fseek(fptr, 0L, SEEK_SET);
    if (fret != 0) {
        t_error("%s fseek failed\n", __func__);
    }

    long result = ftell(fptr);
    if (result != 0) {
        t_error("%s ftell failed\n", __func__);
    }

    (void)fclose(fptr);
    (void)remove(PATH);
}

/**
 * @tc.name      : ftell_0200
 * @tc.desc      : Verify that the file pointer is in the middle (call the ftell function to see the return value)
 * @tc.level     : Level 0
 */
void Ftell0200(void)
{
    FILE *fptr = fopen(PATH, "w+");
    if (!fptr) {
        t_error("%s fopen failed\n", __func__);
    }

    size_t ret = fwrite(WRSTRING, sizeof(char), strlen(WRSTRING), fptr);
    if (ret < 0) {
        t_error("%s fwrite failed\n", __func__);
    }

    int fret = fseek(fptr, MID_OFFSET, SEEK_SET);
    if (fret != 0) {
        t_error("%s fseek failed\n", __func__);
    }

    long result = ftell(fptr);
    if (result != MID_OFFSET) {
        t_error("%s ftell failed\n", __func__);
    }

    (void)fclose(fptr);
    (void)remove(PATH);
}

/**
 * @tc.name      : ftell_0300
 * @tc.desc      : Verify that the file pointer is at the end (call the ftell function to see the return value)
 * @tc.level     : Level 0
 */
void Ftell0300(void)
{
    FILE *fptr = fopen(PATH, "w+");
    if (!fptr) {
        t_error("%s fopen failed\n", __func__);
    }

    size_t ret = fwrite(WRSTRING, sizeof(char), strlen(WRSTRING), fptr);
    if (ret < 0) {
        t_error("%s fwrite failed\n", __func__);
    }

    int fret = fseek(fptr, 0L, SEEK_END);
    if (fret != 0) {
        t_error("%s fseek failed\n", __func__);
    }
    long result = ftell(fptr);
    if (result != STR_LEN) {
        t_error("%s ftell failed\n", __func__);
    }

    (void)fclose(fptr);
    (void)remove(PATH);
}

static int FtellTestImpl(int argc, char *argv[])
{
    Ftell0100();
    Ftell0200();
    Ftell0300();

    return g_tStatus;
}

int FtellTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FtellTestImpl(1, libcArgv);
}
