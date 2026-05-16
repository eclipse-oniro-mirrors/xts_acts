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
#define FTP_PORT 21
#define HTTP_PORT 80
#define TCPMUX_PORT 1
#define FIDO_PORT 60179
#define NOT_EXIST_PORT 62000

/**
 * @tc.name      : Getservbyname0100
 * @tc.desc      : Get service entry
 * @tc.level     : Level 0
 */
void Getservbyname0100(void)
{
    struct servent* se = getservbyname("smtp", "tcp");
    if (se) {
        EXPECT_STREQ("Getservbyname0100", se->s_proto, "tcp");
    }

    se = getservbyname("echo", "udp");
    if (se) {
        EXPECT_STREQ("Getservbyname0100", se->s_proto, "udp");
    }
}

/**
 * @tc.name      : Getservbyname0200
 * @tc.desc      : Get the service information of the specified port
 * @tc.level     : Level 0
 */
void Getservbyname0200(void)
{
    struct servent* se = getservbyname("name", "proto");
    EXPECT_PTREQ("Getservbyname0200", se, nullptr);
}

/**
 * @tc.name      : Getservbyname0300
 * @tc.desc      : Get the service information of the specified port
 * @tc.level     : Level 0
 */
void Getservbyname0300(void)
{
    struct servent* se = getservbyname("ftp", "tcp");
    EXPECT_PTRNE("Getservbyname0300", se, nullptr);
    EXPECT_EQ("Getservbyname0300", ntohs(se->s_port), FTP_PORT);
}

/**
 * @tc.name      : Getservbyname0400
 * @tc.desc      : Get the service information of the specified port
 * @tc.level     : Level 0
 */
void Getservbyname0400(void)
{
    struct servent* se = getservbyname("http", "tcp");
    EXPECT_PTRNE("Getservbyname0400", se, nullptr);
    EXPECT_EQ("Getservbyname0400", ntohs(se->s_port), HTTP_PORT);
}

/**
 * @tc.name      : Getservbyname0500
 * @tc.desc      : Get the service information of the specified port
 * @tc.level     : Level 0
 */
void Getservbyname0500(void)
{
    struct servent* se = getservbyname("tcpmux", "tcp");
    EXPECT_PTRNE("Getservbyname0500", se, nullptr);
    EXPECT_EQ("Getservbyname0500", ntohs(se->s_port), TCPMUX_PORT);
}

/**
 * @tc.name      : Getservbyname0600
 * @tc.desc      : Get the service information of the specified port
 * @tc.level     : Level 0
 */
void Getservbyname0600(void)
{
    struct servent* se = getservbyname("fido", "tcp");
    EXPECT_PTRNE("Getservbyname0600", se, nullptr);
    EXPECT_EQ("Getservbyname0600", ntohs(se->s_port), FIDO_PORT);
}

/**
 * @tc.name      : Getservbyname0700
 * @tc.desc      : Get the service information of the specified port
 * @tc.level     : Level 0
 */
void Getservbyname0700(void)
{
    struct servent* se = getservbyname("not_exist_service_name", "tcp");
    EXPECT_PTREQ("Getservbyname0700", se, nullptr);
}

static int GetservbynameTestImpl(void)
{
    Getservbyname0100();
    Getservbyname0200();
    Getservbyname0300();
    Getservbyname0400();
    Getservbyname0500();
    Getservbyname0600();
    Getservbyname0700();
    return T_STATUS;
}

int GetservbynameTest(void)
{
    return GetservbynameTestImpl();
}
