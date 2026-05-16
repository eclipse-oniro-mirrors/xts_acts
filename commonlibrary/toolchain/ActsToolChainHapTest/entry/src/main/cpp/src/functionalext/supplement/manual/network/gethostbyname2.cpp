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

#include <arpa/inet.h>
#include <cctype>
#include <netinet/in.h>
#include <netdb.h>
#include <cstdio>
#include <sys/socket.h>
#include "functionalext.h"

typedef void (*TEST_FUN)();

/**
 * @tc.name      : gethostbyname2_0100
 * @tc.desc      : Verify that host information can be obtained (all parameters are valid, fd is AF_INET)
 * @tc.level     : Level 0
 */
void Gethostbyname20100(void)
{
    struct hostent *hptr = gethostbyname2("127.0.0.1", AF_INET);
    bool flag = false;
    if (hptr != nullptr) {
        flag = true;
    }
    EXPECT_TRUE("Gethostbyname20100", flag);
    EXPECT_STREQ("Gethostbyname20100", hptr->h_name, "127.0.0.1");
}

/**
 * @tc.name      : gethostbyname2_0200
 * @tc.desc      : Verify that the host information can be obtained (all parameters are valid, fd is AF_INET6)
 * @tc.level     : Level 0
 */
void Gethostbyname20200(void)
{
    struct hostent *hptr = gethostbyname2("::1", AF_INET6);
    bool flag = false;
    if (hptr != nullptr) {
        flag = true;
    }
    EXPECT_TRUE("Gethostbyname20200", flag);
    EXPECT_STREQ("Gethostbyname20200", hptr->h_name, "::1");
}

/**
 * @tc.name      : gethostbyname2_0300
 * @tc.desc      : Verify cannot get host information (name parameter invalid)
 * @tc.level     : Level 2
 */
void Gethostbyname20300(void)
{
    struct hostent *hptr = gethostbyname2("127.0.w.1", AF_INET6);
    bool flag = false;
    if (hptr == nullptr) {
        flag = true;
    }
    EXPECT_TRUE("Gethostbyname20300", flag);
}

/**
 * @tc.name      : gethostbyname2_0400
 * @tc.desc      : Verify that host information cannot be obtained (fd parameter invalid)
 * @tc.level     : Level 2
 */
void Gethostbyname20400(void)
{
    struct hostent *hptr = gethostbyname2("::1", AF_INET);
    bool flag = false;
    if (hptr == nullptr) {
        flag = true;
    }
    EXPECT_TRUE("Gethostbyname20400", flag);
}

static TEST_FUN g_gFunArray[] = {
    Gethostbyname20100,
    Gethostbyname20200,
    Gethostbyname20300,
    Gethostbyname20400,
};

static int Gethostbyname2TestImpl(int argc, char *argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return g_tStatus;
}

int Gethostbyname2Test(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return Gethostbyname2TestImpl(1, libcArgv);
}
