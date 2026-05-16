/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <pthread.h>
#include <unistd.h>

#define NAMELEN 16

namespace {
constexpr int K_ARGC_THRESHOLD_FOR_ARGV_BUF_LEN = 2;
} // namespace

static void ErrExitEN(int en, const char* msg)
{
    errno = en;
    perror(msg);
    exit(EXIT_FAILURE);
}

static void* Threadfunc(void* parm)
{
    sleep(1); // allow main program to set the thread name
    return nullptr;
}

static int PthreadGetnameNpTestImpl(int argc, char** argv)
{
    pthread_t thread;
    int rc;
    char threadName[NAMELEN];
    char setThreadName[] = "THREADFOO";
    char defaultName[] = "pthread_getname";

    rc = pthread_getname_np(pthread_self(), threadName, NAMELEN - 1);
    if (rc != ERANGE) {
        ErrExitEN(rc, "pthread_getname_np(invalid args[len]) failed");
    }

    rc = pthread_getname_np(pthread_self(), threadName, NAMELEN);
    if (rc != 0) {
        ErrExitEN(rc, "pthread_getname_np failed");
    }
    if (strcmp(threadName, defaultName) != 0) {
        perror("pthread name comparison failed");
    }

    rc = pthread_create(&thread, nullptr, Threadfunc, nullptr);
    if (rc != 0) {
        ErrExitEN(rc, "pthread_create failed");
    }

    rc = pthread_setname_np(thread, (argc > 1) ? argv[1] : setThreadName);
    if (rc != 0) {
        ErrExitEN(rc, "pthread_setname_np failed");
    }

    rc = pthread_getname_np(thread, threadName, (argc > K_ARGC_THRESHOLD_FOR_ARGV_BUF_LEN) ? atoi(argv[1]) : NAMELEN);
    if (rc != 0) {
        ErrExitEN(rc, "pthread_getname_np failed");
    }
    if (strcmp(threadName, setThreadName) != 0) {
        perror("pthread name comparison failed");
    }

    rc = pthread_join(thread, nullptr);
    if (rc != 0) {
        ErrExitEN(rc, "pthread_join failed");
    }

    exit(EXIT_SUCCESS);
}

int PthreadGetnameNpTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return PthreadGetnameNpTestImpl(1, libcArgvStub);
}
