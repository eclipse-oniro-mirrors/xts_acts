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

// commit: 370f78f2c80c64b7b0780a01e672494a26b5678e 2011-03-09
// commit: 0bed7e0acfd34e3fb63ca0e4d99b7592571355a9 2011-03-09
// raise should be robust against async fork in a signal Handler
#include <cerrno>
#include <csignal>
#include <cstring>
#include <pthread.h>
#include <sched.h>
#include <sys/wait.h>
#include <unistd.h>
#include "test.h"

static constexpr int K_RAISE_RACE_SIGNUM = 40;
static constexpr int K_RAISE_RACE_SIGNAL_ITERATIONS = 1000;
static constexpr int K_PTHREAD_KILL_ITERATIONS = 100;
static constexpr int K_WAIT_CHILD_ITERATIONS = 100;
static volatile int g_c0;
static volatile int g_c1;
static volatile int g_child;

static void Handler0(int sig)
{
    g_c0++;
}

static void Handler1(int sig)
{
    g_c1++;
    switch (fork()) {
        case 0:
            g_child = 1;
            break;
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        default:
            break;
    }
}

static void* Start(void* arg)
{
    int i;
    int r;
    int s;

    for (i = 0; i < K_RAISE_RACE_SIGNAL_ITERATIONS; i++) {
        r = raise(K_RAISE_RACE_SIGNUM);
        if (r) {
            t_error("raise failed: %s\n", strerror(errno));
        }
    }
    if (g_c0 != K_RAISE_RACE_SIGNAL_ITERATIONS) {
        t_error("lost signals: got %d, wanted %d (ischild %d forks %d)\n",
                g_c0,
                K_RAISE_RACE_SIGNAL_ITERATIONS,
                g_child,
                g_c1);
    }
    if (g_child) {
        _exit(T_STATUS);
    }

    /* make sure we got all pthread_kills, then wait the forked children */
    while (g_c1 < K_WAIT_CHILD_ITERATIONS) {
        sched_yield();
    }
    for (i = 0; i < K_WAIT_CHILD_ITERATIONS; i++) {
        r = wait(&s);
        if (r == -1) {
            t_error("wait failed: %s\n", strerror(errno));
        } else if (!WIFEXITED(s) || WTERMSIG(s)) {
            t_error("g_child failed: pid:%d status:%d\n", r, s);
        }
    }
    return nullptr;
}

static int RaiseRaceTestImpl(void)
{
    pthread_t t;
    void* p;
    int r;
    int i;
    int s;

    if (signal(K_RAISE_RACE_SIGNUM, Handler0) == SIG_ERR) {
        t_error("registering signal Handler failed: %s\n", strerror(errno));
    }
    if (signal(K_RAISE_RACE_SIGNUM + 1, Handler1) == SIG_ERR) {
        t_error("registering signal Handler failed: %s\n", strerror(errno));
    }

    r = pthread_create(&t, nullptr, Start, nullptr);
    if (r) {
        t_error("pthread_create failed: %s\n", strerror(r));
    }
    for (i = 0; i < K_PTHREAD_KILL_ITERATIONS; i++) {
        r = pthread_kill(t, K_RAISE_RACE_SIGNUM + 1);
        if (r) {
            t_error("phread_kill failed: %s\n", strerror(r));
        }
    }
    r = pthread_join(t, &p);
    if (r) {
        t_error("pthread_join failed: %s\n", strerror(r));
    }
    return T_STATUS;
}

int RaiseRaceTest(void)
{
    return RaiseRaceTestImpl();
}
