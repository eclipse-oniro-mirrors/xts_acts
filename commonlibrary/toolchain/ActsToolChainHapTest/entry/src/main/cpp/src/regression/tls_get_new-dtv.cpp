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

// __tls_get_new did not allocate new dtv for threads properly
#include <dlfcn.h>
#include <pthread.h>
#include "libc_test_shim.h"
#define N 10

static void CheckStatus(int* status, bool condition, const char* message)
{
    if (!condition) {
        LibcTestError(status, "%s failed\n", message);
    }
}

static pthread_barrier_t g_b;
static void* g_mod;

static void* Start(void* a)
{
    int* status = static_cast<int*>(a);
    void* sym = nullptr;
    void* (*f)(void) = nullptr;

    pthread_barrier_wait(&g_b);
    sym = dlsym(g_mod, "f");
    CheckStatus(status, sym != nullptr, "dlsym(g_mod, \"f\")");
    if (sym) {
        f = reinterpret_cast<void* (*)()>(sym);
        (void)f();
    }
    return SUCCESS_CODE;
}

int TlsGetNewDtvTest()
{
    int status = SUCCESS_CODE;

    pthread_t td[N];
    int i;

    pthread_barrier_init(&g_b, nullptr, N + 1);
    for (i = 0; i < N; i++) {
        CheckStatus(&status, !pthread_create(td + i, nullptr, Start, &status), "pthread_create");
    }

    g_mod = dlopen("/data/storage/el1/bundle/libs/arm/libtls_get_new-dtv_dso.so", RTLD_NOW);
    if (g_mod == nullptr) {
        g_mod = dlopen("/data/storage/el1/bundle/libs/arm64/libtls_get_new-dtv_dso.so", RTLD_NOW);
    }
    if (g_mod == nullptr) {
        pthread_barrier_wait(&g_b);
        for (i = 0; i < N; i++) {
            pthread_join(td[i], nullptr);
        }
        return status;
    }
    pthread_barrier_wait(&g_b);

    for (i = 0; i < N; i++) {
        CheckStatus(&status, !pthread_join(td[i], nullptr), "pthread_join");
    }
    return status;
}

int TlsGetNewDtvTestCompat()
{
    return TlsGetNewDtvTest();
}
