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
#include <cctype>
#include <cstdint>
#include <cstdlib>
#include <dlfcn.h>
#include <fcntl.h>
#include <netdb.h>
#include <pthread.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <unistd.h>
#include "functionalext.h"

const int SUCCESS = 0;
#define BUF_SIZE (100)
#define PORT 22881
constexpr int ACCEPT_BACKLOG = 2;
#define WAIT() pthread_barrier_wait(&g_barrier)
static const char* LOCAL_HOST = "127.0.0.1";
static pthread_barrier_t g_barrier;

void* ServerTaskOne(void* arg)
{
    (void)arg; // pthread_create requires signature: void *(*)(void *)
    int* ret = (int*)malloc(sizeof(int));
    int rets = -1;
    int sListen = socket(AF_INET, SOCK_STREAM, 0);
    if (sListen == -1) {
        *ret = -1;
        return ret;
    }
    int flag = 1;
    rets = setsockopt(sListen, SOL_SOCKET, SO_REUSEADDR, &flag, sizeof(int));
    if (rets != 0) {
        printf("[server] setsockopt fail, rets: %d!\n", rets);
    }
    struct sockaddr_in srvAddr = { 0 };
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(LOCAL_HOST);
    srvAddr.sin_port = htons(PORT);
    rets = bind(sListen, reinterpret_cast<struct sockaddr*>(&srvAddr), sizeof(srvAddr));
    if (rets != 0) {
        WAIT();
        close(sListen);
        *ret = -1;
        return ret;
    }
    rets = listen(sListen, ACCEPT_BACKLOG);
    if (rets != 0) {
        WAIT();
        close(sListen);
        *ret = -1;
        return ret;
    }
    WAIT();
    struct sockaddr_in clnAddr = { 0 };
    socklen_t clnAddrLen = sizeof(clnAddr);
    int sClient = -1;
    sClient = accept4(sListen, reinterpret_cast<struct sockaddr*>(&clnAddr), &clnAddrLen, 0);
    EXPECT_NE("Accept40100", sClient, -1);
    close(sClient);
    close(sListen);
    return ret;
}

void* ServerTaskTwo(void* arg)
{
    (void)arg; // pthread_create requires signature: void *(*)(void *)
    int* ret = (int*)malloc(sizeof(int));
    int rets = -1;
    int sListen = socket(AF_INET, SOCK_STREAM, 0);
    if (sListen == -1) {
        *ret = -1;
        return ret;
    }
    int flag = 1;
    rets = setsockopt(sListen, SOL_SOCKET, SO_REUSEADDR, &flag, sizeof(int));
    if (rets != 0) {
        printf("[server] setsockopt fail, rets: %d!\n", rets);
    }
    struct sockaddr_in srvAddr = { 0 };
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(LOCAL_HOST);
    srvAddr.sin_port = htons(PORT);
    rets = bind(sListen, reinterpret_cast<struct sockaddr*>(&srvAddr), sizeof(srvAddr));
    if (rets != 0) {
        WAIT();
        close(sListen);
        *ret = -1;
        return ret;
    }
    rets = listen(sListen, ACCEPT_BACKLOG);
    if (rets != 0) {
        WAIT();
        close(sListen);
        *ret = -1;
        return ret;
    }
    WAIT();
    struct sockaddr_in clnAddr = { 0 };
    socklen_t clnAddrLen = sizeof(clnAddr);
    int sClient = -1;
    sClient = accept4(sListen, reinterpret_cast<struct sockaddr*>(&clnAddr), &clnAddrLen, SOCK_NONBLOCK);
    EXPECT_NE("Accept40200", sClient, -1);
    close(sClient);
    close(sListen);
    return ret;
}

void* ServerTaskThree(void* arg)
{
    (void)arg; // pthread_create requires signature: void *(*)(void *)
    int* ret = (int*)malloc(sizeof(int));
    int rets = -1;
    int sListen = socket(AF_INET, SOCK_STREAM, 0);
    if (sListen == -1) {
        *ret = -1;
        return ret;
    }
    int flag = 1;
    rets = setsockopt(sListen, SOL_SOCKET, SO_REUSEADDR, &flag, sizeof(int));
    if (rets != 0) {
        printf("[server] setsockopt fail, rets: %d!\n", rets);
    }
    struct sockaddr_in srvAddr = { 0 };
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(LOCAL_HOST);
    srvAddr.sin_port = htons(PORT);
    rets = bind(sListen, reinterpret_cast<struct sockaddr*>(&srvAddr), sizeof(srvAddr));
    if (rets != 0) {
        WAIT();
        close(sListen);
        *ret = -1;
        return ret;
    }
    rets = listen(sListen, ACCEPT_BACKLOG);
    if (rets != 0) {
        WAIT();
        close(sListen);
        *ret = -1;
        return ret;
    }
    WAIT();
    struct sockaddr_in clnAddr = { 0 };
    socklen_t clnAddrLen = sizeof(clnAddr);
    int sClient = -1;
    sClient = accept4(sListen, reinterpret_cast<struct sockaddr*>(&clnAddr), &clnAddrLen, SOCK_CLOEXEC);
    EXPECT_NE("Accept40300", sClient, -1);
    close(sClient);
    close(sListen);
    return ret;
}

