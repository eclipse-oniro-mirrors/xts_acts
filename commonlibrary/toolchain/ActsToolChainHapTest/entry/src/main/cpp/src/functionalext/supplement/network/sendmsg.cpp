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

#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <netinet/ip.h>
#include <sys/socket.h>
#include <unistd.h>
#include "test.h"

namespace {
constexpr uint16_t K_LOOPBACK_UDP_TEST_PORT = 1234U;
constexpr int K_SENDMSG_FLAGS_PROBE = 2;
} // namespace

/**
 * @tc.name      : Sendmsg0100
 * @tc.desc      : test sendmsg to send messages through socket
 * @tc.level     : Level 0
 */
void Sendmsg0100(void)
{
    int sockfd;
    struct sockaddr_in addr;
    int retval;

    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd == -1) {
        t_error("Sendmsg0100 socket error");
        exit(EXIT_FAILURE);
    }

    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
    addr.sin_port = htons(K_LOOPBACK_UDP_TEST_PORT);
    if (connect(sockfd, reinterpret_cast<struct sockaddr*>(&addr), sizeof(addr)) == -1) {
        t_error("Sendmsg0100 connect error");
        exit(EXIT_FAILURE);
    }
    struct msghdr msg;
    bzero(&msg, sizeof(struct msghdr));

    retval = sendmsg(sockfd, &msg, K_SENDMSG_FLAGS_PROBE);
    if (retval == -1) {
        t_error("Sendmsg0100 sendmsg error");
    }
    (void)close(sockfd);
}

static int SendmsgTestImpl(int argc, char* argv[])
{
    Sendmsg0100();
    return T_STATUS;
}

int SendmsgTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SendmsgTestImpl(1, libcArgvStub);
}
