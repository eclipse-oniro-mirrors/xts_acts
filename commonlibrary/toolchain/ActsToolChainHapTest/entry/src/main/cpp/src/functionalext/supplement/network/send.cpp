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

#include <arpa/inet.h>
#include <cctype>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dlfcn.h>
#include <netinet/in.h>
#include <pthread.h>
#include <sys/socket.h>
#include "functionalext.h"

typedef void (*TEST_FUN)();
#define BUF_SIZE (100)
#define PORT 2288
constexpr int LISTEN_BACKLOG = 2;
#define WAIT() pthread_barrier_wait(&g_barrier)
static const char* CLI_MSG = "Hello, this is client";
static const char* LOCAL_HOST = "127.0.0.1";
static pthread_barrier_t g_barrier;

static void* SampleServerTask()
{
    int* ret = (int*)malloc(sizeof(int));
    int rets = -1;
    int sListen = socket(AF_INET, SOCK_STREAM, 0);
    if (sListen == -1) {
        *ret = -1;
        return ret;
    }
    int flag = 1;
    rets = setsockopt(sListen, SOL_SOCKET, SO_REUSEADDR, &flag, sizeof(int));
    struct sockaddr_in srvAddr = { 0 };
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(LOCAL_HOST);
    srvAddr.sin_port = htons(PORT);
    rets = bind(sListen, reinterpret_cast<struct sockaddr*>(&srvAddr), sizeof(srvAddr));
    if (rets != 0) {
        close(sListen);
        *ret = -1;
        return ret;
    }
    rets = listen(sListen, LISTEN_BACKLOG);
    if (rets != 0) {
        close(sListen);
        *ret = -1;
        return ret;
    }
    WAIT();
    struct sockaddr_in clnAddr = { 0 };
    socklen_t clnAddrLen = sizeof(clnAddr);
    int sClient = accept(sListen, reinterpret_cast<struct sockaddr*>(&clnAddr), &clnAddrLen);
    if (sClient >= 0) {
        static char buf[BUF_SIZE + 1] = { 0 };
        memset(buf, '\0', BUF_SIZE);
        rets = recv(sClient, buf, sizeof(buf), 0);
        close(sClient);
    }
    close(sListen);
    *ret = 0;
    return ret;
}

static void* SampleClientTask()
{
    int clnFd = socket(AF_INET, SOCK_STREAM, 0);
    if (clnFd < 0) {
        return nullptr;
    }
    WAIT();
    struct sockaddr_in srvAddr = { 0 };
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(LOCAL_HOST);
    srvAddr.sin_port = htons(PORT);
    int ret = connect(clnFd, reinterpret_cast<struct sockaddr*>(&srvAddr), sizeof(srvAddr));
    EXPECT_EQ("send_0100", 0, ret);
    if (ret == 0) {
        static char buf[BUF_SIZE + 1] = { 0 };
        memset(buf, '\0', BUF_SIZE);
        strcpy(buf, CLI_MSG);
        int sendRet = send(clnFd, buf, sizeof(buf), 0);
        EXPECT_EQ("send_0100", sendRet, sizeof(buf));
    }
    close(clnFd);
    return nullptr;
}

void* SampleServerNullTask()
{
    int* ret = (int*)malloc(sizeof(int));
    int rets = 0;
    int sListen = socket(AF_INET, SOCK_STREAM, 0);
    if (sListen == -1) {
        *ret = -1;
        return ret;
    }
    int flag = 1;
    rets = setsockopt(sListen, SOL_SOCKET, SO_REUSEADDR, &flag, sizeof(int));
    struct sockaddr_in srvAddr = { 0 };
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(LOCAL_HOST);
    srvAddr.sin_port = htons(PORT);
    rets = bind(sListen, reinterpret_cast<struct sockaddr*>(&srvAddr), sizeof(srvAddr));
    if (rets != 0) {
        close(sListen);
        *ret = -1;
        return ret;
    }
    rets = listen(sListen, LISTEN_BACKLOG);
    if (rets != 0) {
        close(sListen);
        *ret = -1;
        return ret;
    }
    WAIT();
    struct sockaddr_in clnAddr = { 0 };
    socklen_t clnAddrLen = sizeof(clnAddr);
    int sClient = accept(sListen, reinterpret_cast<struct sockaddr*>(&clnAddr), &clnAddrLen);
    if (sClient >= 0) {
        close(sClient);
    }
    close(sListen);
    *ret = 0;
    return ret;
}

