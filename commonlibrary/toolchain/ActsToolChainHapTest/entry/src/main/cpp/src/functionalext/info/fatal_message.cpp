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

#include <info/fatal_message.h>

#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <pthread.h>
#include <sys/wait.h>
#include <test.h>
#include <unistd.h>

#define EXPECT_TRUE(c)                \
    do {                              \
        if (!(c))                     \
            t_error("[%s] failed\n"); \
    } while (0)

#define FORK(fpid)                     \
    do {                               \
        if ((fpid) < 0) {              \
            t_error("error in fork!"); \
        }                              \
    } while (0)

typedef void (*TEST_FUN)(void);
static const int WAIT_TIME = 1;

/**
 * @tc.name      : get_fatal_message
 * @tc.desc      : Test the function of get_fatal_message.
 * @tc.level     : Level 0
 */
static void FatalMessage0010(void)
{
    fatal_msg_t* fatal_message = get_fatal_message();
    EXPECT_TRUE(fatal_message == nullptr);
}

/**
 * @tc.name      : set_fatal_message
 * @tc.desc      : Test the function of set_fatal_message.
 * @tc.level     : Level 0
 */
static void FatalMessage0020(void)
{
    const char msg[1024] = { "abcdefghijklmnopqrstuvwxyz1234567890" };
    fatal_msg_t* fatal_message = nullptr;

    int childRet = 0;
    int pidParent = 0;
    int pidChild = 0;

    pid_t fpid;
    fpid = fork();
    FORK(fpid);
    if (fpid == 0) {
        pidChild = getpid();
        set_fatal_message(msg);
        fatal_message = get_fatal_message();
        EXPECT_TRUE(strcmp(fatal_message->msg, msg) == 0);
        exit(0);
    }
    waitpid(fpid, &childRet, 0);
    EXPECT_TRUE(childRet == 0);
}

/**
 * @tc.name      : set_fatal_message
 * @tc.desc      : Test the multiple processes of set_fatal_message.
 * @tc.level     : Level 0
 */
static void FatalMessage0030(void)
{
    fatal_msg_t* fatal_message = nullptr;

    const char msgChild[1024] = { "msgChild" };
    const char msgParent[1024] = { "msgParent" };

    int childRet = 0;
    int pidChild = 0;
    int pidParent = 0;
    int pidCParent = 0;
    int pidCChild = 0;

    pid_t fpid;

    // start process
    fpid = fork();
    FORK(fpid);
    if (fpid == 0) {
        pidChild = getpid();
    } else {
        pidParent = getpid();
        pid_t fpidChild;

        // start process again
        fpidChild = fork();
        if (fpidChild < 0) {
            t_printf("error in fork!");
        } else if (fpidChild == 0) {
            pidCChild = getpid();
            set_fatal_message(msgParent);
            fatal_message = get_fatal_message();
            EXPECT_TRUE(strcmp(fatal_message->msg, msgParent) == 0);
            exit(0);
        } else {
            pidCParent = getpid();
            set_fatal_message(msgChild);
            fatal_message = get_fatal_message();
            EXPECT_TRUE(strcmp(fatal_message->msg, msgChild) == 0);
            waitpid(fpidChild, &childRet, 0);
            EXPECT_TRUE(childRet == 0);
        }
    }
}

/**
 * @tc.name      : set_fatal_message
 * @tc.desc      : Test the multiple processes of set_fatal_message,
 *                  One of the threads crashed.
 * @tc.level     : Level 0
 */
static void FatalMessage0040(void)
{
    fatal_msg_t* fatal_message = nullptr;

    const char msgChild[1024] = { "msgChild004" };
    const char msgParent[1024] = { "msgParent004" };

    int childRet = 0;
    int pidChild = 0;
    int pidParent = 0;
    int pidCParent = 0;
    int pidCChild = 0;

    pid_t fpid;

    // start process
    fpid = fork();
    FORK(fpid);
    if (fpid == 0) {
        pidChild = getpid();
    } else {
        pidParent = getpid();
        pid_t fpidChild;

        // start process again
        fpidChild = fork();
        if (fpidChild < 0) {
            t_printf("error in fork!");
        } else if (fpidChild == 0) {
            pidCChild = getpid();
            char* str = nullptr;
            str[0] = 0;
            // Process crash. Unable to continue calling the set_fatal_message interface
        } else {
            pidCParent = getpid();
            set_fatal_message(msgParent);
            fatal_message = get_fatal_message();
            EXPECT_TRUE(strcmp(fatal_message->msg, msgParent) == 0);
            waitpid(fpidChild, &childRet, 0);
            EXPECT_TRUE(childRet != 0);
        }
    }
}

