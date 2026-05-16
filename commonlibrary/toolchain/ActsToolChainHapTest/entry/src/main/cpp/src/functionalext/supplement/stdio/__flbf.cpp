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

/**
 * @tc.name      : Flbf0100
 * @tc.desc      : Line buffer test
 * @tc.level     : Level 0
 */
void Flbf0100(void)
{
    char buf[BUFSIZ];

    FILE* fp = fopen("/dev/null", "r");
    EXPECT_PTRNE("Flbf0100", fp, nullptr);
    if (fp == nullptr) {
        return;
    }

    int ret = setvbuf(fp, buf, _IOLBF, sizeof buf);
    EXPECT_EQ("Flbf0100", ret, 0);

    int result = __flbf(fp);
    EXPECT_TRUE("Flbf0100", result);
    (void)fclose(fp);
}

/**
 * @tc.name      : Flbf0200
 * @tc.desc      : Full buffer test
 * @tc.level     : Level 2
 */
void Flbf0200(void)
{
    char buf[BUFSIZ];

    FILE* fp = fopen("/dev/null", "r");
    EXPECT_PTRNE("Flbf0200", fp, nullptr);
    if (fp == nullptr) {
        return;
    }

    int ret = setvbuf(fp, buf, _IOFBF, sizeof buf);
    EXPECT_EQ("Flbf0200", ret, 0);

    int result = __flbf(fp);
    EXPECT_FALSE("Flbf0200", result);
    (void)fclose(fp);
}

/**
 * @tc.name      : Flbf0300
 * @tc.desc      : Unbuffered test
 * @tc.level     : Level 2
 */
void Flbf0300(void)
{
    char buf[BUFSIZ];

    FILE* fp = fopen("/dev/null", "r");
    EXPECT_PTRNE("Flbf0300", fp, nullptr);
    if (fp == nullptr) {
        return;
    }

    int ret = setvbuf(fp, buf, _IONBF, sizeof buf);
    EXPECT_EQ("Flbf0300", ret, 0);

    int result = __flbf(fp);
    EXPECT_FALSE("Flbf0300", result);
    (void)fclose(fp);
}

static int FlbfTestWithArgs(int argc, char* argv[])
{
    Flbf0100();
    Flbf0200();
    Flbf0300();
    return T_STATUS;
}

int FlbfTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return FlbfTestWithArgs(1, libcArgvStub);
}
