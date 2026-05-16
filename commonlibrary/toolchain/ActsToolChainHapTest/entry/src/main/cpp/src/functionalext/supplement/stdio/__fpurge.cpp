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

#define BUFFER_SIZE 100

/**
 * @tc.name      : __fpurge_0100
 * @tc.desc      : Each parameter value is valid and can be used to completely clear the data in the buffer.
 * @tc.level     : Level 0
 */
void Fpurge0100()
{
    char buf[BUFFER_SIZE];
    char *str = "This is a test";
    FILE *fp = fopen("/data/storage/el2/base/cache/fpurge.txt", "w");
    EXPECT_PTRNE("Fpurge0100", fp, nullptr);

    fputs(str, fp);
    size_t ret = __fpurge(fp);
    fgets(buf, BUFFER_SIZE, fp);
    EXPECT_EQ("Fpurge0100", strstr(buf, str), 0);
    EXPECT_EQ("Fpurge0100", ret, 0);

    fclose(fp);
    remove("/data/storage/el2/base/cache/fpurge.txt");
}

static int FpurgeTestWithArgs(int argc, char *argv[])
{
    Fpurge0100();
    return g_tStatus;
}

int FpurgeTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FpurgeTestWithArgs(1, libcArgv);
}
