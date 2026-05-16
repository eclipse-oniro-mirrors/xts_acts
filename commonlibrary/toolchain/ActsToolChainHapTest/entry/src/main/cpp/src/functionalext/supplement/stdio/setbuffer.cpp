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
 * @tc.name      : Setbuffer0100
 * @tc.desc      : The buffer type is _IOFBF
 * @tc.level     : Level 0
 */
void Setbuffer0100(void)
{
    char path[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_FILE_TXT, path, sizeof(path))) {
        return;
    }
    FILE *fp = fopen(path, "w+");
    char buf[BUFSIZ] = {0};
    errno = 0;
    setbuffer(fp, buf, BUFSIZ);
    if (errno != 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    (void)fputs(STR, fp);
    if (fflush(fp) != 0) {
        t_error("%s fflush failed\n", __func__);
    }
    (void)fclose(fp);

    fp = fopen(path, "r");

    memset(buf, 0, sizeof(buf));
    (void)fread(buf, sizeof(buf), 1, fp);

    if (strcmp(buf, STR)) {
        t_error("%s failed: setbuf. buf = %s\n", __func__, buf);
    }

    (void)fclose(fp);
    (void)remove(path);
}

/**
 * @tc.name      : Setbuffer0200
 * @tc.desc      : Stream buffering operations with NULL
 * @tc.level     : Level 1
 */
void Setbuffer0200(void)
{
    char path[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_FILE_TXT, path, sizeof(path))) {
        return;
    }
    FILE *f = fopen(path, "w+");

    errno = 0;
    setbuffer(f, nullptr, BUFSIZ);
    if (errno != 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    (void)fclose(f);
    (void)remove(path);
}

static int SetbufferTestImpl(int argc, char *argv[])
{
    Setbuffer0100();
    Setbuffer0200();
    return g_tStatus;
}

int SetbufferTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return SetbufferTestImpl(1, libcArgv);
}
