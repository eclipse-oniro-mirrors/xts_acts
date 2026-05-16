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

#include <algorithm>
#include <cstdint>
#include <cstdio>
#include "test.h"

namespace {
constexpr uintptr_t K_ALIGN_MASK32 = 0x3U;
constexpr uintptr_t K_ALIGN_MASK64 = 0x7U;
constexpr size_t K_WORD_BYTES32 = 4U;
constexpr size_t K_WORD_BYTES64 = 8U;
constexpr int K_AEABI_OP_SKIPPED = 0;
constexpr int K_AEABI_OP_DONE = 1;
} // namespace

/**
 * @tc.name      : Memclr0100
 * @tc.desc      : test AeabiMemclr method
 * @tc.level     : Level 1
 */
#ifdef __cplusplus
extern "C" {
#endif

int AeabiMemclr(void* dest, size_t n)
{
    if (dest == nullptr || n == 0) {
        return K_AEABI_OP_SKIPPED;
    }

    std::fill_n(static_cast<unsigned char*>(dest), n, static_cast<unsigned char>(0));

    return K_AEABI_OP_DONE;
}

int AeabiMemclr4(void* dest, size_t n)
{
    if (dest == nullptr || n == 0) {
        return K_AEABI_OP_SKIPPED;
    }

    unsigned char* ptr = static_cast<unsigned char*>(dest);

    while (n > 0 && (reinterpret_cast<uintptr_t>(ptr) & K_ALIGN_MASK32)) {
        *ptr++ = 0;
        n--;
    }

    unsigned int* alignedPtr = reinterpret_cast<unsigned int*>(ptr);
    while (n >= K_WORD_BYTES32) {
        *alignedPtr++ = 0;
        n -= K_WORD_BYTES32;
    }

    ptr = reinterpret_cast<unsigned char*>(alignedPtr);
    while (n > 0) {
        *ptr++ = 0;
        n--;
    }

    return K_AEABI_OP_DONE;
}

int AeabiMemclr8(void* dest, size_t n)
{
    if (dest == nullptr || n == 0) {
        return K_AEABI_OP_SKIPPED;
    }

    unsigned char* ptr = static_cast<unsigned char*>(dest);

    while (n > 0 && (reinterpret_cast<uintptr_t>(ptr) & K_ALIGN_MASK64)) {
        *ptr++ = 0;
        n--;
    }

    unsigned long long* alignedPtr = reinterpret_cast<unsigned long long*>(ptr);
    while (n >= K_WORD_BYTES64) {
        *alignedPtr++ = 0;
        n -= K_WORD_BYTES64;
    }

    ptr = reinterpret_cast<unsigned char*>(alignedPtr);
    while (n > 0) {
        *ptr++ = 0;
        n--;
    }

    return K_AEABI_OP_DONE;
}

#ifdef __cplusplus
}
#endif

void Memclr0100(void)
{
    char dest[] = "AeabiMemclr";
    if (AeabiMemclr(dest, sizeof(dest)) == K_AEABI_OP_SKIPPED) {
        t_error("%s AeabiMemclr", __func__);
    }
    if (dest[0] != '\0' || dest[sizeof(dest) - 1] != '\0') {
        t_error("%s AeabiMemclr content check failed", __func__);
    }
}

/**
 * @tc.name      : memclr_0200S
 * @tc.desc      : test AeabiMemclr4 method
 * @tc.level     : Level 1
 */
void Memclr0200(void)
{
    char dest[] = "AeabiMemclr";
    if (AeabiMemclr4(dest, sizeof(dest)) == K_AEABI_OP_SKIPPED) {
        t_error("%s AeabiMemclr4", __func__);
    }
    if (dest[0] != '\0' || dest[sizeof(dest) - 1] != '\0') {
        t_error("%s AeabiMemclr4 content check failed", __func__);
    }
}

/**
 * @tc.name      : Memclr0300
 * @tc.desc      : test AeabiMemclr8 method
 * @tc.level     : Level 1
 */
void Memclr0300(void)
{
    char dest[] = "AeabiMemclr";
    if (AeabiMemclr8(dest, sizeof(dest)) == K_AEABI_OP_SKIPPED) {
        t_error("%s AeabiMemclr8", __func__);
    }
    if (dest[0] != '\0' || dest[sizeof(dest) - 1] != '\0') {
        t_error("%s AeabiMemclr8 content check failed", __func__);
    }
}

int AeabiMemclrTest()
{
    Memclr0100();
    Memclr0200();
    Memclr0300();
    return T_STATUS;
}
