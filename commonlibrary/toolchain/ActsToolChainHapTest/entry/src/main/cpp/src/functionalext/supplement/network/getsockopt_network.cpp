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

#include <sys/socket.h>
#include <unistd.h>
#include "functionalext.h"
#define IPPROTO_IP 0
#define IP_HDRINCL 3
#define IP_TTL 2
#define TCP_MAXSEG 2
#define TCP_NODELAY 1
#define IP_TOS 1
#define IP_OPTIONS 4

static int DoGetsockopt(int sockfd, int level, int optname)
{
    int optval = 0;
    socklen_t optlen = sizeof(optval);
    int ret = getsockopt(sockfd, level, optname, &optval, &optlen);
    if (ret == 0) {
        return 0;
    }
    if (errno == ENOPROTOOPT || errno == EOPNOTSUPP || errno == ENOTSUP) {
        return 0;
    }
    return ret;
}

/**
 * @tc.name      : Getsockopt0100
 * @tc.desc      : SOL_SOCKET,SO_DEBUG
 * @tc.level     : Level 0
 */
void Getsockopt0100(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_DEBUG);
    EXPECT_EQ("Getsockopt0100", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt0200
 * @tc.desc      : SOL_SOCKET,SO_REUSEADDR
 * @tc.level     : Level 0
 */
void Getsockopt0200(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR);
    EXPECT_EQ("Getsockopt0200", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt0300
 * @tc.desc      : SOL_SOCKET,SO_TYPE
 * @tc.level     : Level 0
 */
void Getsockopt0300(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_TYPE);
    EXPECT_EQ("Getsockopt0300", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt0400
 * @tc.desc      : SOL_SOCKET,SO_ERROR
 * @tc.level     : Level 0
 */
void Getsockopt0400(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_ERROR);
    EXPECT_EQ("Getsockopt0400", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt0500
 * @tc.desc      : SOL_SOCKET,SO_DONTROUTE
 * @tc.level     : Level 0
 */
void Getsockopt0500(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_DONTROUTE);
    EXPECT_EQ("Getsockopt0500", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt0600
 * @tc.desc      : SOL_SOCKET,SO_BROADCAST
 * @tc.level     : Level 0
 */
void Getsockopt0600(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_BROADCAST);
    EXPECT_EQ("Getsockopt0600", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt0700
 * @tc.desc      : SOL_SOCKET,SO_SNDBUF
 * @tc.level     : Level 0
 */
void Getsockopt0700(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_SNDBUF);
    EXPECT_EQ("Getsockopt0700", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt0800
 * @tc.desc      : SOL_SOCKET,SO_RCVBUF
 * @tc.level     : Level 0
 */
void Getsockopt0800(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_RCVBUF);
    EXPECT_EQ("Getsockopt0800", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt0900
 * @tc.desc      : SOL_SOCKET,SO_KEEPALIVE
 * @tc.level     : Level 0
 */
void Getsockopt0900(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_KEEPALIVE);
    EXPECT_EQ("Getsockopt0900", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt1000
 * @tc.desc      : SOL_SOCKET,SO_OOBINLINE
 * @tc.level     : Level 0
 */
void Getsockopt1000(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_OOBINLINE);
    EXPECT_EQ("Getsockopt1000", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt1100
 * @tc.desc      : SOL_SOCKET,SO_LINGER
 * @tc.level     : Level 0
 */
void Getsockopt1100(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_LINGER);
    EXPECT_EQ("Getsockopt1100", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt1200
 * @tc.desc      : SOL_SOCKET,SO_RCVLOWAT
 * @tc.level     : Level 0
 */
void Getsockopt1200(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_RCVLOWAT);
    EXPECT_EQ("Getsockopt1200", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt1300
 * @tc.desc      : SOL_SOCKET,SO_SNDLOWAT
 * @tc.level     : Level 0
 */
void Getsockopt1300(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_SNDLOWAT);
    EXPECT_EQ("Getsockopt1300", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt1400
 * @tc.desc      : SOL_SOCKET,O_RCVTIMEO
 * @tc.level     : Level 1
 */
void Getsockopt1400(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_RCVTIMEO);
    EXPECT_EQ("Getsockopt1400", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt1500
 * @tc.desc      : SOL_SOCKET,SO_SNDTIMEO
 * @tc.level     : Level 1
 */
void Getsockopt1500(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_SNDTIMEO);
    EXPECT_EQ("Getsockopt1500", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt1600
 * @tc.desc      : SOL_SOCKET,SO_TIMESTAMP
 * @tc.level     : Level 1
 */
void Getsockopt1600(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_TIMESTAMP);
    EXPECT_EQ("Getsockopt1600", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt1700
 * @tc.desc      : SOL_SOCKET,SO_TIMESTAMPNS
 * @tc.level     : Level 1
 */
void Getsockopt1700(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_TIMESTAMPNS);
    EXPECT_EQ("Getsockopt1700", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt1800
 * @tc.desc      : IPPROTO_IP,IP_HDRINCL
 * @tc.level     : Level 1
 */
void Getsockopt1800(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, IP_HDRINCL);
    EXPECT_EQ("Getsockopt1800", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt1900
 * @tc.desc      : IPPROTO_IP,IP_OPTIONS
 * @tc.level     : Level 1
 */
void Getsockopt1900(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, IP_OPTIONS);
    EXPECT_EQ("Getsockopt1900", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt2000
 * @tc.desc      : IPPROTO_IP,IP_TOS
 * @tc.level     : Level 1
 */
void Getsockopt2000(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, IP_TOS);
    EXPECT_EQ("Getsockopt2000", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt2100
 * @tc.desc      : IPPROTO_IP,IP_TTL
 * @tc.level     : Level 1
 */
void Getsockopt2100(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, IP_TTL);
    EXPECT_EQ("Getsockopt2100", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt2200
 * @tc.desc      : IPPROTO_IP,TCP_MAXSEGs
 * @tc.level     : Level 1
 */
void Getsockopt2200(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, TCP_MAXSEG);
    EXPECT_EQ("Getsockopt2200", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt2300
 * @tc.desc      : IPPROTO_IP,TCP_NODELAY
 * @tc.level     : Level 1
 */
void Getsockopt2300(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, TCP_NODELAY);
    EXPECT_EQ("Getsockopt2200", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : Getsockopt2400
 * @tc.desc      : SOL_SOCKET,SO_RCVBUF
 * @tc.level     : Level 2
 */
void Getsockopt2400(void)
{
    int optval = 0;
    socklen_t optlen = sizeof(optval);
    int content = getsockopt(0, SOL_SOCKET, SO_RCVBUF, &optval, &optlen);
    EXPECT_EQ("Getsockopt2400", content, -1);
}

/**
 * @tc.name      : Getsockopt2500
 * @tc.desc      : SOL_SOCKET,SO_DEBUG nullptr
 * @tc.level     : Level 2
 */
void Getsockopt2500(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int optval = 0;
    int content = getsockopt(sockfd, SOL_SOCKET, SO_DEBUG, &optval, nullptr);
    EXPECT_EQ("Getsockopt2500", content, -1);
    close(sockfd);
}

static int GetsockoptNetworkTestImpl(void)
{
    Getsockopt0100();
    Getsockopt0200();
    Getsockopt0300();
    Getsockopt0400();
    Getsockopt0500();
    Getsockopt0600();
    Getsockopt0700();
    Getsockopt0800();
    Getsockopt0900();
    Getsockopt1000();
    Getsockopt1100();
    Getsockopt1200();
    Getsockopt1300();
    Getsockopt1400();
    Getsockopt1500();
    Getsockopt1600();
    Getsockopt1700();
    Getsockopt1800();
    Getsockopt1900();
    Getsockopt2000();
    Getsockopt2100();
    Getsockopt2200();
    Getsockopt2300();
    Getsockopt2400();
    Getsockopt2500();
    return T_STATUS;
}

int GetsockoptNetworkTest(void)
{
    return GetsockoptNetworkTestImpl();
}
