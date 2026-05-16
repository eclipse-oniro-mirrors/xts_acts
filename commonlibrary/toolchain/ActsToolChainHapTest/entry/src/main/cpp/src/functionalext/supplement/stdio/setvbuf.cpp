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
#include "filepath_util.h"

/**
 * @tc.name      : setvbuf_0100
 * @tc.desc      : Authentication is successful (call the setvbuf function to see the return value)
 * @tc.level     : Level 0
 */
void Setvbuf0100(void)
{
    char buff[1024] = {0};
    char path[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_FILE_TXT, path, sizeof(path))) {
        return;
    }
    FILE *fptr = fopen(path, "w+");
    EXPECT_PTRNE("setvbuf_0100", fptr, NULL);

    int result = setvbuf(fptr, buff, _IOFBF, 1024);
    EXPECT_EQ("setvbuf_0100", result, 0);

    (void)fclose(fptr);
    (void)remove(path);
}

/**
 * @tc.name      : setvbuf_0200
 * @tc.desc      : Authentication is fails (call the setvbuf function to see the return value)
 * @tc.level     : Level 2
 */
void Setvbuf0200(void)
{
    char buff[1024] = {0};
    char path[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_FILE_TXT, path, sizeof(path))) {
        return;
    }
    FILE *fptr = fopen(path, "w+");
    EXPECT_PTRNE("setvbuf_0100", fptr, NULL);

    int result = setvbuf(fptr, buff, -1, 1024);
    EXPECT_EQ("setvbuf_0200", result, -1);

    (void)fclose(fptr);
    (void)remove(path);
}

static int SetvbufTestImpl(int argc, char *argv[])
{
    Setvbuf0100();
    Setvbuf0200();
    return g_tStatus;
}

int SetvbufTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return SetvbufTestImpl(1, libcArgv);
}
