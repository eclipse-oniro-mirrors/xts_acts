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

#include <cerrno>
#include <cstdio>
#include <cstring>
#include "filepath_util.h"

static const char *STR = "Hello";

/**
 * @tc.name      : Setlinebuf0100
 * @tc.desc      : Set file stream to linear buffer
 * @tc.level     : Level 0
 */
void Setlinebuf0100(void)
{
    char path[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_FILE_TXT, path, sizeof(path))) {
        return;
    }
    FILE *f = fopen(path, "w+");
    char buffer[BUFSIZ];
    errno = 0;
    setlinebuf(f);
    if (errno != 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    (void)fputs(STR, f);
    (void)fclose(f);
    f = fopen(path, "r");

    memset(buffer, 0, sizeof(buffer));
    (void)fread(buffer, sizeof(buffer), 1, f);

    if (strcmp(buffer, STR)) {
        t_error("%s failed: setlinebuf. buf = %s\n", __func__, buffer);
    }
    (void)fclose(f);
    (void)remove(path);
}

/**
 * @tc.name      : Setlinebuf0200
 * @tc.desc      : Output to console
 * @tc.level     : Level 2
 */
void Setlinebuf0200(void)
{
    errno = 0;
    setlinebuf(stdout);
    if (errno != 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    printf("test");
    sleep(1);
}

static int SetlinebufTestImpl(int argc, char *argv[])
{
    Setlinebuf0100();
    Setlinebuf0200();
    return g_tStatus;
}

int SetlinebufTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return SetlinebufTestImpl(1, libcArgv);
}
