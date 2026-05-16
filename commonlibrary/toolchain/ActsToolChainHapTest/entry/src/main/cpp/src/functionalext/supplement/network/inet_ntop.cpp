/**
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
#include "functionalext.h"

typedef void (*TEST_FUN)();

/*
 * @tc.name      : InetNtop0100
 * @tc.desc      : Verify that the data format is converted to IP address format (the address cluster is AF_INET).
 * @tc.level     : Level 0
 */
void InetNtop0100(void)
{
    char ip4test[] = "10.10.0.1";
    struct in_addr sinAddr;
    inet_pton(AF_INET, ip4test, &sinAddr);
    const char *ptr = inet_ntop(AF_INET, &sinAddr, ip4test, sizeof(ip4test));
    EXPECT_PTRNE("InetNtop0100", ptr, NULL);
    EXPECT_STREQ("InetNtop0100", ptr, ip4test);
}

/*
 * @tc.name      : InetNtop0200
 * @tc.desc      : Verify that the data format is converted to the IP address format
 *                 (the address cluster is AF_INET6, and the metadata is colon and hexadecimal notation)
 * @tc.level     : Level 0
 */
void InetNtop0200(void)
{
    char ip6test[] = "A157:CD01:3579:1526:DBAC:EF21:4356:7879";
    struct in_addr sinAddr;
    inet_pton(AF_INET6, ip6test, &sinAddr);
    const char *ptr = inet_ntop(AF_INET6, &sinAddr, ip6test, sizeof(ip6test));
    EXPECT_PTRNE("InetNtop0200", ptr, NULL);
    EXPECT_STREQ("InetNtop0200", ptr, ip6test);
}

/*
 * @tc.name      : InetNtop0300
 * @tc.desc      : Verify data format is converted to IP address format
 *                 (address cluster is AF_INET6, metadata is 0-bit compressed notation)
 * @tc.level     : Level 0
 */
void InetNtop0300(void)
{
    char ip6test[] = "fe80::bed5:4695:6cac:bef8";
    struct in_addr sinAddr;
    inet_pton(AF_INET6, ip6test, &sinAddr);
    const char *ptr = inet_ntop(AF_INET6, &sinAddr, ip6test, sizeof(ip6test));
    EXPECT_PTRNE("InetNtop0300", ptr, NULL);
    EXPECT_STREQ("InetNtop0300", ptr, ip6test);
}

/*
 * @tc.name      : InetNtop0400
 * @tc.desc      : Verify that the data format is converted to IP address format
 *                 (the address cluster is AF_INET6, and the metadata is the embedded Ipv address notation)
 * @tc.level     : Level 0
 */
void InetNtop0400(void)
{
    char ip6test[] = "::10.10.0.1";
    struct in_addr sinAddr;
    inet_pton(AF_INET6, ip6test, &sinAddr);
    const char *ptr = inet_ntop(AF_INET6, &sinAddr, ip6test, sizeof(ip6test));
    EXPECT_PTRNE("InetNtop0400", ptr, NULL);
    EXPECT_EQ("InetNtop0400", ptr, ip6test);
}

/*
 * @tc.name      : InetNtop0500
 * @tc.desc      : Verify that the data format is converted to IP address format (the address cluster is AF_UNIX)
 * @tc.level     : Level 2
 */
void InetNtop0500(void)
{
    char ip4test[] = "10.10.0.1";
    struct in_addr sinAddr;
    inet_pton(AF_UNIX, ip4test, &sinAddr);
    const char *ptr = inet_ntop(AF_UNIX, &sinAddr, ip4test, sizeof(ip4test));
    EXPECT_PTREQ("InetNtop0500", ptr, NULL);
}

/*
 * @tc.name      : InetNtop0600
 * @tc.desc      : Verify that the data format is converted to IP address format (the address cluster is AF_INET6)
 * @tc.level     : Level 2
 */
void InetNtop0600(void)
{
    char ip6test[] = "10.10.0.1";
    struct in_addr sinAddr;
    inet_pton(AF_INET6, ip6test, &sinAddr);
    const char *ptr = inet_ntop(AF_INET6, &sinAddr, ip6test, sizeof(ip6test));
    EXPECT_PTREQ("InetNtop0600", ptr, NULL);
}

static TEST_FUN g_gFunArray[] = {
    InetNtop0100,
    InetNtop0200,
    InetNtop0300,
    InetNtop0400,
    InetNtop0500,
    InetNtop0600,
};

static int InetNtopTestImpl(int argc, char *argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(g_gFunArray[0]);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int InetNtopTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return InetNtopTestImpl(1, libcArgv);
}