void* ServerTaskFive(void* arg)
{
    (void)arg; // pthread_create requires signature: void *(*)(void *)
    int* ret = (int*)malloc(sizeof(int));
    int rets = -1;
    int sListen = socket(AF_INET, SOCK_STREAM, 0);
    if (sListen == -1) {
        *ret = -1;
        return ret;
    }
    int flag = 1;
    rets = setsockopt(sListen, SOL_SOCKET, SO_REUSEADDR, &flag, sizeof(int));
    if (rets != 0) {
        printf("[server] setsockopt fail, rets: %d!\n", rets);
    }
    struct sockaddr_in srvAddr = { 0 };
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(LOCAL_HOST);
    srvAddr.sin_port = htons(PORT);
    rets = bind(sListen, reinterpret_cast<struct sockaddr*>(&srvAddr), sizeof(srvAddr));
    if (rets != 0) {
        WAIT();
        close(sListen);
        *ret = -1;
        return ret;
    }
    rets = listen(sListen, ACCEPT_BACKLOG);
    if (rets != 0) {
        WAIT();
        close(sListen);
        *ret = -1;
        return ret;
    }
    WAIT();
    struct sockaddr_in clnAddr = { 0 };
    socklen_t clnAddrLen = sizeof(clnAddr);
    int sClient = -1;
    sClient = accept4(sListen, nullptr, &clnAddrLen, SOCK_CLOEXEC);
    EXPECT_NE("Accept40500", sClient, -1);
    close(sClient);
    close(sListen);
    return ret;
}

void* ServerTaskSix(void* arg)
{
    (void)arg; // pthread_create requires signature: void *(*)(void *)
    int* ret = (int*)malloc(sizeof(int));
    int rets = -1;
    int sListen = socket(AF_INET, SOCK_STREAM, 0);
    if (sListen == -1) {
        *ret = -1;
    }
    int flag = 1;
    rets = setsockopt(sListen, SOL_SOCKET, SO_REUSEADDR, &flag, sizeof(int));
    if (rets != 0) {
        printf("[server] setsockopt fail, rets: %d!\n", rets);
    }
    struct sockaddr_in srvAddr = { 0 };
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(LOCAL_HOST);
    srvAddr.sin_port = htons(PORT);
    rets = bind(sListen, reinterpret_cast<struct sockaddr*>(&srvAddr), sizeof(srvAddr));
    if (rets != 0) {
        close(sListen);
        *ret = -1;
    }
    rets = listen(sListen, ACCEPT_BACKLOG);
    if (rets != 0) {
        close(sListen);
        *ret = -1;
    }
    WAIT();
    struct sockaddr_in clnAddr = { 0 };
    socklen_t clnAddrLen = sizeof(clnAddr);
    int sClient = 0;
    sClient = accept4(sListen, reinterpret_cast<struct sockaddr*>(&clnAddr), nullptr, 0);
    EXPECT_EQ("Accept40600", sClient, -1);
    close(sClient);
    close(sListen);
    return ret;
}

void* ClientTask(void* arg)
{
    (void)arg; // pthread_create requires signature: void *(*)(void *)
    int clnFd = socket(AF_INET, SOCK_STREAM, 0);
    WAIT();
    struct sockaddr_in srvAddr = { 0 };
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(LOCAL_HOST);
    srvAddr.sin_port = htons(PORT);
    int ret = connect(clnFd, reinterpret_cast<struct sockaddr*>(&srvAddr), sizeof(srvAddr));
    if (ret != 0) {
        printf("connect failed\n");
    }
    close(clnFd);
    return nullptr;
}

/**
 * @tc.name      : Accept40100
 * @tc.desc      : Each parameter is valid, the flag parameter is 0, and the socket connection can be accepted.
 * @tc.level     : Level 0
 */
void Accept40100(void)
{
    pthread_t srv;
    pthread_t cli;
    int ret = pthread_barrier_init(&g_barrier, nullptr, ACCEPT_BACKLOG);
    EXPECT_EQ("Accept40100", SUCCESS, ret);
    ret = pthread_create(&srv, nullptr, ServerTaskOne, nullptr);
    EXPECT_EQ("Accept40100", SUCCESS, ret);
    ret = pthread_create(&cli, nullptr, ClientTask, nullptr);
    EXPECT_EQ("Accept40100", SUCCESS, ret);
    ret = pthread_join(cli, nullptr);
    EXPECT_EQ("Accept40100", SUCCESS, ret);
    ret = pthread_join(srv, nullptr);
    EXPECT_EQ("Accept40100", SUCCESS, ret);
    ret = pthread_barrier_destroy(&g_barrier);
    EXPECT_EQ("Accept40100", SUCCESS, ret);
}

/**
 * @tc.name      : Accept40200
 * @tc.desc      : Each parameter is valid, the flag parameter is SOCK_NONBLOCK, which can accept socket connection.
 * @tc.level     : Level 1
 */
