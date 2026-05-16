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

#include <arpa/inet.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <netinet/ip.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include "functionalext.h"

#define TEST_MSG_PORT 7788
#define TEST_BUF_SIZE 256
#define TEST_TIMEOUT 5

static const char* TEXT = "This is a simple test case.";

void FillSocketAddr(struct sockaddr_in* addr)
{
    if (addr) {
        bzero(addr, sizeof(struct sockaddr_in));
        addr->sin_family = AF_INET;
        inet_pton(AF_INET, "127.0.0.1", &addr->sin_addr);
        addr->sin_port = htons(TEST_MSG_PORT);
    }
}

int CheckRecvMessage(int sockfd)
{
    struct timeval t;
    fd_set rset;

    int timeout = TEST_TIMEOUT;
    int ret;
    while (timeout > 0) {
        FD_ZERO(&rset);
        FD_SET(sockfd, &rset);
        t.tv_sec = 1;
        t.tv_usec = 0;

        ret = select(sockfd + 1, &rset, nullptr, nullptr, &t);
        if (ret == 0) {
            timeout--;
        } else if (ret < 0) {
            return ret;
        } else {
            if (FD_ISSET(sockfd, &rset)) {
                return ret;
            }
        }
    }
    return -1;
}

void SendMessage(int flag, const char* msg)
{
    int sockfd = socket(AF_INET, SOCK_DGRAM, IPPROTO_IP);
    if (sockfd == -1) {
        t_error("[%s] failed\n", msg);
        return;
    }

    struct sockaddr_in addr;
    struct msghdr msgSend;
    struct iovec iovSend;
    char buf[TEST_BUF_SIZE];

    FillSocketAddr(&addr);
    memset(&msgSend, 0x0, sizeof(struct msghdr));
    memset(&iovSend, 0x0, sizeof(struct iovec));

    iovSend.iov_base = buf;
    iovSend.iov_len = TEST_BUF_SIZE;
    snprintf(buf, sizeof(buf), "%s", TEXT);

    msgSend.msg_iovlen = 1;
    msgSend.msg_iov = &iovSend;
    msgSend.msg_control = nullptr;
    msgSend.msg_controllen = 0;

    if (connect(sockfd, reinterpret_cast<struct sockaddr*>(&addr), sizeof(addr)) == -1) {
        close(sockfd);
        t_error("[%s] failed\n", msg);
        return;
    }

    int ret = sendmsg(sockfd, &msgSend, flag);
    close(sockfd);
    EXPECT_TRUE(msg, ret > 0);
}

int RecvMessage(int flag, const char* msg)
{
    int sockfd = socket(AF_INET, SOCK_DGRAM, IPPROTO_IP);
    if (sockfd == -1) {
        t_error("[%s] failed\n", msg);
        exit(1);
    }

    struct sockaddr_in addr;
    struct msghdr msgRecv;
    struct iovec iovRecv;
    char buf[TEST_BUF_SIZE];
    char control[TEST_BUF_SIZE];

    FillSocketAddr(&addr);
    memset(&msgRecv, 0x0, sizeof(struct msghdr));
    memset(&iovRecv, 0x0, sizeof(struct iovec));
    memset(buf, 0x0, sizeof(buf));

    iovRecv.iov_base = static_cast<void*>(buf);
    iovRecv.iov_len = TEST_BUF_SIZE;

    msgRecv.msg_name = &addr;
    msgRecv.msg_iovlen = 1;
    msgRecv.msg_iov = &iovRecv;
    msgRecv.msg_control = control;
    msgRecv.msg_controllen = TEST_BUF_SIZE;
    msgRecv.msg_flags = 0;

    if (bind(sockfd, reinterpret_cast<struct sockaddr*>(&addr), sizeof(addr)) == -1) {
        close(sockfd);
        t_error("[%s] failed\n", msg);
        exit(1);
    }

    int ret = CheckRecvMessage(sockfd);
    EXPECT_TRUE(msg, ret > 0);
    if (ret > 0) {
        ret = recvmsg(sockfd, &msgRecv, flag);
        EXPECT_TRUE(msg, ret > 0);
        EXPECT_STREQ(msg, static_cast<char*>(iovRecv.iov_base), TEXT);
    }
    close(sockfd);
    exit(0);
}

/**
 * @tc.name      : recvmsg_0100
 * @tc.desc      : Test recvmsg to recv messages through socket
 * @tc.level     : Level 0
 */
void Recvmsg0100(void)
{
    pid_t pid = fork();
    if (pid == 0) {
        RecvMessage(0, "recvmsg_0100");
    } else if (pid > 0) {
        sleep(1);
        SendMessage(0, "recvmsg_0100");
        wait(nullptr);
    } else {
        t_error("recvmsg_0100 fork error");
    }
}

static int RecvmsgTestImpl(void)
{
    Recvmsg0100();
    return T_STATUS;
}

int RecvmsgTest(void)
{
    return RecvmsgTestImpl();
}
