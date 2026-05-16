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

#include <cstdlib>
#include <unistd.h>
#include "functionalext.h"

/**
 * @tc.name      : Getlogin0100
 * @tc.desc      : Successfully obtained the logged in username.
 * @tc.level     : Level 0
 */
void Getlogin0100(void)
{
    char* ret = getlogin();
    if (ret == nullptr) {
        EXPECT_EQ("Getlogin0100", setenv("LOGNAME", "newlogname", 1), 0);
        ret = getlogin();
        EXPECT_TRUE("Getlogin0100", strcmp(ret, "newlogname") == 0);
        unsetenv("LOGNAME");
    } else {
        EXPECT_TRUE("Getlogin0100", strcmp(ret, getenv("LOGNAME")) == 0);
    }
}

static int GetloginTestImpl(int argc, char* argv[])
{
    Getlogin0100();
    return T_STATUS;
}

int GetloginTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetloginTestImpl(1, libcArgvStub);
}
