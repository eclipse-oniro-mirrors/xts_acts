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
#include <sigchain.h>
#include <sys/wait.h>
#include <unistd.h>
#include "test.h"

#define UNIT 16
#define OFF_OFFSET 2
#define FIRST_OFFSET (-4)
#define FIRST_OFF_OFFSET 8
#define MALLOC_SIZE_S (10 * sizeof(uintptr_t))
#define MALLOC_SIZE_L (50 * sizeof(uintptr_t))
#define TEST_NUM 512

struct meta_in {
    struct meta_in *prev, *next;
    uintptr_t* mem;
};

struct GroupIn {
    struct meta_in* meta;
};

static struct GroupIn* get_group(const uint8_t* p)
{
    int offset = *(const uint16_t*)(p - OFF_OFFSET);

    if (p[FIRST_OFFSET]) {
        offset = *(uint32_t*)(p - FIRST_OFF_OFFSET);
    }
    struct GroupIn* base = (struct GroupIn*)(p - UNIT * offset - UNIT);
    return base;
}

static void Handler(int s) {}

static int Child(void)
{
    void* d0;
    void* d1;

    struct GroupIn* g0 = nullptr;
    struct GroupIn* g1 = nullptr;

    for (int i = 0; i < TEST_NUM; ++i) {
        d0 = malloc(MALLOC_SIZE_S);
        if (!d0) {
            t_error("Malloc d0 failed: %s\n", strerror(errno));
            return -1;
        }

        g0 = get_group((const uint8_t*)d0);

        d1 = malloc(MALLOC_SIZE_L);
        if (!d1) {
            t_error("Malloc d1 failed: %s\n", strerror(errno));
            return -1;
        }
        g1 = get_group((const uint8_t*)d1);

        if ((uintptr_t)g0->meta->mem == (uintptr_t)g0) {
            t_error("encoding pointer is equal to real pointer 1\n");
        }

        if ((uintptr_t)g1->meta->mem == (uintptr_t)g1) {
            t_error("encoding pointer is equal to real pointer 2\n");
        }

        if ((uintptr_t)g0->meta->prev->next == (uintptr_t)g0->meta->mem) {
            t_error("encoding pointer is equal to real pointer 1\n");
        }

        if ((uintptr_t)g1->meta->prev->next == (uintptr_t)g1->meta->mem) {
            t_error("encoding pointer is equal to real pointer 2\n");
        }

        free(d0);
        free(d1);
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

static int MallocEncodePointerTestImpl(int argc, char* argv[])
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
    RemoveAllSpecialHandler(SIGSEGV);

    pid = StartChild();
    if (pid == -1) {
        t_error("%s fork failed: %s\n", argv[0], strerror(errno));
        return -1;
    }
    // 修改后
    struct timespec timeout = { 5, 0 };
    if (sigtimedwait(&set, nullptr, &timeout) == -1) {
        if (errno == EAGAIN) {
            flag = 1;
        } else {
            t_error("%s sigtimedwait failed: %s\n", argv[0], strerror(errno));
        }
        union sigval signalValue = { .sival_int = 0 };
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

int MallocEncodePointerTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return MallocEncodePointerTestImpl(1, libcArgv);
}
