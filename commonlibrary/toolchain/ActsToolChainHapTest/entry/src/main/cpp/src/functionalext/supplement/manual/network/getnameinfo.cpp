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
#include <cstdlib>
#include <netdb.h>
#include <sys/socket.h>
#include "functionalext.h"

namespace {
constexpr socklen_t K_GETNAMEINFO_TOO_SMALL_SOCKLEN = 4;
} // namespace

#define HTTP_PORT 80
#define TCPMUX_PORT 1
#define FIDO_PORT 60179
#define NOT_EXIST_PORT 62000
#define NOT_EXIST_PORT_STR "62000"

const int INFO_RESULT = 0;
const int FAMILY_NOTSUPPORTED = -6;

/**
 * @tc.name      : Getnameinfo0100
 * @tc.desc      : Each parameter is valid and can resolve the IP address of the host name(hint.ai_flags =AI_ALL).
 * @tc.level     : Level 0
 */
void Getnameinfo0100()
{
    int ret;
    char host[NI_MAXHOST];
    char server[NI_MAXSERV];
    struct sockaddr_in sa {};
    sa.sin_family = AF_INET;
    inet_pton(AF_INET, "127.0.0.1", &sa.sin_addr.s_addr);
    ret = getnameinfo(
        reinterpret_cast<const struct sockaddr*>(&sa), sizeof(sa), host, sizeof(host), server, sizeof(server), 0);
    EXPECT_EQ("Getnameinfo0100", ret, INFO_RESULT);
    EXPECT_NE("Getnameinfo0100", strlen(host), 0);
    EXPECT_NE("Getnameinfo0100", strlen(server), 0);
}

/**
 * @tc.name      : Getnameinfo0200
 * @tc.desc      : Each parameter is valid and can resolve the IP address of the host name(hint.ai_flags =AI_ALL).
 * @tc.level     : Level 0
 */
void Getnameinfo0200()
{
    int ret = -1;
    int num = -1;
    int res = -1;
    struct addrinfo* result;
    struct addrinfo hint;
    hint.ai_flags = AI_NUMERICHOST;
    hint.ai_family = AF_INET6;
    char buf[] = "fe80::bed5:4695:6cac:bef8";
    ret = getaddrinfo(buf, nullptr, &hint, &result);
    char host[NI_MAXHOST];
    char server[NI_MAXSERV];
    if (ret == 0) {
        res = getnameinfo(result->ai_addr, result->ai_addrlen, host, sizeof(host), server, sizeof(server), 0);
    }
    EXPECT_EQ("Getnameinfo0200", res, INFO_RESULT);
    EXPECT_NE("Getnameinfo0200", strlen(host), 0);
    EXPECT_NE("Getnameinfo0200", strlen(server), 0);
    freeaddrinfo(result);
    result = nullptr;
}

/**
 * @tc.name      : Getnameinfo0300
 * @tc.desc      : Each parameter is valid and can resolve the IP address of the host name(hint.ai_flags =AI_ALL).
 * @tc.level     : Level 1
 */
void Getnameinfo0300()
{
    int ret;
    char host[NI_MAXHOST];
    char server[NI_MAXSERV];
    struct sockaddr_in sa {};
    sa.sin_family = AF_INET;
    inet_pton(AF_INET, "127.0.0.1", &sa.sin_addr.s_addr);
    ret = getnameinfo(reinterpret_cast<const struct sockaddr*>(&sa), sizeof(sa), nullptr, 0, server, sizeof(server), 0);
    EXPECT_EQ("Getnameinfo0300", ret, INFO_RESULT);
    EXPECT_NE("Getnameinfo0300", strlen(server), 0);
}

/**
 * @tc.name      : Getnameinfo0400
 * @tc.desc      : Each parameter is valid and can resolve the IP address of the host name(hint.ai_flags =AI_ALL).
 * @tc.level     : Level 1
 */
void Getnameinfo0400()
{
    int ret;
    char host[NI_MAXHOST];
    char server[NI_MAXSERV];
    struct sockaddr_in sa {};
    sa.sin_family = AF_INET;
    inet_pton(AF_INET, "127.0.0.1", &sa.sin_addr.s_addr);
    ret = getnameinfo(reinterpret_cast<const struct sockaddr*>(&sa), sizeof(sa), host, sizeof(host), nullptr, 0, 0);
    EXPECT_EQ("Getnameinfo0400", ret, INFO_RESULT);
    EXPECT_NE("Getnameinfo0400", strlen(host), 0);
}
/**
 * @tc.name      : Getnameinfo0500
 * @tc.desc      : Each parameter is valid and can resolve the IP address of the host name(hint.ai_flags =AI_ALL).
 * @tc.level     : Level 2
 */
void Getnameinfo0500()
{
    int ret;
    char host[NI_MAXHOST];
    char server[NI_MAXSERV];
    struct sockaddr_in sa {};
    sa.sin_family = AF_INET;
    inet_pton(AF_INET, "127.0.0.1", &sa.sin_addr.s_addr);
    ret = getnameinfo(reinterpret_cast<const struct sockaddr*>(&sa), 4, host, sizeof(host), server, sizeof(server), 0);
    EXPECT_EQ("Getnameinfo0500", ret, FAMILY_NOTSUPPORTED);
}

/**
 * @tc.name      : Getnameinfo0600
 * @tc.desc      : Each parameter is valid and can resolve the IP address of the host name(hint.ai_flags =AI_ALL).
 * @tc.level     : Level 2
 */