void Accept40200(void)
{
    pthread_t srv;
    pthread_t cli;
    int ret = pthread_barrier_init(&g_barrier, nullptr, ACCEPT_BACKLOG);
    EXPECT_EQ("Accept40200", SUCCESS, ret);
    ret = pthread_create(&srv, nullptr, ServerTaskTwo, nullptr);
    EXPECT_EQ("Accept40200", SUCCESS, ret);
    ret = pthread_create(&cli, nullptr, ClientTask, nullptr);
    EXPECT_EQ("Accept40200", SUCCESS, ret);
    ret = pthread_join(cli, nullptr);
    EXPECT_EQ("Accept40200", SUCCESS, ret);
    ret = pthread_join(srv, nullptr);
    EXPECT_EQ("Accept40200", SUCCESS, ret);
    ret = pthread_barrier_destroy(&g_barrier);
    EXPECT_EQ("Accept40200", SUCCESS, ret);
}

/**
 * @tc.name      : Accept40300
 * @tc.desc      : Each parameter is valid, the flag parameter is SOCK_CLOEXEC, which can accept socket connection.
 * @tc.level     : Level 1
 */
void Accept40300(void)
{
    pthread_t srv;
    pthread_t cli;
    int ret = pthread_barrier_init(&g_barrier, nullptr, ACCEPT_BACKLOG);
    EXPECT_EQ("Accept40300", SUCCESS, ret);
    ret = pthread_create(&srv, nullptr, ServerTaskThree, nullptr);
    EXPECT_EQ("Accept40300", SUCCESS, ret);
    ret = pthread_create(&cli, nullptr, ClientTask, nullptr);
    EXPECT_EQ("Accept40300", SUCCESS, ret);
    ret = pthread_join(cli, nullptr);
    EXPECT_EQ("Accept40300", SUCCESS, ret);
    ret = pthread_join(srv, nullptr);
    EXPECT_EQ("Accept40300", SUCCESS, ret);
    ret = pthread_barrier_destroy(&g_barrier);
    EXPECT_EQ("Accept40300", SUCCESS, ret);
}

/**
 * @tc.name      : Accept40400
 * @tc.desc      : The fd parameter is invalid, socket connection cannot be accepted.
 * @tc.level     : Level 2
 */
void Accept40400(void)
{
    struct sockaddr_in clnAddr = { 0 };
    socklen_t clnAddrLen = sizeof(clnAddr);
    int sClient = 0;
    sClient = accept4(0, reinterpret_cast<struct sockaddr*>(&clnAddr), &clnAddrLen, 0);
    EXPECT_EQ("Accept40400", sClient, -1);
}

/**
 * @tc.name      : Accept40500
 * @tc.desc      : The addr parameter is invalid, socket connection can be accepted.
 * @tc.level     : Level 1
 */
void Accept40500(void)
{
    pthread_t srv;
    pthread_t cli;
    int ret = pthread_barrier_init(&g_barrier, nullptr, ACCEPT_BACKLOG);
    EXPECT_EQ("Accept40500", SUCCESS, ret);
    ret = pthread_create(&srv, nullptr, ServerTaskFive, nullptr);
    EXPECT_EQ("Accept40500", SUCCESS, ret);
    ret = pthread_create(&cli, nullptr, ClientTask, nullptr);
    EXPECT_EQ("Accept40500", SUCCESS, ret);
    ret = pthread_join(cli, nullptr);
    EXPECT_EQ("Accept40500", SUCCESS, ret);
    ret = pthread_join(srv, nullptr);
    EXPECT_EQ("Accept40500", SUCCESS, ret);
    ret = pthread_barrier_destroy(&g_barrier);
    EXPECT_EQ("Accept40500", SUCCESS, ret);
}

/**
 * @tc.name      : Accept40600
 * @tc.desc      : The len parameter is invalid, socket connection cannot be accepted.
 * @tc.level     : Level 2
 */
void Accept40600(void)
{
    pthread_t srv;
    pthread_t cli;
    int ret = pthread_barrier_init(&g_barrier, nullptr, ACCEPT_BACKLOG);
    EXPECT_EQ("Accept40600", SUCCESS, ret);
    ret = pthread_create(&srv, nullptr, ServerTaskSix, nullptr);
    EXPECT_EQ("Accept40600", SUCCESS, ret);
    ret = pthread_create(&cli, nullptr, ClientTask, nullptr);
    EXPECT_EQ("Accept40600", SUCCESS, ret);
    ret = pthread_join(cli, nullptr);
    EXPECT_EQ("Accept40600", SUCCESS, ret);
    ret = pthread_join(srv, nullptr);
    EXPECT_EQ("Accept40600", SUCCESS, ret);
    ret = pthread_barrier_destroy(&g_barrier);
    EXPECT_EQ("Accept40600", SUCCESS, ret);
}
static int Accept4TestWithArgs(int argc, char* argv[])
{
    Accept40100();
    Accept40200();
    Accept40300();
    Accept40400();
    Accept40500();
    Accept40600();
    return T_STATUS;
}

int Accept4Test(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return Accept4TestWithArgs(1, libcArgv);
}

int Accept4TestCompat(void)
{
    return Accept4Test();
}
