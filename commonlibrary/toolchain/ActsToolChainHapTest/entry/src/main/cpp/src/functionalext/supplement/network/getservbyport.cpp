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

#define TEST_GET_SEVERBY_TCP_PORT 25
#define TEST_GET_SEVERBY_UDP_PORT 7
/**
 * @tc.name      : Getservbyport0100
 * @tc.desc      : Get the service information of the specified port
 * @tc.level     : Level 0
 */
void Getservbyport0100(void)
{
    struct servent* se = getservbyport(htons(TEST_GET_SEVERBY_TCP_PORT), nullptr);
    if (se) {
        EXPECT_EQ("Getservbyport0100", ntohs(se->s_port), TEST_GET_SEVERBY_TCP_PORT);
        EXPECT_STREQ("Getservbyport0100", se->s_proto, "tcp");
    }

    se = getservbyport(htons(TEST_GET_SEVERBY_TCP_PORT), "tcp");
    if (se) {
        EXPECT_EQ("Getservbyport0100", ntohs(se->s_port), TEST_GET_SEVERBY_TCP_PORT);
        EXPECT_STREQ("Getservbyport0100", se->s_proto, "tcp");
    }

    se = getservbyport(htons(TEST_GET_SEVERBY_UDP_PORT), "udp");
    if (se) {
        EXPECT_EQ("Getservbyport0100", ntohs(se->s_port), TEST_GET_SEVERBY_UDP_PORT);
        EXPECT_STREQ("Getservbyport0100", se->s_proto, "udp");
    }
}

static int GetservbyportTestImpl(void)
{
    Getservbyport0100();
    return T_STATUS;
}

int GetservbyportTest(void)
{
    return GetservbyportTestImpl();
}
