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
 * @tc.name      : Fbufsize0100
 * @tc.desc      : Returns the size of the buffer currently used by the given stream
 * @tc.level     : Level 0
 */
void Fbufsize0100(void)
{
    char buf[1024];
    /* /proc/version is unavailable in many OHOS HAP sandboxes; use /dev/null. */
    FILE* fp = fopen("/dev/null", "r");
    EXPECT_PTRNE("Fbufsize0100", fp, nullptr);
    if (fp == nullptr) {
        return;
    }

    int ret = setvbuf(fp, buf, _IOFBF, sizeof buf);
    EXPECT_NE("Fbufsize0100", ret, EOF);

    size_t result = __fbufsize(fp);
    EXPECT_TRUE("Fbufsize0100", result <= sizeof buf);

    (void)fclose(fp);
}

/**
 * @tc.name      : Fbufsize0200
 * @tc.desc      : Returns the size of the buffer currently used by the given stream when the file size is 0
 * @tc.level     : Level 0
 */
void Fbufsize0200(void)
{
    FILE* fp = fopen("/dev/null", "r");
    EXPECT_PTRNE("Fbufsize0200", fp, nullptr);
    if (fp == nullptr) {
        return;
    }

    int ret = setvbuf(fp, nullptr, _IONBF, 0);
    EXPECT_NE("Fbufsize0200", ret, EOF);

    size_t result = __fbufsize(fp);
    EXPECT_EQ("Fbufsize0200", result, 0U);

    (void)fclose(fp);
}

static int FbufsizeTestWithArgs(int argc, char* argv[])
{
    Fbufsize0100();
    Fbufsize0200();
    return T_STATUS;
}

int FbufsizeTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return FbufsizeTestWithArgs(1, libcArgvStub);
}
