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
 
#include <cstdint>
#include <cstring>
#include <pthread.h>
#include "test.h"

static __thread char g_d1 = 11;
static __thread char g_d64 __attribute__ ((aligned(64))) = 22;
static __thread char g_d4096 __attribute__ ((aligned(4096))) = 33;
static __thread char g_z1 = 0;
static __thread char g_z64 __attribute__ ((aligned(64))) = 0;
static __thread char g_z4096 __attribute__ ((aligned(4096))) = 0;
static __thread const char *g_s1 = "s1";

static int g_tnum;

#define CHECK(c, fmt, ...) do { \
    if (!(c)) \
        t_error("[thread %d]: %s failed " fmt ".\n", g_tnum, #c, ##__VA_ARGS__); \
} while (0)

static unsigned ptrmod(void *p, unsigned m)
{
    if (m == 0) {
        return 0;
    }
    volatile unsigned n = static_cast<unsigned>(reinterpret_cast<uintptr_t>(p));
    return n % m;
}

static void *CheckFunc(void *arg)
{
    g_tnum++;

    CHECK(g_d1 == 11, " want 11 got %d", g_d1);
    CHECK(g_d64 == 22, " want 22 got %d", g_d64);
    CHECK(g_d4096 == 33, " want 33 got %d", g_d4096);

    CHECK(ptrmod(&g_d64, 64) == 0, " address is %p, want 64 byte alignment", &g_d64);
    CHECK(ptrmod(&g_d4096, 4096) == 0, " address is %p, want 4096 byte alignment", &g_d4096);

    CHECK(g_z1 == 0, " want 0 got %d", g_z1);
    CHECK(g_z64 == 0, " want 0 got %d", g_z64);
    CHECK(g_z4096 == 0, " want 0 got %d", g_z4096);

    CHECK(ptrmod(&g_z64, 64) == 0, " address is %p, want 64 byte alignment", &g_z64);
    CHECK(ptrmod(&g_z4096, 4096) == 0, " address is %p, want 4096 byte alignment", &g_z4096);

    CHECK(!strcmp(g_s1, "s1"), " want s1 got %s", g_s1);
    return nullptr;
}

static int TlsLocalExecTestImpl()
{
    pthread_t td;

    CheckFunc(nullptr);
    CHECK(pthread_create(&td, nullptr, CheckFunc, nullptr) == 0, "", "");
    CHECK(pthread_join(td, nullptr) == 0, "", "");

    return g_tStatus;
}

int TlsLocalExecTest(void)
{
    return TlsLocalExecTestImpl();
}
