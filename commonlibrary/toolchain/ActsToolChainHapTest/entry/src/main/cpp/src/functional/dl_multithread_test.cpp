/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <dlfcn.h>
#include <pthread.h>

#include "test.h"

#define THREAD_COUNT 5
#define SLEEP_SECONDS 3

static const char* LIB_PATH = "/data/storage/el1/bundle/libs/arm/libdl_multithread_test_dso.so";
static bool g_stop = false;

static void* DlTest(void *arg)
{
    while (!g_stop) {
        void* handle = dlopen(LIB_PATH, RTLD_GLOBAL);
        if (!handle) {
            t_error("dlopen(name=%s, mode=%d) failed: %s\n", LIB_PATH, RTLD_GLOBAL, dlerror());
        }
        dlclose(handle);
    }
    return nullptr;
}

int DlMultithreadTest()
{
    pthread_t thd1;
    pthread_t thd2;
    pthread_t thd3;
    pthread_t thd4;
    pthread_t thd5;
    void *res;
    pthread_create(&thd1, nullptr, DlTest, nullptr);
    pthread_create(&thd2, nullptr, DlTest, nullptr);
    pthread_create(&thd3, nullptr, DlTest, nullptr);
    pthread_create(&thd4, nullptr, DlTest, nullptr);
    pthread_create(&thd5, nullptr, DlTest, nullptr);
    sleep(SLEEP_SECONDS);
    g_stop = true;
    pthread_join(thd1, &res);
    pthread_join(thd2, &res);
    pthread_join(thd3, &res);
    pthread_join(thd4, &res);
    pthread_join(thd5, &res);
    return g_tStatus;
}
