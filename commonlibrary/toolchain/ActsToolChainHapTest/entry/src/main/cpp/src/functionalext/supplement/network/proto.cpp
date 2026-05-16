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

#include <netdb.h>
#include "functionalext.h"

#define TEST_PROTO_NUM 6
#define TEST_INVALID_NUMBER 10240
#define TEST_TERMINATE_SIZE 2

static int g_testIndex = 0;
static const unsigned char TEST_PROTOS[] = {
    "\000ip\0"
    "\001icmp\0"
    "\002igmp\0"
    "\003ggp\0"
    "\004ipencap\0"
    "\005st\0"
    "\006tcp\0"
    "\010egp\0"
    "\014pup\0"
    "\021udp\0"
    "\024hmp\0"
    "\026xns-idp\0"
    "\033rdp\0"
    "\035iso-tp4\0"
    "\044xtp\0"
    "\045ddp\0"
    "\046idpr-cmtp\0"
    "\051ipv6\0"
    "\053ipv6-route\0"
    "\054ipv6-frag\0"
    "\055idrp\0"
    "\056rsvp\0"
    "\057gre\0"
    "\062esp\0"
    "\063ah\0"
    "\071skip\0"
    "\072ipv6-icmp\0"
    "\073ipv6-nonxt\0"
    "\074ipv6-opts\0"
    "\111rspf\0"
    "\121vmtp\0"
    "\131ospf\0"
    "\136ipip\0"
    "\142encap\0"
    "\147pim\0"
    "\377raw"
};

struct protoent* TestGetprotoent(void)
{
    static struct protoent p;
    if (g_testIndex >= sizeof(TEST_PROTOS)) {
        return nullptr;
    }
    p.p_proto = TEST_PROTOS[g_testIndex];
    p.p_name = const_cast<char*>(reinterpret_cast<const char*>(&TEST_PROTOS[g_testIndex + 1]));
    g_testIndex += strlen(p.p_name) + TEST_TERMINATE_SIZE;
    return &p;
}

void TestResetprotoent(void)
{
    g_testIndex = 0;
    setprotoent(0);
    endprotoent();
}

/**
 * @tc.name      : Getprotobyname0100
 * @tc.desc      : Get the specified protocol name by name
 * @tc.level     : Level 0
 */
void Getprotobyname0100(void)
{
    struct protoent* ret = getprotobyname("tcp");
    EXPECT_PTRNE("Getprotobyname0100", ret, nullptr);
    if (ret) {
        EXPECT_STREQ("Getprotobyname0100", ret->p_name, "tcp");
        EXPECT_EQ("Getprotobyname0100", ret->p_proto, TEST_PROTO_NUM);
    }
}

/**
 * @tc.name      : Getprotobyname0200
 * @tc.desc      : Get the specified protocol name by name
 * @tc.level     : Level 2
 */
void Getprotobyname0200(void)
{
    struct protoent* ret = getprotobyname("abcd");
    EXPECT_PTREQ("Getprotobyname0200", ret, nullptr);
}

/**
 * @tc.name      : Getprotobynumber0100
 * @tc.desc      : Get the specified protocol name by number
 * @tc.level     : Level 0
 */
void Getprotobynumber0100(void)
{
    struct protoent* ret = getprotobynumber(TEST_PROTO_NUM);
    EXPECT_PTRNE("Getprotobynumber0100", ret, nullptr);
    if (ret) {
        EXPECT_STREQ("Getprotobynumber0100", ret->p_name, "tcp");
        EXPECT_EQ("Getprotobynumber0100", ret->p_proto, TEST_PROTO_NUM);
    }
}

/**
 * @tc.name      : Getprotobynumber0200
 * @tc.desc      : Get the specified protocol name by number
 * @tc.level     : Level 2
 */
void Getprotobynumber0200(void)
{
    struct protoent* ret = getprotobynumber(TEST_INVALID_NUMBER);
    EXPECT_PTREQ("Getprotobynumber0200", ret, nullptr);
}

/**
 * @tc.name      : Getprotoent0100
 * @tc.desc      : Get the protocol information scheduled by the system
 * @tc.level     : Level 0
 */
void Getprotoent0100(void)
{
    TestResetprotoent();
    struct protoent* dst = nullptr;
    struct protoent* src = nullptr;
    int count = 0;
    bool more = true;
    while (more) {
        dst = getprotoent();
        src = TestGetprotoent();
        if (!dst || !src) {
            more = false;
        } else {
            count++;
            EXPECT_EQ("Getprotoent0100", dst->p_proto, src->p_proto);
            EXPECT_STREQ("Getprotoent0100", dst->p_name, src->p_name);
        }
    }
    EXPECT_TRUE("Getprotoent0100", count > 0);
    TestResetprotoent();
}

static int ProtoTestImpl(void)
{
    Getprotobyname0100();
    Getprotobyname0200();

    Getprotobynumber0100();
    Getprotobynumber0200();

    Getprotoent0100();
    return T_STATUS;
}

int ProtoTest(void)
{
    return ProtoTestImpl();
}
