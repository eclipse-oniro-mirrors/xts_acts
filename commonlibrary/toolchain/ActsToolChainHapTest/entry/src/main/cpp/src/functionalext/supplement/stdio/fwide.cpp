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
#include <cwchar>
#include "functionalext.h"

static const char *PATH = "/data/storage/el2/base/cache/test.txt";

/**
 * @tc.name      : Fwide0100
 * @tc.desc      : Verify that the set byte stream is a wide character stream (valid, mode > 0)
 * @tc.level     : Level 0
 */
void Fwide0100(void)
{
    FILE *fp = fopen(PATH, "w+");
    EXPECT_PTRNE("Fwide0100", fp, NULL);

    int result = fwide(fp, 5);
    EXPECT_TRUE("Fwide0100", result > 0);

    (void)fclose(fp);
    (void)remove(PATH);
}

/**
 * @tc.name      : Fwide0200
 * @tc.desc      : Verify that the set byte stream remains as it is (all parameters are valid, mode equals 0)
 * @tc.level     : Level 0
 */
void Fwide0200(void)
{
    FILE *fp = fopen(PATH, "w+");
    EXPECT_PTRNE("Fwide0100", fp, NULL);

    int result = fwide(fp, 0);
    EXPECT_EQ("Fwide0200", result, 0);

    (void)fclose(fp);
    (void)remove(PATH);
}

/**
 * @tc.name      : Fwide0300
 * @tc.desc      : Verify that the set byte stream is a multi-byte character stream (valid with mode less than 0)
 * @tc.level     : Level 0
 */
void Fwide0300(void)
{
    FILE *fp = fopen(PATH, "w+");
    EXPECT_PTRNE("Fwide0100", fp, NULL);

    int result = fwide(fp, -5);
    EXPECT_TRUE("Fwide0300", result < 0);

    (void)fclose(fp);
    (void)remove(PATH);
}

static int FwideTestImpl(int argc, char *argv[])
{
    Fwide0100();
    Fwide0200();
    Fwide0300();
    return g_tStatus;
}

int FwideTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FwideTestImpl(1, libcArgv);
}
