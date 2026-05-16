/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <cerrno>
#include <csignal>
#include <cstdlib>
#include <cstring>
#include <sys/wait.h>
#include <unistd.h>
#include "test.h"

#define UNIT 16
#define OFF_OFFSET 2
#define FIRST_OFFSET (-4)
#define FIRST_OFF_OFFSET 8
#define MALLOC_SIZE_S 50
#define MALLOC_SIZE_L 100
#define TEST_NUM 512
constexpr int KILL_SIGVAL = 0;

struct MetaIn {
    struct MetaIn *prev, *next;
    uintptr_t* mem;
};

struct GroupIn {
    struct MetaIn* meta;
};

static struct GroupIn* GetGroup(const uint8_t* p)
{
    int offset = *(const uint16_t*)(p - OFF_OFFSET);

    if (p[FIRST_OFFSET]) {
        offset = *(uint32_t*)(p - FIRST_OFF_OFFSET);
    }
    struct GroupIn* base = (struct GroupIn*)(p - UNIT * offset - UNIT);
    return base;
}

static void Handler(int s) {}

static volatile void* g_tmp;

int SetDevideChunk(size_t size)
{
    if (size == 0 || size > SIZE_MAX / sizeof(unsigned char)) {
        t_error("Invalid alloc size: %zu\n", size);
        return -1;
    }
    if (!(g_tmp = malloc(size))) {
        t_error("Malloc failed: %s\n", strerror(errno));
        return -1;
    }
    return 0;
}

static int Child(void)
{
    uint8_t* c1;
    uint8_t* c2;

    uint8_t* temp;
    struct GroupIn* g1 = nullptr;
    struct GroupIn* g2 = nullptr;

    for (int i = 0; i < TEST_NUM; ++i) {
        c1 = (uint8_t*)malloc(MALLOC_SIZE_S);
        if (!c1) {
            t_error("Malloc failed: %s\n", strerror(errno));
            return -1;
        }
        g1 = GetGroup(c1);
        c2 = (uint8_t*)malloc(MALLOC_SIZE_L);
        if (!c2) {
            t_error("Malloc failed: %s\n", strerror(errno));
            return -1;
        }
        g2 = GetGroup(c2);
        g2->meta = g1->meta;
        free(c2);
        free(c1);
    }

    return 0;
}

static pid_t StartChild(void)
{
    pid_t pid;
    int ret;
    pid = fork();
    if (pid == 0) {
        ret = Child();
        t_error("child process normally out with %d\n", ret);
        return ret;
    }
    return pid;
}

static int MallocSafeUnlinkTestImpl(int argc, char* argv[])
{
    sigset_t set;
    int status;
    pid_t pid;
    int flag = 0;

    sigemptyset(&set);
    sigaddset(&set, SIGCHLD);
    sigprocmask(SIG_BLOCK, &set, nullptr);
    auto oldSigChld = signal(SIGCHLD, Handler);
    if (oldSigChld == SIG_ERR) {
        t_error("%s signal SIGCHLD failed: %s\n", argv[0], strerror(errno));
        return -1;
    }
    auto oldSigIll = signal(SIGILL, SIG_DFL);
    if (oldSigIll == SIG_ERR) {
        t_error("%s signal SIGILL failed: %s\n", argv[0], strerror(errno));
        return -1;
    }

    pid = StartChild();
    if (pid == -1) {
        t_error("%s fork failed: %s\n", argv[0], strerror(errno));
        return -1;
    }
    struct timespec timeout = { 5, 0 };
    if (sigtimedwait(&set, nullptr, &timeout) == -1) {
        if (errno == EAGAIN) {
            flag = 1;
        } else {
            t_error("%s sigtimedwait failed: %s\n", argv[0], strerror(errno));
        }
        union sigval signalValue = { .sival_int = KILL_SIGVAL };
        if (sigqueue(pid, SIGKILL, signalValue) == -1) {
            t_error("%s sigqueue failed: %s\n", argv[0], strerror(errno));
        }
    }

    if (waitpid(pid, &status, 0) != pid) {
        t_error("%s waitpid failed: %s\n", argv[0], strerror(errno));
        return -1;
    }

    if (flag) {
        t_error("Child process time out\n");
    }

    if (WIFSIGNALED(status)) {
        if (WTERMSIG(status) != SIGSEGV && WTERMSIG(status) != SIGILL) {
            t_error("%s child process out with %s\n", argv[0], strsignal(WTERMSIG(status)));
            return -1;
        }
    } else {
        t_error("%s child process finished normally\n", argv[0]);
    }
    return 0;
}

int MallocSafeUnlinkTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return MallocSafeUnlinkTestImpl(1, libcArgv);
}