void* SampleClientNullTask()
{
    int clnFd = socket(AF_INET, SOCK_STREAM, 0);
    if (clnFd < 0) {
        return nullptr;
    }
    WAIT();
    struct sockaddr_in srvAddr = { 0 };
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(LOCAL_HOST);
    srvAddr.sin_port = htons(PORT);
    int ret = connect(clnFd, reinterpret_cast<struct sockaddr*>(&srvAddr), sizeof(srvAddr));
    EXPECT_EQ("send_0200", 0, ret);
    if (ret == 0) {
        static char buf[BUF_SIZE + 1] = { 0 };
        memset(buf, '\0', BUF_SIZE);
        strcpy(buf, CLI_MSG);
        int result = send(clnFd, nullptr, sizeof(buf), 0);
        EXPECT_EQ("send_0200", result, -1);
    }
    close(clnFd);
    return nullptr;
}

/*
 * @tc.name      : send_0100
 * @tc.desc      : Verify that the client sent successfully
 * @tc.level     : Level 0
 */
void Send0100(void)
{
    pthread_t srv;
    pthread_t cli;
    int ret = pthread_barrier_init(&g_barrier, nullptr, 2);
    EXPECT_EQ("send_0100", 0, ret);

    typedef int (*PthreadCreateFunc)(pthread_t*, const pthread_attr_t*, void* (*)(), void*);
    PthreadCreateFunc pthreadCreate = reinterpret_cast<PthreadCreateFunc>(dlsym(RTLD_DEFAULT, "pthread_create"));
    if (!pthreadCreate) {
        EXPECT_PTRNE("send_0100", pthreadCreate, nullptr);
        return;
    }

    ret = pthreadCreate(&srv, nullptr, SampleServerTask, nullptr);
    EXPECT_EQ("send_0100", 0, ret);
    ret = pthreadCreate(&cli, nullptr, SampleClientTask, nullptr);
    EXPECT_EQ("send_0100", 0, ret);
    ret = pthread_join(cli, nullptr);
    EXPECT_EQ("send_0100", 0, ret);
    ret = pthread_join(srv, nullptr);
    EXPECT_EQ("send_0100", 0, ret);
    ret = pthread_barrier_destroy(&g_barrier);
    EXPECT_EQ("send_0100", 0, ret);
}

/*
 * @tc.name      : send_0200
 * @tc.desc      : Verify that client send failed when parameter is invalid
 * @tc.level     : Level 2
 */
void Send0200(void)
{
    pthread_t srv;
    pthread_t cli;
    int ret = pthread_barrier_init(&g_barrier, nullptr, 2);
    EXPECT_EQ("send_0200", 0, ret);

    typedef int (*PthreadCreateFunc)(pthread_t*, const pthread_attr_t*, void* (*)(), void*);
    PthreadCreateFunc pthreadCreate = reinterpret_cast<PthreadCreateFunc>(dlsym(RTLD_DEFAULT, "pthread_create"));
    if (!pthreadCreate) {
        EXPECT_PTRNE("send_0200", pthreadCreate, nullptr);
        return;
    }

    ret = pthreadCreate(&srv, nullptr, SampleServerNullTask, nullptr);
    EXPECT_EQ("send_0200", 0, ret);
    ret = pthreadCreate(&cli, nullptr, SampleClientNullTask, nullptr);
    EXPECT_EQ("send_0200", 0, ret);
    ret = pthread_join(cli, nullptr);
    EXPECT_EQ("send_0200", 0, ret);
    ret = pthread_join(srv, nullptr);
    EXPECT_EQ("send_0200", 0, ret);
    ret = pthread_barrier_destroy(&g_barrier);
    EXPECT_EQ("send_0200", 0, ret);
}

static TEST_FUN g_gFunArray[] = { Send0100, Send0200 };
static int SendTestImpl(int argc, char* argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int SendTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return SendTestImpl(1, libcArgv);
}
