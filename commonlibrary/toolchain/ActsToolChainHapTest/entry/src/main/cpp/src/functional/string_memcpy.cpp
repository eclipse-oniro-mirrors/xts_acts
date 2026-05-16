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

#include <cstddef>
#include <cstdint>
#include <cstring>
#include "libc_test_shim.h"
static char g_buf[512];

static void* (*volatile g_pmemcpy)(void*, const void*, size_t);

namespace {
constexpr int K_MEMCPY_ALIGN_TEST_N = 80;
constexpr uintptr_t K_ALIGN_ROUND_UP = 63U;
constexpr uintptr_t K_ALIGN_MASK64 = ~static_cast<uintptr_t>(63);
constexpr int K_MEMCPY_ALIGN_OUTER_BOUND = 16;
constexpr int K_MEMCPY_LEN_SWEEP_MAX = 64;
constexpr ptrdiff_t K_BUF_SLOT_STRIDE = 128;
} // namespace

static void* Aligned(void* p)
{
    return reinterpret_cast<void*>((reinterpret_cast<uintptr_t>(p) + K_ALIGN_ROUND_UP) & K_ALIGN_MASK64);
}

static void TestAlign(int* status, int dalign, int salign, int len)
{
    char* src = reinterpret_cast<char*>(Aligned(g_buf));
    char* dst = reinterpret_cast<char*>(Aligned(g_buf + K_BUF_SLOT_STRIDE));
    char* want = reinterpret_cast<char*>(Aligned(g_buf + 2 * K_BUF_SLOT_STRIDE));
    void* p;
    int i;

    if (salign + len > K_MEMCPY_ALIGN_TEST_N || dalign + len > K_MEMCPY_ALIGN_TEST_N) {
        LibcTestError(status, "internal: align/len out of range\n");
        return;
    }
    for (i = 0; i < K_MEMCPY_ALIGN_TEST_N; i++) {
        src[i] = '#';
        dst[i] = want[i] = ' ';
    }
    for (i = 0; i < len; i++) {
        src[salign + i] = want[dalign + i] = '0' + i;
    }
    p = g_pmemcpy(dst + dalign, src + salign, len);
    if (p != static_cast<void*>(dst + dalign)) {
        LibcTestError(status, "std::memcpy(%p,...) returned %p\n", dst + dalign, p);
    }
    for (i = 0; i < K_MEMCPY_ALIGN_TEST_N; i++) {
        if (dst[i] != want[i]) {
            LibcTestError(status, "std::memcpy(align %d, align %d, %d) failed\n", dalign, salign, len);
            OHPrintf("got : %.*s\n", dalign + len + 1, dst);
            OHPrintf("want: %.*s\n", dalign + len + 1, want);
            break;
        }
    }
}

int StringMemcpyTest()
{
    int status = SUCCESS_CODE;

    int i;
    int j;
    int k;

    g_pmemcpy = std::memcpy;

    for (i = 0; i < K_MEMCPY_ALIGN_OUTER_BOUND; i++) {
        for (j = 0; j < K_MEMCPY_ALIGN_OUTER_BOUND; j++) {
            for (k = 0; k < K_MEMCPY_LEN_SWEEP_MAX; k++) {
                TestAlign(&status, i, j, k);
            }
        }
    }

    return status;
}