void* ThreadFun1(void* arg)
{
    if (arg == nullptr) {
        t_printf("ThreadFun1 arg is NULL");
    }
    fatal_msg_t* fatal_message = get_fatal_message();
    EXPECT_TRUE(strcmp(fatal_message->msg, static_cast<char*>(arg)) == 0);
    return nullptr;
}

void* ThreadFun2(void* arg)
{
    if (arg == nullptr) {
        t_printf("ThreadFun2 arg is NULL");
    }
    fatal_msg_t* fatal_message = get_fatal_message();
    EXPECT_TRUE(strcmp(fatal_message->msg, static_cast<char*>(arg)) == 0);
    return nullptr;
}

/**
 * @tc.name      : set_fatal_message
 * @tc.desc      : Test the multithreading of set_fatal_message.
 * @tc.level     : Level 0
 */
static void FatalMessage0050(void)
{
    const char msgThread[1024] = { "msgThread" };
    int res;
    pthread_t fatalMessageThread1;
    pthread_t fatalMessageThread2;

    set_fatal_message(msgThread);
    res = pthread_create(&fatalMessageThread1, nullptr, ThreadFun1, const_cast<char*>(msgThread));
    if (res != 0) {
        t_printf("pthread_create1 error.");
    }
    sleep(WAIT_TIME);

    res = pthread_create(&fatalMessageThread2, nullptr, ThreadFun2, const_cast<char*>(msgThread));
    if (res != 0) {
        t_printf("pthread_create2 error.");
    }
    pthread_join(fatalMessageThread1, nullptr);
    pthread_join(fatalMessageThread2, nullptr);
}

/**
 * @tc.name      : set_fatal_message
 * @tc.desc      : Test the function of null message.
 * @tc.level     : Level 0
 */
static void FatalMessage0060(void)
{
    const char* msg = nullptr;
    fatal_msg_t* fatal_message = nullptr;

    int pidChild = 0;

    pid_t fpid;
    fpid = fork();
    FORK(fpid);
    if (fpid == 0) {
        pidChild = getpid();
        set_fatal_message(msg);
        fatal_message = get_fatal_message();
        EXPECT_TRUE(fatal_message == nullptr);
        exit(pidChild);
    }
}

/**
 * @tc.name      : set_fatal_message
 * @tc.desc      : Test the function of multi call set_fatal_message.
 * @tc.level     : Level 0
 */
static void FatalMessage0070(void)
{
    const char msg[1024] = { "abcdefghijklmnopqrstuvwxyz1234567890" };
    const char msg1[1024] = { "abcdefghijklmnopqr" };
    fatal_msg_t* fatal_message = nullptr;

    int pidParent = 0;
    int pidChild = 0;

    pid_t fpid;
    fpid = fork();
    if (fpid < 0) {
        t_printf("error in fork!");
    } else if (fpid == 0) {
        pidChild = getpid();
        set_fatal_message(msg);
        fatal_message = get_fatal_message();
        EXPECT_TRUE(strcmp(fatal_message->msg, msg) == 0);

        set_fatal_message(msg1);
        fatal_message = get_fatal_message();
        EXPECT_TRUE(strcmp(fatal_message->msg, msg) == 0);

        exit(pidChild);
    }
}

static TEST_FUN g_gFunArray[] = { FatalMessage0010, FatalMessage0020, FatalMessage0030, FatalMessage0040,
                                  FatalMessage0050, FatalMessage0060, FatalMessage0070 };

static int FatalMessageTestImpl(void)
{
    int childPid;
    int childRet;
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        // Run each function in a new process to
        // keep the initial state of fatal_message.
        if ((childPid = fork()) == 0) {
            g_gFunArray[pos]();
            exit(0);
        }
        waitpid(childPid, &childRet, 0);
        EXPECT_TRUE(childRet == 0);
    }

    return T_STATUS;
}

int FatalMessageTest(void)
{
    return FatalMessageTestImpl();
}
