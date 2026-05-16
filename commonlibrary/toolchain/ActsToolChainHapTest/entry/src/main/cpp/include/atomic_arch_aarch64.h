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

#ifndef ATOMIC_ARCH_AARCH64_H_H
#define ATOMIC_ARCH_AARCH64_H_H

#define A_LL A_LL
static inline int A_LL(volatile int* p)
{
    int v;
    __asm__ __volatile__("ldaxr %w0,%1" : "=r"(v) : "q"(*p));
    return v;
}

#define A_LDAR A_LDAR
static inline int A_LDAR(volatile int* p)
{
    int v;
    __asm__ __volatile__("ldar %w0,%1" : "=r"(v) : "q"(*p));
    return v;
}

#define A_SC A_SC
static inline int A_SC(volatile int* p, int v)
{
    int r;
    __asm__ __volatile__("stlxr %w0,%w2,%1" : "=&r"(r), "=q"(*p) : "r"(v) : "memory");
    return !r;
}

#define A_BARRIER A_BARRIER
static inline void A_BARRIER()
{
    __asm__ __volatile__("dmb ish" : : : "memory");
}

#define A_CAS A_CAS
static inline int A_CAS(volatile int* p, int t, int s)
{
    int old;
    do {
        old = A_LL(p);
        if (old != t) {
            A_BARRIER();
            break;
        }
    } while (!A_SC(p, s));
    return old;
}

#define A_LL_P A_LL_P
static inline void* A_LL_P(volatile void* p)
{
    void* v;
    __asm__ __volatile__("ldaxr %0, %1" : "=r"(v) : "q"(*(void* volatile*)p));
    return v;
}

#define A_SC_P A_SC_P
static inline int A_SC_P(volatile int* p, void* v)
{
    int r;
    __asm__ __volatile__("stlxr %w0,%2,%1" : "=&r"(r), "=q"(*(void* volatile*)p) : "r"(v) : "memory");
    return !r;
}

#define A_CAS_P A_CAS_P
static inline void* A_CAS_P(volatile void* p, void* t, void* s)
{
    void* old;
    do {
        old = A_LL_P(p);
        if (old != t) {
            A_BARRIER();
            break;
        }
    } while (!A_SC_P(p, s));
    return old;
}

#define A_CTZ_64 A_CTZ_64
static inline int A_CTZ_64(uint64_t x)
{
    __asm__(
        "	rbit %0, %1\n"
        "	clz %0, %0\n"
        : "=r"(x)
        : "r"(x));
    return x;
}

#define A_CLZ64 A_CLZ64
static inline int A_CLZ64(uint64_t x)
{
    __asm__("clz %0, %1" : "=r"(x) : "r"(x));
    return x;
}

#endif // ATOMIC_ARCH_AARCH64_H_H
