/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <pthread.h>
#include <cstring>
#include "test.h"

static inline bool TestConditionTsd(bool condition, const char *expr, const char *msg)
{
    if (condition) {
        return true;
    }
    t_error("%s failed (%s)\n", expr, msg);
    return false;
}

static inline bool TestPthreadResultTsd(int &result, int value, const char *expr, const char *msg)
{
    result = value;
    if (result == 0) {
        return true;
    }
    t_error("%s failed: %s (%s)\n", expr, strerror(result), msg);
    return false;
}

#define TESTC(c, m) TestConditionTsd((c), #c, m)
#define TESTR(r, f, m) TestPthreadResultTsd(r, (f), #f, m)

static pthread_key_t g_k1, g_k2;

static void DtorFunc(void *p)
{
    *(int *)p = 1;
}

static void *StartFunc(void *arg)
{
    int *p = (int *)arg;
    if (pthread_setspecific(g_k1, p) || pthread_setspecific(g_k2, p + 1)) {
        return arg;
    }
    return nullptr;
}

static int PthreadTsdTestImpl(void)
{
    pthread_t td;
    int r;
    void *res;
    int foo[2];
    int bar[2];

    /* Test POSIX thread-specific data */
    TESTR(r, pthread_key_create(&g_k1, DtorFunc), "failed to create key");
    TESTR(r, pthread_key_create(&g_k2, DtorFunc), "failed to create key");
    foo[0] = foo[1] = 0;
    TESTR(r, pthread_setspecific(g_k1, bar), "failed to set tsd");
    TESTR(r, pthread_setspecific(g_k2, bar + 1), "failed to set tsd");
    TESTR(r, pthread_create(&td, nullptr, StartFunc, foo), "failed to create thread");
    TESTR(r, pthread_join(td, &res), "failed to join");
    TESTC(res == nullptr, "pthread_setspecific failed in thread");
    TESTC(foo[0] == 1, "dtor failed to run");
    TESTC(foo[1] == 1, "dtor failed to run");
    TESTC(pthread_getspecific(g_k1) == bar, "tsd corrupted");
    TESTC(pthread_getspecific(g_k2) == bar + 1, "tsd corrupted");
    TESTR(r, pthread_setspecific(g_k1, nullptr), "failed to clear tsd");
    TESTR(r, pthread_setspecific(g_k2, nullptr), "failed to clear tsd");
    TESTR(r, pthread_key_delete(g_k1), "failed to destroy key");
    TESTR(r, pthread_key_delete(g_k2), "failed to destroy key");
    return g_tStatus;
}

int PthreadTsdTest(void)
{
    return PthreadTsdTestImpl();
}

