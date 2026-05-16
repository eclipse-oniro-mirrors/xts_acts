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
#include <cstdio>
#include <cstring>
#include "test.h"

namespace {
constexpr uintptr_t K_ALIGN_MASK32 = 0x3U;
constexpr uintptr_t K_ALIGN_MASK64 = 0x7U;
constexpr size_t K_WORD_BYTES32 = 4U;
constexpr size_t K_WORD_BYTES64 = 8U;
constexpr size_t K_MEM_TEST_INT_COUNT = 4U;
constexpr size_t K_MEM_TEST_COPY_FOUR_INTS = sizeof(int) * 4U;
} // namespace

#ifdef __cplusplus
extern "C" {
#endif

void* AeabiMemmove(void* dest, const void* src, size_t n)
{
    if (dest == nullptr || src == nullptr || n == 0) {
        return nullptr;
    }

    std::memmove(dest, src, n);
    return dest;
}

void* AeabiMemmove4(void* dest, const void* src, size_t n)
{
    if (dest == nullptr || src == nullptr || n == 0) {
        return nullptr;
    }

    unsigned char* d = reinterpret_cast<unsigned char*>(dest);
    const unsigned char* s = reinterpret_cast<const unsigned char*>(src);

    if (d > s && d < s + n) {
        d += n;
        s += n;
        while (n > 0 && (reinterpret_cast<uintptr_t>(d) & K_ALIGN_MASK32)) {
            *(--d) = *(--s);
            n--;
        }

        unsigned int* alignedD = reinterpret_cast<unsigned int*>(d);
        const unsigned int* alignedS = reinterpret_cast<const unsigned int*>(s);
        while (n >= K_WORD_BYTES32) {
            *(--alignedD) = *(--alignedS);
            n -= K_WORD_BYTES32;
        }

        d = reinterpret_cast<unsigned char*>(alignedD);
        s = reinterpret_cast<const unsigned char*>(alignedS);
        while (n > 0) {
            *(--d) = *(--s);
            n--;
        }
    } else {
        while (n > 0 && (reinterpret_cast<uintptr_t>(d) & K_ALIGN_MASK32)) {
            *d++ = *s++;
            n--;
        }

        unsigned int* alignedD = reinterpret_cast<unsigned int*>(d);
        const unsigned int* alignedS = reinterpret_cast<const unsigned int*>(s);
        while (n >= K_WORD_BYTES32) {
            *alignedD++ = *alignedS++;
            n -= K_WORD_BYTES32;
        }

        d = reinterpret_cast<unsigned char*>(alignedD);
        s = reinterpret_cast<const unsigned char*>(alignedS);
        while (n > 0) {
            *d++ = *s++;
            n--;
        }
    }

    return dest;
}

void* AeabiMemmove8(void* dest, const void* src, size_t n)
{
    if (dest == nullptr || src == nullptr || n == 0) {
        return nullptr;
    }

    unsigned char* d = reinterpret_cast<unsigned char*>(dest);
    const unsigned char* s = reinterpret_cast<const unsigned char*>(src);

    if (d > s && d < s + n) {
        d += n;
        s += n;
        while (n > 0 && (reinterpret_cast<uintptr_t>(d) & K_ALIGN_MASK64)) {
            *(--d) = *(--s);
            n--;
        }

        unsigned long long* alignedD = reinterpret_cast<unsigned long long*>(d);
        const unsigned long long* alignedS = reinterpret_cast<const unsigned long long*>(s);
        while (n >= K_WORD_BYTES64) {
            *(--alignedD) = *(--alignedS);
            n -= K_WORD_BYTES64;
        }

        d = reinterpret_cast<unsigned char*>(alignedD);
        s = reinterpret_cast<const unsigned char*>(alignedS);
        while (n > 0) {
            *(--d) = *(--s);
            n--;
        }
    } else {
        while (n > 0 && (reinterpret_cast<uintptr_t>(d) & K_ALIGN_MASK64)) {
            *d++ = *s++;
            n--;
        }

        unsigned long long* alignedD = reinterpret_cast<unsigned long long*>(d);
        const unsigned long long* alignedS = reinterpret_cast<const unsigned long long*>(s);
        while (n >= K_WORD_BYTES64) {
            *alignedD++ = *alignedS++;
            n -= K_WORD_BYTES64;
        }

        d = reinterpret_cast<unsigned char*>(alignedD);
        s = reinterpret_cast<const unsigned char*>(alignedS);
        while (n > 0) {
            *d++ = *s++;
            n--;
        }
    }

    return dest;
}

#ifdef __cplusplus
}
#endif

/**
 * @tc.name      : Memmove0100
 * @tc.desc      : test AeabiMemmove method
 * @tc.level     : Level 1
 */
static void Memmove0100(void)
{
    int dest[] = { 1, 2, 3, 4, 5, 6, 7 };
    int src[] = { 4, 5, 6, 7 };
    int* result = static_cast<int*>(AeabiMemmove(dest, src, K_MEM_TEST_COPY_FOUR_INTS));
    if (result == nullptr) {
        t_error("%s AeabiMemmove error get result is %d\n", __func__, result);
    }
    for (size_t i = 0; i < K_MEM_TEST_INT_COUNT; ++i) {
        if (dest[i] != src[i]) {
            t_error("%s AeabiMemmove content check failed at %zu\n", __func__, i);
        }
    }
}

/**
 * @tc.name      : Memmove0200
 * @tc.desc      : test AeabiMemmove4 method
 * @tc.level     : Level 1
 */
static void Memmove0200(void)
{
    int dest[] = { 1, 2, 3, 4, 5, 6, 7 };
    int src[] = { 4, 5, 6, 7 };
    int* result = static_cast<int*>(AeabiMemmove4(dest, src, K_MEM_TEST_COPY_FOUR_INTS));
    if (result == nullptr) {
        t_error("%s AeabiMemmove4 error get result is %d\n", __func__, result);
    }
    for (size_t i = 0; i < K_MEM_TEST_INT_COUNT; ++i) {
        if (dest[i] != src[i]) {
            t_error("%s AeabiMemmove4 content check failed at %zu\n", __func__, i);
        }
    }
}

/**
 * @tc.name      : Memmove0300
 * @tc.desc      : test AeabiMemmove8 method
 * @tc.level     : Level 1
 */
static void Memmove0300(void)
{
    int dest[] = { 1, 2, 3, 4, 5, 6, 7 };
    int src[] = { 4, 5, 6, 7 };
    int* result = static_cast<int*>(AeabiMemmove8(dest, src, K_MEM_TEST_COPY_FOUR_INTS));
    if (result == nullptr) {
        t_error("%s AeabiMemmove8 error get result is %d\n", __func__, result);
    }
    for (size_t i = 0; i < K_MEM_TEST_INT_COUNT; ++i) {
        if (dest[i] != src[i]) {
            t_error("%s AeabiMemmove8 content check failed at %zu\n", __func__, i);
        }
    }
}

int AeabiMemmoveTest()
{
    Memmove0100();
    Memmove0200();
    Memmove0300();
    return T_STATUS;
}