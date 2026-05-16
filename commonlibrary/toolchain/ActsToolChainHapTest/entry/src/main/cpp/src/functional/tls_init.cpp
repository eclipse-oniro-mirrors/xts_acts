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

#include <pthread.h>
#include "libc_test_shim.h"

namespace {
constexpr int K_TLS_FIXED_INIT = 23;
constexpr int K_TLS_ZERO_INIT = 0;
constexpr int K_TLS_WORKER_THREADS = 5;
constexpr int K_JOIN_REPEAT_ROUNDS = 2;
} // namespace

__thread int g_tlsFix = K_TLS_FIXED_INIT;
__thread int g_tlsZero;

static void* F(void* arg)
{
    int* status = (int*)arg;
    if (g_tlsFix != K_TLS_FIXED_INIT) {
        LibcTestError(status, "fixed init failed: want 23 got %d\n", g_tlsFix);
    }
    if (g_tlsZero != K_TLS_ZERO_INIT) {
        LibcTestError(status, "zero init failed: want 0 got %d\n", g_tlsZero);
    }
    g_tlsFix++;
    g_tlsZero++;
    return SUCCESS_CODE;
}

static void CheckStatus(int& status, int rc, const char* callName)
{
    if (rc != 0) {
        LibcTestError(&status, "%s failed.\n", callName);
    }
}

template <typename T, size_t N> constexpr size_t ArrayLength(const T (&)[N])
{
    return N;
}

int TlsInitTest()
{
    int status = SUCCESS_CODE;

    pthread_t t[K_TLS_WORKER_THREADS];
    int i;
    int j;

    if (g_tlsFix != K_TLS_FIXED_INIT) {
        LibcTestError(&status, "fixed init failed: want 23 got %d\n", g_tlsFix);
    }
    if (g_tlsZero != K_TLS_ZERO_INIT) {
        LibcTestError(&status, "zero init failed: want 0 got %d\n", g_tlsZero);
    }

    for (j = 0; j < K_JOIN_REPEAT_ROUNDS; j++) {
        for (i = 0; i < static_cast<int>(ArrayLength(t)); i++) {
            CheckStatus(status, pthread_create(t + i, nullptr, F, &status), "pthread_create");
            g_tlsFix++;
            g_tlsZero++;
        }
        for (i = 0; i < static_cast<int>(ArrayLength(t)); i++) {
            CheckStatus(status, pthread_join(t[i], nullptr), "pthread_join");
        }
    }

    return status;
}
