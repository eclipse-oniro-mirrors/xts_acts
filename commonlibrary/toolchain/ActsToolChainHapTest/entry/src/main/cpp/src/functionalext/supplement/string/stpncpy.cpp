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

#include <csignal>
#include <cstdlib>
#include <cstring>

#include "test.h"

#define BUF_SIZE (13)

static void Handler(int sig)
{
    exit(g_tStatus);
}

/**
 * @tc.name      : stpncpy_0100
 * @tc.desc      : copy a string returning a pointer to its end
 * @tc.level     : Level 0
 */
void Stpncpy0100(void)
{
    char buf[BUF_SIZE];
    memset(buf, 'A', sizeof(buf));

    char *src = "Hello";
    char *dest = (char *)buf;
    stpncpy(dest, src, strlen(src));

    if (strncmp(src, buf, strlen(src))) {
        t_error("%s failed: src = %s, buf = %s\n", __func__, src, buf);
        return;
    }

    for (int i = strlen(src) + 1; i < BUF_SIZE; i++) {
        if (buf[i] != 'A') {
            t_error("%s failed: buf[%d] = %c\n", __func__, i, buf[i]);
            return;
        }
    }
}

/**
 * @tc.name      : stpncpy_0200
 * @tc.desc      : copy an empty string returning a pointer to its end
 * @tc.level     : Level 1
 */
void Stpncpy0200(void)
{
    char buf[1];
    memset(buf, 0, sizeof(buf));

    char *src = "";
    char *dest = (char *)buf;
    stpncpy(dest, src, strlen(src));

    if (strcmp(src, buf)) {
        t_error("%s failed: src = %s, buf = %s\n", __func__, src, buf);
        return;
    }

    if (buf[0] != '\0') {
        t_error("%s failed: buf[0] = %c\n", __func__, buf[0]);
        return;
    }
}

/**
 * @tc.name      : stpncpy_0300
 * @tc.desc      : copy a string with the same size
 * @tc.level     : Level 1
 */
void Stpncpy0300(void)
{
    char buf[BUF_SIZE];
    memset(buf, 'A', sizeof(buf));

    char *src = "Hello world!";
    char *dest = (char *)buf;
    stpncpy(dest, src, strlen(src));

    if (strncmp(src, buf, strlen(src))) {
        t_error("%s failed: src = %s, buf = %s\n", __func__, src, buf);
        return;
    }
}

/**
 * @tc.name      : stpncpy_0400
 * @tc.desc      : copy a string to a nullptr pointer
 * @tc.level     : Level 2
 */
void Stpncpy0400(void)
{
    signal(SIGSEGV, Handler);

    char *src = "Hello world!";
    stpncpy(nullptr, src, strlen(src));
}

static int StpncpyTestImpl(int argc, char *argv[])
{
    Stpncpy0100();
    Stpncpy0200();
    Stpncpy0300();
    Stpncpy0400();

    return g_tStatus;
}

int StpncpyTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return StpncpyTestImpl(1, libcArgv);
}
