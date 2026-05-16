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

#include <stdio_ext.h>
#include "functionalext.h"

static const char *PATH = "/data/storage/el2/base/cache/freadable.txt";

/**
 * @tc.name      : __freadable_0100
 * @tc.desc      : The parameters are valid, and the file can be judged to be readable.
 * @tc.level     : Level 0
 */
void Freadable0100(void)
{
    char buf[100];
    FILE *fp = fopen(PATH, "w");
    EXPECT_PTRNE("Freadable0100", fp, nullptr);
    fclose(fp);
    FILE *ffp = fopen(PATH, "r");
    EXPECT_PTRNE("Freadable0100", ffp, nullptr);

    size_t ret = __freadable(ffp);
    EXPECT_NE("Freadable0100", ret, 0);

    fclose(ffp);
    remove(PATH);
}

/**
 * @tc.name      : __freadable_0200
 * @tc.desc      : The parameters are valid, and the file can be judged to be unreadable.
 * @tc.level     : Level 1
 */
void Freadable0200(void)
{
    FILE *fp = fopen(PATH, "wb");
    EXPECT_PTRNE("Freadable0200", fp, nullptr);

    size_t ret = __freadable(fp);
    EXPECT_EQ("Freadable0200", ret, 0);

    fclose(fp);
    remove(PATH);
}

static int FreadableTestWithArgs(int argc, char *argv[])
{
    Freadable0100();
    Freadable0200();
    return g_tStatus;
}

int FreadableTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FreadableTestWithArgs(1, libcArgv);
}
