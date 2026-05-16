/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <mntent.h>
#include "functionalext.h"

/**
 * @tc.name      : endmntent_0100
 * @tc.desc      : Verify that the stream and its associated file system description file can be closed
 * @tc.level     : Level 0
 */
void Endmntent0100(void)
{
    FILE* fp = fopen("/data/storage/el2/base/cache/test.txt", "w+");
    EXPECT_PTRNE("Endmntent0100", fp, nullptr);

    int result = endmntent(fp);
    EXPECT_EQ("Endmntent0100", result, 1);
    int removeRet = remove("/data/storage/el2/base/cache/test.txt");
    EXPECT_EQ("Endmntent0100", removeRet, 0);
}

static int EndmntentTestWithArgs(int argc, char* argv[])
{
    Endmntent0100();
    return T_STATUS;
}

int EndmntentTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return EndmntentTestWithArgs(1, libcArgv);
}

int EndmntentTestCompat(void)
{
    return EndmntentTest();
}
