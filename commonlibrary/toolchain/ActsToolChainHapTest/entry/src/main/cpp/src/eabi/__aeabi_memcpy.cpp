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
#include "test.h"

namespace {
constexpr uintptr_t K_ALIGN_MASK32 = 0x3U;
constexpr uintptr_t K_ALIGN_MASK64 = 0x7U;
constexpr size_t K_WORD_BYTES32 = 4U;
constexpr size_t K_WORD_BYTES64 = 8U;
constexpr size_t K_MEM_TEST_INT_COUNT = 4U;
constexpr size_t K_MEM_TEST_COPY_FOUR_INTS = sizeof(int) * 4U;
} // namespace

/**
 * @tc.name      : Memcpy0100
 * @tc.desc      : test AeabiMemcpy method
 * @tc.level     : Level 1
 */

#ifdef __cplusplus
extern "C" {
#endif

void* AeabiMemcpy(void* dest, const void* src, size_t n)
{
    if (dest == nullptr || src == nullptr || n == 0) {
        return nullptr;
    }

    unsigned char* d = static_cast<unsigned char*>(dest);
    const unsigned char* s = static_cast<const unsigned char*>(src);
    for (size_t i = 0; i < n; ++i) {
        d[i] = s[i];
    }
    return dest;
}

void* AeabiMemcpy4(void* dest, const void* src, size_t n)
{
    if (dest == nullptr || src == nullptr || n == 0) {
        return nullptr;
    }

    unsigned char* d = static_cast<unsigned char*>(dest);
    const unsigned char* s = static_cast<const unsigned char*>(src);

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

    return dest;
}

void* AeabiMemcpy8(void* dest, const void* src, size_t n)
{
    if (dest == nullptr || src == nullptr || n == 0) {
        return nullptr;
    }

    unsigned char* d = static_cast<unsigned char*>(dest);
    const unsigned char* s = static_cast<const unsigned char*>(src);

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

    return dest;
}
#ifdef __cplusplus
}
#endif

void Memcpy0100(void)
{
    int dest[] = { 1, 2, 3, 4, 5, 6, 7 };
    int src[] = { 4, 5, 6, 7 };
    void* result = AeabiMemcpy(dest, src, K_MEM_TEST_COPY_FOUR_INTS);
    if (result == nullptr) {
        t_error("%s AeabiMemcpy error get result is %d\n", __func__, result);
    }
    for (size_t i = 0; i < K_MEM_TEST_INT_COUNT; ++i) {
        if (dest[i] != src[i]) {
            t_error("%s AeabiMemcpy content check failed at %zu\n", __func__, i);
        }
    }
}

/**
 * @tc.name      : Memcpy0200
 * @tc.desc      : test AeabiMemcpy4 method
 * @tc.level     : Level 1
 */
void Memcpy0200(void)
{
    int dest[] = { 1, 2, 3, 4, 5, 6, 7 };
    int src[] = { 4, 5, 6, 7 };
    void* result = AeabiMemcpy4(dest, src, K_MEM_TEST_COPY_FOUR_INTS);
    if (result == nullptr) {
        t_error("%s AeabiMemcpy4 error get result is %d\n", __func__, result);
    }
    for (size_t i = 0; i < K_MEM_TEST_INT_COUNT; ++i) {
        if (dest[i] != src[i]) {
            t_error("%s AeabiMemcpy4 content check failed at %zu\n", __func__, i);
        }
    }
}

/**
 * @tc.name      : Memcpy0300
 * @tc.desc      : test AeabiMemcpy8 method
 * @tc.level     : Level 1
 */
void Memcpy0300(void)
{
    int dest[] = { 1, 2, 3, 4, 5, 6, 7 };
    int src[] = { 4, 5, 6, 7 };
    void* result = AeabiMemcpy8(dest, src, K_MEM_TEST_COPY_FOUR_INTS);
    if (result == nullptr) {
        t_error("%s AeabiMemcpy8 error get result is %d\n", __func__, result);
    }
    for (size_t i = 0; i < K_MEM_TEST_INT_COUNT; ++i) {
        if (dest[i] != src[i]) {
            t_error("%s AeabiMemcpy8 content check failed at %zu\n", __func__, i);
        }
    }
}

int AeabiMemcpyTest()
{
    Memcpy0100();
    Memcpy0200();
    Memcpy0300();
    return T_STATUS;
}