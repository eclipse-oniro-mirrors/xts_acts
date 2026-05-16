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

// by Jens Gustedt from http://www.openwall.com/lists/musl/2014/08/11/1
// c11 THREADS test was removed and t_error messages were added
// the test deadlocks with a broken cond var implementation so
// cond_waits were changed to cond_timedwaits with short timeout
#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include "test.h"

#include <pthread.h>

#define VERSION "POSIX THREADS"

typedef pthread_mutex_t Mutex;
typedef pthread_cond_t Condition;
typedef pthread_t thread;
typedef void* thread_ret;

#define mutex_init(M) pthread_mutex_init((M), 0)
#define MUTEX_DESTROY pthread_mutex_destroy
#define MUTEX_LOCK pthread_mutex_lock
#define MUTEX_UNLOCK pthread_mutex_unlock

#define condition_init(C) pthread_cond_init((C), 0)
#define CONDITION_DESTROY pthread_cond_destroy
#define CONDITION_WAIT pthread_cond_wait
#define CONDITION_TIMEDWAIT pthread_cond_timedwait
#define CONDITION_SIGNAL pthread_cond_signal
#define CONDITION_BROADCAST pthread_cond_broadcast

#define thread_create(ID, START, ARG) pthread_create(ID, 0, START, ARG)
#define THREAD_JOIN pthread_join

#define gettime(TS) clock_gettime(CLOCK_REALTIME, (TS))

#define ERRORSTRING strerror

#ifdef __GLIBC__
#define LIBRARY "glibc"
#else
#define LIBRARY "unidentified"
#endif

#define trace2(L, ...) fprintf(stderr, __FILE__ ":" #L ": " __VA_ARGS__)
#define trace1(L, ...) trace2(L, __VA_ARGS__)
#ifdef DEBUG
#define trace(...) trace1(__LINE__, __VA_ARGS__)
#else
#define trace(...)                         \
    do {                                   \
        if (0)                             \
            trace1(__LINE__, __VA_ARGS__); \
    } while (0)
#endif

#define tell(...) trace(__VA_ARGS__)

enum {
    PHASES = 10,
    THREADS = 10,
};
constexpr long ONE_BILLION_NS = 1000 * 1000 * 1000;
constexpr long HALF_SECOND_NS = 500 * 1000 * 1000;

static thread g_id[THREADS];
static unsigned g_args[THREADS];

static Mutex g_mut[PHASES];
static unsigned g_inside[PHASES];

static Condition g_condClient;
static Condition g_condMain;
static unsigned volatile g_phase;

static void Settimeout(struct timespec* ts)
{
    if (clock_gettime(CLOCK_REALTIME, ts)) {
        t_error("clock_gettime failed: %s\n", strerror(errno));
    }
    ts->tv_nsec += HALF_SECOND_NS;
    if (ts->tv_nsec >= ONE_BILLION_NS) {
        ts->tv_nsec -= ONE_BILLION_NS;
        ts->tv_sec++;
    }
}

static thread_ret Client(void* arg)
{
    struct timespec ts;
    unsigned* number = (unsigned*)arg;
    for (unsigned i = 0; i < PHASES; ++i) {
        trace("thread %u in g_phase %u\n", *number, i);
        MUTEX_LOCK(&g_mut[i]);
        ++g_inside[i];
        if (g_inside[i] == THREADS) {
            trace("thread %u is last, signalling main\n", *number);
            int ret = CONDITION_SIGNAL(&g_condMain);
            trace("thread %u is last, signalling main, %s\n", *number, ERRORSTRING(ret));
            if (ret)
                t_error("thread %u is last in g_phase %u, signalling main failed: %s\n", *number, i, ERRORSTRING(ret));
        }
        while (i == g_phase) {
            tell("thread %u in g_phase %u (%u), waiting\n", *number, i, g_phase);
            Settimeout(&ts);
            int ret = CONDITION_TIMEDWAIT(&g_condClient, &g_mut[i], &ts);
            trace("thread %u in g_phase %u (%u), finished, %s\n", *number, i, g_phase, ERRORSTRING(ret));
            if (ret) {
                t_error("thread %u in g_phase %u (%u) finished waiting: %s\n", *number, i, g_phase, ERRORSTRING(ret));
                exit(T_STATUS);
            }
        }
        int ret = MUTEX_UNLOCK(&g_mut[i]);
        trace("thread %u in g_phase %u (%u), has unlocked Mutex: %s\n", *number, i, g_phase, ERRORSTRING(ret));
        if (ret) {
            t_error("thread %u in g_phase %u (%u), failed to unlock: %s\n", *number, i, g_phase, ERRORSTRING(ret));
        }
    }
    return nullptr;
}