void Getnameinfo0600()
{
    int ret = -1;
    int num = -1;
    int res = -1;
    struct addrinfo* result;
    struct addrinfo hint;
    hint.ai_flags = AI_NUMERICHOST;
    hint.ai_family = AF_INET6;
    char buf[] = "fe80::bed5:4695:6cac:bef8";
    ret = getaddrinfo(buf, nullptr, &hint, &result);
    char host[NI_MAXHOST];
    char server[NI_MAXSERV];
    if (ret == 0) {
        res = getnameinfo(
            result->ai_addr, K_GETNAMEINFO_TOO_SMALL_SOCKLEN, host, sizeof(host), server, sizeof(server), 0);
    }
    EXPECT_EQ("Getnameinfo0600", res, FAMILY_NOTSUPPORTED);
    freeaddrinfo(result);
    result = nullptr;
}

/**
 * @tc.name      : Getnameinfo0700
 * @tc.desc      : Each parameter is valid, sa->sa_family is AF_LOCAL, the information of the host cannot be obtained.
 * @tc.level     : Level 2
 */
void Getnameinfo0700()
{
    int ret;
    char host[NI_MAXHOST];
    char server[NI_MAXSERV];
    struct sockaddr_in sa {};
    sa.sin_family = AF_LOCAL;
    ret = getnameinfo(
        reinterpret_cast<const struct sockaddr*>(&sa), sizeof(sa), host, sizeof(host), server, sizeof(server), 0);
    EXPECT_EQ("Getnameinfo0700", ret, FAMILY_NOTSUPPORTED);
}

void Getnameinfo0900()
{
    int ret;
    char* ptr = "127.0.0.1";
    char hostname[128] = { 0 };
    char servername[128] = { 0 };
    struct sockaddr_in addrDst {};
    addrDst.sin_family = AF_INET;
    addrDst.sin_addr.s_addr = inet_addr(ptr);
    addrDst.sin_port = htons(HTTP_PORT);

    ret = getnameinfo(reinterpret_cast<struct sockaddr*>(&addrDst),
                      sizeof(addrDst),
                      hostname,
                      sizeof(hostname),
                      servername,
                      sizeof(servername),
                      0);
    EXPECT_EQ("Getnameinfo0900", ret, 0);
    EXPECT_STREQ("Getnameinfo0900 hostname", hostname, "localhost");
    EXPECT_STREQ("Getnameinfo0900 hostname", servername, "http");
}

void Getnameinfo1000()
{
    int ret;
    char* ptr = "127.0.0.1";
    char hostname[128] = { 0 };
    char servername[128] = { 0 };
    struct sockaddr_in addrDst {};
    addrDst.sin_family = AF_INET;
    addrDst.sin_addr.s_addr = inet_addr(ptr);
    addrDst.sin_port = htons(TCPMUX_PORT);

    ret = getnameinfo(reinterpret_cast<struct sockaddr*>(&addrDst),
                      sizeof(addrDst),
                      hostname,
                      sizeof(hostname),
                      servername,
                      sizeof(servername),
                      0);
    EXPECT_EQ("Getnameinfo1000", ret, 0);
    EXPECT_STREQ("Getnameinfo1000 hostname", hostname, "localhost");
    EXPECT_STREQ("Getnameinfo1000 hostname", servername, "tcpmux");
}

void Getnameinfo1100()
{
    int ret;
    char* ptr = "127.0.0.1";
    char hostname[128] = { 0 };
    char servername[128] = { 0 };
    struct sockaddr_in addrDst {};
    addrDst.sin_family = AF_INET;
    addrDst.sin_addr.s_addr = inet_addr(ptr);
    addrDst.sin_port = htons(FIDO_PORT);

    ret = getnameinfo(reinterpret_cast<struct sockaddr*>(&addrDst),
                      sizeof(addrDst),
                      hostname,
                      sizeof(hostname),
                      servername,
                      sizeof(servername),
                      0);
    EXPECT_EQ("Getnameinfo1100", ret, 0);
    EXPECT_STREQ("Getnameinfo1100 hostname", hostname, "localhost");
    EXPECT_STREQ("Getnameinfo1100 hostname", servername, "fido");
}

void Getnameinfo1200()
{
    int ret;
    char* ptr = "127.0.0.1";
    char hostname[128] = { 0 };
    char servername[128] = { 0 };
    struct sockaddr_in addrDst {};
    addrDst.sin_family = AF_INET;
    addrDst.sin_addr.s_addr = inet_addr(ptr);
    addrDst.sin_port = htons(NOT_EXIST_PORT);

    ret = getnameinfo(reinterpret_cast<struct sockaddr*>(&addrDst),
                      sizeof(addrDst),
                      hostname,
                      sizeof(hostname),
                      servername,
                      sizeof(servername),
                      0);
    EXPECT_EQ("Getnameinfo1200", ret, 0);
    EXPECT_STREQ("Getnameinfo1200 hostname", hostname, "localhost");
    EXPECT_STREQ("Getnameinfo1200 hostname", servername, NOT_EXIST_PORT_STR);
}

static int GetnameinfoTestImpl(int argc, char* argv[])
{
    Getnameinfo0100();
    Getnameinfo0200();
    Getnameinfo0300();
    Getnameinfo0400();
    Getnameinfo0500();
    Getnameinfo0600();
    Getnameinfo0700();
    Getnameinfo0900();
    Getnameinfo1000();
    Getnameinfo1100();
    Getnameinfo1200();
    return T_STATUS;
}

int GetnameinfoTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetnameinfoTestImpl(1, libcArgvStub);
}
