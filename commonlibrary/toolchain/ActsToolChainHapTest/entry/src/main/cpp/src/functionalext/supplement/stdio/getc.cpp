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

static const char *WRSTRING = "This is a test sample!";
static const char *PATH = "/data/storage/el2/base/cache/test.txt";

/**
 * @tc.name      : Getc0100
 * @tc.desc      : Verify that the characters in the file can be get
 * @tc.level     : Level 0
 */
static void Getc0100(void)
{
    FILE *fptr = fopen(PATH, "w+");
    if (!fptr) {
        t_error("%s fopen failed\n", __func__);
    }

    size_t ret = fwrite(WRSTRING, sizeof(char), strlen(WRSTRING), fptr);
    if (ret < 0) {
        t_error("%s fwrite failed\n", __func__);
    }

    int fret = fseek(fptr, 0, SEEK_SET);
    if (fret != 0) {
        t_error("%s fseek failed\n", __func__);
    }
    char ch = getc(fptr);
    if (ch != 'T') {
        t_error("%s getc failed\n", __func__);
    }

    (void)fclose(fptr);
    (void)remove(PATH);
}

static int GetcTestImpl(int argc, char *argv[])
{
    Getc0100();
    return g_tStatus;
}

int GetcTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return GetcTestImpl(1, libcArgv);
}
