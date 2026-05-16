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
#include <netdb.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include "functionalext.h"

/**
 * @tc.name      : GethostbyaddrR0100
 * @tc.desc      : Each parameter is valid, and multiple threads simultaneously obtain host information.
 * @tc.level     : Level 0
 */
void GethostbyaddrR0100(void)
{
    struct hostent h;
    struct hostent* res = nullptr;
    char buf[8192] = { 0 };
    int err = 0;
    in_addr_t a = inet_addr("127.0.0.1");
    int ret = gethostbyaddr_r(reinterpret_cast<void*>(&a), 4, AF_INET, &h, buf, sizeof(buf), &res, &err);
    EXPECT_EQ("GethostbyaddrR0100", ret, 0);
    EXPECT_TRUE("GethostbyaddrR0100", strcmp(h.h_name, "localhost") == 0);
}

/**
 * @tc.name      : GethostbyaddrR0200
 * @tc.desc      : Invalid parameter, failed to get host information.
 * @tc.level     : Level 2
 */
void GethostbyaddrR0200(void)
{
    struct hostent h;
    struct hostent* res = nullptr;
    char buf[8192] = { 0 };
    int err = 0;
    in_addr_t a = inet_addr("127.0.0.1");
    int ret = gethostbyaddr_r(reinterpret_cast<void*>(&a), 0, AF_INET, &h, buf, sizeof(buf), &res, &err);
    EXPECT_NE("GethostbyaddrR0200", ret, 0);
}

static int GethostbyaddrRTestImpl(int argc, char* argv[])
{
    GethostbyaddrR0100();
    GethostbyaddrR0200();
    return T_STATUS;
}

int GethostbyaddrRTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GethostbyaddrRTestImpl(1, libcArgvStub);
}
