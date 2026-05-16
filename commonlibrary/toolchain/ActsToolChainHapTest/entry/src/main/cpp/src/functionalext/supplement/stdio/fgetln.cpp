/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

/**
 * @tc.name       : Fgetln0100
 * @tc.desc       : Returns a pointer to the next line from the stream referenced by stream
 * @tc.level      : level 0
 */
void Fgetln0100(void)
{
    size_t plen;

    FILE *f = fopen("/data/storage/el2/base/cache/test.txt", "w+");
    if (!f) {
        t_error("%s fopen failed\n", __func__);
    }

    (void)fputs("HelloWorld", f);
    if (fseek(f, 0, SEEK_SET) != 0) {
        t_error("%s fseek failed\n", __func__);
    }
    char *result = fgetln(f, &plen);
    if (!result) {
        t_error("%s fgetln failed\n", __func__);
    }
    if (strcmp(result, "HelloWorld")) {
        t_error("%s result is %s, not HelloWorld\n", __func__, result);
    }
    if (plen != strlen(result)) {
        t_error("%s failed, plen is %zu\n", __func__, plen);
    }

    (void)fclose(f);
    (void)remove("/data/storage/el2/base/cache/test.txt");
}

/**
 * @tc.name       : Fgetln0200
 * @tc.desc       : Test fgetln with invalid file pointer
 * @tc.level      : level 2
 */
void Fgetln0200(void)
{
    size_t plen;

    FILE *f = fopen("/data/storage/el2/base/cache/test.txt", "w+");
    if (!f) {
        t_error("%s fopen failed\n", __func__);
    }

    char *result = fgetln(f, &plen);
    if (result) {
        t_error("%s fgetln should be failed\n", __func__);
    }

    (void)fclose(f);
    (void)remove("/data/storage/el2/base/cache/test.txt");
}

static int FgetlnTestImpl(int argc, char *argv[])
{
    Fgetln0100();
    Fgetln0200();
    return g_tStatus;
}

int FgetlnTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FgetlnTestImpl(1, libcArgv);
}
