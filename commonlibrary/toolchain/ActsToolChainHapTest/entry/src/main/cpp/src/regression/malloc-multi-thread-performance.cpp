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

#include <atomic>
#include <cerrno>
#include <cstring>
#include <ctime>
#include <malloc.h>
#include <pthread.h>
#include <sched.h>
#include "test.h"

namespace {
std::atomic<int> g_mallocTestHadErr{ 0 };
} // namespace

#define THREAD_MAX_N 8
#define SIZE_ALIGN (4 * sizeof(size_t))
#define MMAP_THRESHOLD 131052
#define FREE_CYCLE 16
#define THRESHOLD (MMAP_THRESHOLD / 16)
#define ITER_TIME 80
#define NANOSEC_PER_SEC 1e9
#define MALLOC_TIME (ITER_TIME * (THRESHOLD / (SIZE_ALIGN + 1)))

void FreeAll(void** ptr)
{
    for (int j = 0; j < FREE_CYCLE; j++) {
        free(ptr[j]);
    }
}

void* Func(void* arg)
{
    int* val = (int*)arg;
    cpu_set_t mask;
    struct timespec ts[2];
    int num = 0;
    void* ptr[FREE_CYCLE];

    CPU_ZERO(&mask);
    CPU_SET(0, &mask);
    if (sched_setaffinity(0, sizeof(mask), &mask) < 0) {
        t_error("Set CPU affinity of thread %d failure, ERROR:%s\n", *val, strerror(errno));
        return nullptr;
    }

    for (int i = 0; i < ITER_TIME; ++i) {
        for (size_t size = 0; size < THRESHOLD; size += SIZE_ALIGN + 1) {
            if (num == FREE_CYCLE) {
                FreeAll(ptr);
                num = 0;
            }
            ptr[num] = malloc(size);
            if (!ptr[num]) {
                g_mallocTestHadErr.store(1, std::memory_order_relaxed);
                *val = errno;
                return nullptr;
            }
            num++;
        }
    }

    for (int j = 0; j < num; j++) {
        free(ptr[j]);
    }

    *val = 0;
    return nullptr;
}

static int MallocMultiThreadPerformanceTestImpl(int argc, char* argv[])
{
    struct timespec ts[2];
    pthread_attr_t attr;
    pthread_t tids[THREAD_MAX_N];
    int tResult[THREAD_MAX_N] = { 0 };
    int flag = 0;
    int ret;
    int i;
    int created = 0;

    ret = pthread_attr_init(&attr);
    if (ret < 0) {
        t_error("Init pthread attribute failed: %s\n", strerror(errno));
        return -1;
    }

    clock_gettime(CLOCK_REALTIME, ts);
    for (i = 0; i < THREAD_MAX_N; ++i) {
        tResult[i] = i;
        ret = pthread_create(&tids[i], &attr, Func, &tResult[i]);
        if (ret < 0) {
            t_error("Create pthread %u failed: %s\n", i, strerror(errno));
            flag = -1;
            break;
        }
        created++;
    }

    for (i = 0; i < created; ++i) {
        ret = pthread_join(tids[i], nullptr);
        if (ret < 0) {
            t_error("Join thread %u failed: %s\n", i, strerror(errno));
        }
    }
    clock_gettime(CLOCK_REALTIME, ts + 1);

    (void)pthread_attr_destroy(&attr);

    double cost = (ts[1].tv_sec - ts[0].tv_sec) * NANOSEC_PER_SEC + (ts[1].tv_nsec - ts[0].tv_nsec);

    if (!flag) {
        TPrintf("Malloc and free %d threads %d times cost %lf s\n", THREAD_MAX_N, MALLOC_TIME, cost / NANOSEC_PER_SEC);
        T_STATUS = 0;
    }
    if (g_mallocTestHadErr.load(std::memory_order_relaxed) != 0) {
        t_error("Malloc test: malloc failed in worker thread\n");
    }

    return T_STATUS;
}

int MallocMultiThreadPerformanceTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return MallocMultiThreadPerformanceTestImpl(1, libcArgvStub);
}
