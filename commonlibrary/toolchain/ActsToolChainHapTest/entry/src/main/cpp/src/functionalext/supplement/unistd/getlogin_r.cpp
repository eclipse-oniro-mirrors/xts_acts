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

#include <cstddef>
#include <cstdlib>
#include <unistd.h>
#include "functionalext.h"

namespace {
constexpr size_t K_LOGIN_BUF_BYTES = 256U;
constexpr int K_GETLOGIN_R_STRLEN_ERR = 6;
} // namespace

/**
 * @tc.name      : GetloginR0100
 * @tc.desc      : Successfully obtained the logged in username.
 * @tc.level     : Level 0
 */
void GetloginR0100(void)
{
    char login[K_LOGIN_BUF_BYTES];
    int ret = getlogin_r(login, K_LOGIN_BUF_BYTES);
    if (ret == K_GETLOGIN_R_STRLEN_ERR) {
        int senv = setenv("LOGNAME", "newlogname", 10);
        EXPECT_EQ("Getlogin0100", senv, 0);

        ret = getlogin_r(login, K_LOGIN_BUF_BYTES);
        EXPECT_EQ("Getlogin0100", ret, 0);
        unsetenv("LOGNAME");
    } else {
        EXPECT_EQ("Getlogin0100", ret, 0);
    }
}

/**
 * @tc.name      : GetloginR0200
 * @tc.desc      : The parameter is invalid. Failed to get the logged in user name.
 * @tc.level     : Level 2
 */
void GetloginR0200(void)
{
    int ret = 0;
    char login[K_LOGIN_BUF_BYTES];
    ret = getlogin_r(login, 0);
    EXPECT_NE("GetloginR0200", ret, 0);
}

static int GetloginRTestImpl(int argc, char* argv[])
{
    GetloginR0100();
    GetloginR0200();
    return T_STATUS;
}

int GetloginRTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetloginRTestImpl(1, libcArgvStub);
}
