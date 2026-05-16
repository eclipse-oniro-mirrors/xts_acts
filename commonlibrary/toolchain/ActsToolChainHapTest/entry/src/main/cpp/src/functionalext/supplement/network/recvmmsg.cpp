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

#include <bits/alltypes.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <netinet/ip.h>
#include <sys/socket.h>
#include <unistd.h>
#include "test.h"

const int SLEEP_TIME = 2;
constexpr int RECVMMSG_PORT = 1234;
constexpr int PAYLOAD_ONE_LEN = 3;
constexpr int PAYLOAD_TWO_LEN = 3;
constexpr int PAYLOAD_THREE_LEN = 5;
constexpr int MMSG_BATCH_SIZE = 2;

void Sendsss(void)
{
    int sockfd;
    struct sockaddr_in addr;
    struct mmsghdr msg[2];
    struct iovec msg1[2];
    struct iovec msg2;
    int retval;

    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd == -1) {
        t_error("recvmmsg_0100 socket error");
        exit(EXIT_FAILURE);
    }

    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
    addr.sin_port = htons(RECVMMSG_PORT);
    if (connect(sockfd, reinterpret_cast<struct sockaddr*>(&addr), sizeof(addr)) == -1) {
        t_error("recvmmsg_0100 connect error");
        exit(EXIT_FAILURE);
    }

    char payload1[] = "one";
    char payload2[] = "two";
    char payload3[] = "three";

    memset(msg1, 0, sizeof(msg1));
    msg1[0].iov_base = payload1;
    msg1[0].iov_len = PAYLOAD_ONE_LEN;
    msg1[1].iov_base = payload2;
    msg1[1].iov_len = PAYLOAD_TWO_LEN;

    memset(&msg2, 0, sizeof(msg2));
    msg2.iov_base = payload3;
    msg2.iov_len = PAYLOAD_THREE_LEN;

    memset(msg, 0, sizeof(msg));
    msg[0].msg_hdr.msg_iov = msg1;
    msg[0].msg_hdr.msg_iovlen = MMSG_BATCH_SIZE;

    msg[1].msg_hdr.msg_iov = &msg2;
    msg[1].msg_hdr.msg_iovlen = 1;

    retval = sendmmsg(sockfd, msg, MMSG_BATCH_SIZE, 0);
    if (retval == -1) {
        t_error("recvmmsg_0100 sendmmsg error");
    }
}

void Recvsss(void)
{
#define VLEN 10
#define BUFSIZE 200
#define TIMEOUT 1
    int sockfd;
    int retval;
    struct sockaddr_in addr;
    struct mmsghdr msgs[VLEN];
    struct iovec iovecs[VLEN];
    char bufs[VLEN][BUFSIZE + 1];
    struct timespec timeout;

    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd == -1) {
        t_error("recvmmsg_0100 recv socket error");
        exit(EXIT_FAILURE);
    }

    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
    addr.sin_port = htons(RECVMMSG_PORT);
    if (bind(sockfd, reinterpret_cast<struct sockaddr*>(&addr), sizeof(addr)) == -1) {
        t_error("recvmmsg_0100 recv bind error");
        exit(EXIT_FAILURE);
    }

    memset(msgs, 0, sizeof(msgs));
    for (int i = 0; i < VLEN; i++) {
        iovecs[i].iov_base = bufs[i];
        iovecs[i].iov_len = BUFSIZE;
        msgs[i].msg_hdr.msg_iov = &iovecs[i];
        msgs[i].msg_hdr.msg_iovlen = 1;
    }

    timeout.tv_sec = TIMEOUT;
    timeout.tv_nsec = 0;

    retval = recvmmsg(sockfd, msgs, VLEN, 0, &timeout);
    if (retval == -1) {
        t_error("recvmmsg_0100 recv recvmmsg error");
        exit(EXIT_FAILURE);
    }
}

/**
 * @tc.name      : recvmmsg_0100
 * @tc.desc      : Test recvmmsg to recv messages through socket
 * @tc.level     : Level 0
 */
static int RecvmmsgTestImpl(int argc, char* argv[])
{
    pid_t pid = fork();
    if (pid > 0) {
        Recvsss();
    } else if (pid == 0) {
        sleep(SLEEP_TIME);
        Sendsss();
    } else {
        t_error("recvmmsg_0100 fork error");
    }
    return T_STATUS;
}

int RecvmmsgTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return RecvmmsgTestImpl(1, libcArgv);
}