static int PthreadCondSmasherTestImpl(void)
{
    struct timespec ts;

    tell("start up of main, using %s, library %s\n", VERSION, LIBRARY);
    condition_init(&g_condClient);
    condition_init(&g_condMain);
    for (unsigned i = 0; i < PHASES; ++i) {
        mutex_init(&g_mut[i]);
    }
    MUTEX_LOCK(&g_mut[0]);

    for (unsigned i = 0; i < THREADS; ++i) {
        g_args[i] = i;
        thread_create(&g_id[i], Client, &g_args[i]);
    }

    while (g_phase < PHASES) {
        while (g_inside[g_phase] < THREADS) {
            trace("main seeing %u THREADS in g_phase %u, waiting\n", g_inside[g_phase], g_phase);
            Settimeout(&ts);
            int ret = CONDITION_TIMEDWAIT(&g_condMain, &g_mut[g_phase], &ts);
            tell("main seeing %u THREADS in g_phase %u, %s\n", g_inside[g_phase], g_phase, ERRORSTRING(ret));
            if (ret) {
                t_error("main thread in g_phase %u (%u THREADS g_inside), finished waiting: %s\n",
                        g_phase,
                        g_inside[g_phase],
                        ERRORSTRING(ret));
                return T_STATUS;
            }
        }
        /* now we know that everybody is waiting g_inside, lock the next
           Mutex, if any, such that nobody can enter the next g_phase
           without our permission. */
        if (g_phase < PHASES - 1) {
            MUTEX_LOCK(&g_mut[g_phase + 1]);
        }
        /* Now signal all clients, update the g_phase count and release the
           Mutex they are waiting for. */
        int ret = CONDITION_BROADCAST(&g_condClient);
        trace("main has broadcast to %u: %s\n", g_phase, ERRORSTRING(ret));
        if (ret)
            t_error("main broadcast in g_phase %u failed: %s\n", g_phase, ERRORSTRING(ret));
        ++g_phase;
        ret = MUTEX_UNLOCK(&g_mut[g_phase - 1]);
        trace("main has unlocked Mutex %u: %s\n", g_phase - 1, ERRORSTRING(ret));
        if (ret) {
            t_error("main failed to unlock Mutex %u: %s\n", g_phase - 1, ERRORSTRING(ret));
        }
    }

    trace("main finished loop\n");

    for (unsigned i = 0; i < THREADS; ++i) {
        trace("main joining thread %u\n", i);
        thread_ret joinRet = nullptr;
        int ret = THREAD_JOIN(g_id[i], &joinRet);
        trace("main joining thread %u: %s\n", i, ERRORSTRING(ret));
        if (ret) {
            t_error("main failed join thread %u: %s\n", i, ERRORSTRING(ret));
        }
    }

    /* C functions to destroy the control structures don't return error
       information, so we can't check for errors, here. */
    for (unsigned i = 0; i < PHASES; ++i) {
        MUTEX_DESTROY(&g_mut[i]);
    }
    CONDITION_DESTROY(&g_condMain);
    CONDITION_DESTROY(&g_condClient);

    tell("shut down of main, using %s, library %s\n", VERSION, LIBRARY);

    return T_STATUS;
}

int PthreadCondSmasherTest(void)
{
    return PthreadCondSmasherTestImpl();
}
