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

#include <netinet/ip.h>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <sys/socket.h>
#include <bits/alltypes.h>
#include <unistd.h>
#include "test.h"
#include "time64_functions.h"

#define SLEEP_TIME (2)
#define MSG_COUNT (2)
#define IOV_COUNT (2)
#define SOCKET_PORT (1234)
#define PAYLOAD_LEN (3)
#define PAYLOAD_LEN2 (5)
#define IOVLEN_2 (2)
#define IOVLEN_1 (1)
#define FAILURE_CODE (-1)

static void SendSss(void)
{
    int sockfd;
    struct sockaddr_in addr;
    struct mmsghdr msg[MSG_COUNT];
    struct iovec msg1[IOV_COUNT];
    struct iovec msg2;
    int retval;

    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd == FAILURE_CODE) {
        t_error("recvmmsg_0100 socket error");
        exit(EXIT_FAILURE);
    }

    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
    addr.sin_port = htons(SOCKET_PORT);
    if (connect(sockfd, reinterpret_cast<struct sockaddr *>(&addr), sizeof(addr)) == FAILURE_CODE) {
        t_error("recvmmsg_0100 connect error");
        exit(EXIT_FAILURE);
    }

    memset(msg1, 0, sizeof(msg1));
    msg1[0].iov_base = const_cast<char*>("one");
    msg1[0].iov_len = PAYLOAD_LEN;
    msg1[1].iov_base = const_cast<char*>("two");
    msg1[1].iov_len = PAYLOAD_LEN;

    memset(&msg2, 0, sizeof(msg2));
    msg2.iov_base = const_cast<char*>("three");
    msg2.iov_len = PAYLOAD_LEN2;

    memset(msg, 0, sizeof(msg));
    msg[0].msg_hdr.msg_iov = msg1;
    msg[0].msg_hdr.msg_iovlen = IOVLEN_2;

    msg[1].msg_hdr.msg_iov = &msg2;
    msg[1].msg_hdr.msg_iovlen = IOVLEN_1;

    retval = sendmmsg(sockfd, msg, MSG_COUNT, 0);
    if (retval == FAILURE_CODE) {
        t_error("recvmmsg_time64_0100 sendmmsg error");
    }
}

static void RecvSss(void)
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
    if (sockfd == FAILURE_CODE) {
        t_error("recvmmsg_time64_0100 recv socket error");
        exit(EXIT_FAILURE);
    }

    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
    addr.sin_port = htons(SOCKET_PORT);
    if (bind(sockfd, reinterpret_cast<struct sockaddr *>(&addr), sizeof(addr)) == FAILURE_CODE) {
        t_error("recvmmsg_time64_0100 recv bind error");
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

    retval = RecvmmsgTime64(sockfd, msgs, VLEN, 0, &timeout);
    if (retval == FAILURE_CODE) {
        t_error("recvmmsg_time64_0100 recv recvmmsg error");
        exit(EXIT_FAILURE);
    }
}

/**
 * @tc.name      : recvmmsg_time64_0100
 * @tc.desc      : Test recvmmsg to recv messages through socket
 * @tc.level     : Level 0
 */
static int RecvmmsgTime64TestWithArgs(int argc, char *argv[])
{
    pid_t pid = fork();
    if (pid > 0) {
        RecvSss();
    } else if (pid == 0) {
        sleep(SLEEP_TIME);
        SendSss();
    } else {
        t_error("recvmmsg_time64_0100 fork error");
    }
    return T_STATUS;
}

int RecvmmsgTime64Test(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return RecvmmsgTime64TestWithArgs(1, libcArgv);
}
