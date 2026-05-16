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

#ifndef ATOMIC_H
#define ATOMIC_H

#include <stdint.h>

#include "atomic_arch.h"

#ifndef ATOMIC_BIT_SHIFT_CONSTANTS
#define ATOMIC_BIT_SHIFT_CONSTANTS
#define ATOMIC_K_SHIFT32 32
#define ATOMIC_K_SHIFT31 31
#define ATOMIC_K_SHIFT27 27
#define ATOMIC_K_SHIFT58 58
#define ATOMIC_K_SHIFT16 16
#define ATOMIC_K_SHIFT8 8
#define ATOMIC_K_SHIFT4 4
#define ATOMIC_K_SHIFT2 2
#define ATOMIC_K_SHIFT1 1
#endif

#ifdef A_LL

#ifndef a_pre_llsc
static inline void a_pre_llsc(void) {}
#endif

#ifndef a_post_llsc
static inline void a_post_llsc(void) {}
#endif

#ifndef A_CAS
#define A_CAS A_CAS
static inline int A_CAS(volatile int* p, int t, int s)
{
    int old;
    a_pre_llsc();
    do {
        old = A_LL(p);
    } while (old == t && !A_SC(p, s));
    a_post_llsc();
    return old;
}
#endif

#ifndef A_SWAP
#define A_SWAP A_SWAP
static inline int A_SWAP(volatile int* p, int v)
{
    int old;
    a_pre_llsc();
    do {
        old = A_LL(p);
    } while (!A_SC(p, v));
    a_post_llsc();
    return old;
}
#endif

#ifndef A_FETCH_ADD
#define A_FETCH_ADD A_FETCH_ADD
static inline int A_FETCH_ADD(volatile int* p, int v)
{
    int old;
    a_pre_llsc();
    do {
        old = A_LL(p);
    } while (!A_SC(p, (unsigned)old + v));
    a_post_llsc();
    return old;
}
#endif

#ifndef A_FETCH_AND
#define A_FETCH_AND A_FETCH_AND
static inline int A_FETCH_AND(volatile int* p, int v)
{
    int old;
    a_pre_llsc();
    do {
        old = A_LL(p);
    } while (!A_SC(p, old & v));
    a_post_llsc();
    return old;
}
#endif

#ifndef A_FETCH_OR
#define A_FETCH_OR A_FETCH_OR
static inline int A_FETCH_OR(volatile int* p, int v)
{
    int old;
    a_pre_llsc();
    do {
        old = A_LL(p);
    } while (!A_SC(p, old | v));
    a_post_llsc();
    return old;
}
#endif

#endif

#ifdef A_LL_P

#ifndef A_CAS_P
#define A_CAS_P A_CAS_P
static inline void* A_CAS_P(volatile void* p, void* t, void* s)
{
    void* old;
    a_pre_llsc();
    do {
        old = A_LL_P(p);
    } while (old == t && !A_SC_P(p, s));
    a_post_llsc();
    return old;
}
#endif

#endif

#ifndef A_CAS
#error missing definition of A_CAS
#endif

#ifndef A_SWAP
#define A_SWAP A_SWAP
static inline int A_SWAP(volatile int* p, int v)
{
    int old;
    do {
        old = *p;
    } while (A_CAS(p, old, v) != old);
    return old;
}
#endif

#ifndef A_FETCH_ADD
#define A_FETCH_ADD A_FETCH_ADD
static inline int A_FETCH_ADD(volatile int* p, int v)
{
    int old;
    do {
        old = *p;
    } while (A_CAS(p, old, (unsigned)old + v) != old);
    return old;
}
#endif

#ifndef A_FETCH_AND
#define A_FETCH_AND A_FETCH_AND
static inline int A_FETCH_AND(volatile int* p, int v)
{
    int old;
    do {
        old = *p;
    } while (A_CAS(p, old, old & v) != old);
    return old;
}
#endif
#ifndef A_FETCH_OR
#define A_FETCH_OR A_FETCH_OR
static inline int A_FETCH_OR(volatile int* p, int v)
{
    int old;
    do {
        old = *p;
    } while (A_CAS(p, old, old | v) != old);
    return old;
}
#endif

#ifndef A_AND
#define A_AND A_AND
static inline void A_AND(volatile int* p, int v)
{
    A_FETCH_AND(p, v);
}
#endif

#ifndef A_OR
#define A_OR A_OR
static inline void A_OR(volatile int* p, int v)
{
    A_FETCH_OR(p, v);
}
#endif

#ifndef A_INC
#define A_INC A_INC
static inline void A_INC(volatile int* p)
{
    A_FETCH_ADD(p, 1);
}
#endif

#ifndef A_DEC
#define A_DEC A_DEC
static inline void A_DEC(volatile int* p)
{
    A_FETCH_ADD(p, -1);
}
#endif

#ifndef A_STORE
#define A_STORE A_STORE
#ifdef ENABLE_HWASAN
__attribute__((no_sanitize("hwaddress")))
#endif
static inline void
    A_STORE(volatile int* p, int v)
{
#ifdef A_BARRIER
    A_BARRIER();
    *p = v;
    A_BARRIER();
#else
    A_SWAP(p, v);
#endif
}
#endif

#ifndef A_BARRIER
#define A_BARRIER A_BARRIER
static inline void A_BARRIER()
{
    volatile int tmp = 0;
    A_CAS(&tmp, 0, 0);
}
#endif

#ifndef A_SPIN
#define A_SPIN A_BARRIER
#endif

#ifndef A_AND64
#define A_AND64 A_AND64
static inline void A_AND64(volatile uint64_t* p, uint64_t v)
{
    union {
        uint64_t v;
        uint32_t r[2];
    } u = { v };
    if (u.r[0] + 1) {
        A_AND((int*)p, u.r[0]);
    }
    if (u.r[1] + 1) {
        A_AND((int*)p + 1, u.r[1]);
    }
}
#endif

#ifndef A_OR64
#define A_OR64 A_OR64
static inline void A_OR64(volatile uint64_t* p, uint64_t v)
{
    union {
        uint64_t v;
        uint32_t r[2];
    } u = { v };
    if (u.r[0]) {
        A_OR((int*)p, u.r[0]);
    }
    if (u.r[1]) {
        A_OR((int*)p + 1, u.r[1]);
    }
}
#endif

#ifndef A_CAS_P
typedef char a_cas_p_undefined_but_pointer_not_32bit[-sizeof(char) == 0xffffffff ? 1 : -1];
#define A_CAS_P A_CAS_P
static inline void* A_CAS_P(volatile void* p, void* t, void* s)
{
    return (void*)A_CAS((volatile int*)p, (int)t, (int)s);
}
#endif

#ifndef A_OR_L
#define A_OR_L A_OR_L
static inline void A_OR_L(volatile void* p, long v)
{
    // C++ does not allow implicit conversion from `void*` to typed pointers.
    // The original musl implementation assumes C-style implicit conversions.
    if (sizeof(long) == sizeof(int)) {
        A_OR((volatile int*)p, (int)v);
    } else {
        A_OR64((volatile uint64_t*)p, (uint64_t)v);
    }
}
#endif

#ifndef A_CRASH
#define A_CRASH A_CRASH
static inline void A_CRASH()
{
    *(volatile char*)0 = 0;
}
#endif

#ifndef A_CTZ32
#define A_CTZ32 A_CTZ32
static inline int A_CTZ32(uint32_t x)
{
#ifdef A_CLZ32
    return ATOMIC_K_SHIFT31 - A_CLZ32(x & -x);
#else
    static const char debruijn32[32] = { 0,  1,  23, 2,  29, 24, 19, 3,  30, 27, 25, 11, 20, 8, 4,  13,
                                         31, 22, 28, 18, 26, 10, 7,  12, 21, 17, 9,  6,  16, 5, 15, 14 };
    return debruijn32[((x & -x) * 0x076be629) >> ATOMIC_K_SHIFT27];
#endif
}
#endif

#ifndef A_CTZ_64
#define A_CTZ_64 A_CTZ_64
static inline int A_Ctz64DeBruijn(uint64_t x)
{
    static const char debruijn64[64] = { 0,  1,  2,  53, 3,  7,  54, 27, 4,  38, 41, 8,  34, 55, 48, 28,
                                         62, 5,  39, 46, 44, 42, 22, 9,  24, 35, 59, 56, 49, 18, 29, 11,
                                         63, 52, 6,  26, 37, 40, 33, 47, 61, 45, 43, 21, 23, 58, 17, 10,
                                         51, 25, 36, 32, 60, 20, 57, 16, 50, 31, 19, 15, 30, 14, 13, 12 };
    return debruijn64[((x & -x) * 0x022fdd63cc95386dull) >> ATOMIC_K_SHIFT58];
}

static inline int A_CTZ_64(uint64_t x)
{
    if (sizeof(long) < sizeof(uint64_t)) {
        uint32_t y = x;
        if (!y) {
            y = x >> ATOMIC_K_SHIFT32;
            return ATOMIC_K_SHIFT32 + A_CTZ32(y);
        }
        return A_CTZ32(y);
    }
    return A_Ctz64DeBruijn(x);
}
#endif

static inline int ACtzL(unsigned long x)
{
    return (sizeof(long) < sizeof(uint64_t)) ? A_CTZ32(x) : A_CTZ_64(x);
}

#ifndef A_CLZ64
#define A_CLZ64 A_CLZ64
static inline int A_Clz64BitScanFallback(uint64_t x)
{
    uint32_t y;
    int r;
    static const int kProbeShift8 = ATOMIC_K_SHIFT32 - ATOMIC_K_SHIFT8;
    static const int kProbeShift4 = ATOMIC_K_SHIFT32 - ATOMIC_K_SHIFT4;
    static const int kProbeShift2 = ATOMIC_K_SHIFT32 - ATOMIC_K_SHIFT2;
    static const int kProbeShift1 = ATOMIC_K_SHIFT31;
    if (x >> ATOMIC_K_SHIFT32) {
        y = x >> ATOMIC_K_SHIFT32;
        r = 0;
    } else {
        y = x;
        r = ATOMIC_K_SHIFT32;
    }
    if (!(y >> ATOMIC_K_SHIFT16)) {
        r |= ATOMIC_K_SHIFT16;
        y <<= ATOMIC_K_SHIFT16;
    }
    if (!(y >> kProbeShift8)) {
        r |= ATOMIC_K_SHIFT8;
        y <<= ATOMIC_K_SHIFT8;
    }
    if (!(y >> kProbeShift4)) {
        r |= ATOMIC_K_SHIFT4;
        y <<= ATOMIC_K_SHIFT4;
    }
    if (!(y >> kProbeShift2)) {
        r |= ATOMIC_K_SHIFT2;
        y <<= ATOMIC_K_SHIFT2;
    }
    return (!(y >> kProbeShift1)) ? (r | ATOMIC_K_SHIFT1) : r;
}

static inline int A_CLZ64(uint64_t x)
{
#ifdef A_CLZ32
    if (x >> ATOMIC_K_SHIFT32) {
        return A_CLZ32(x >> ATOMIC_K_SHIFT32);
    }
    return A_CLZ32(x) + ATOMIC_K_SHIFT32;
#else
    return A_Clz64BitScanFallback(x);
#endif
}
#endif

#ifndef A_CLZ32
#define A_CLZ32 A_CLZ32
static inline int A_CLZ32(uint32_t x)
{
    x >>= ATOMIC_K_SHIFT1;
    x |= x >> ATOMIC_K_SHIFT1;
    x |= x >> ATOMIC_K_SHIFT2;
    x |= x >> ATOMIC_K_SHIFT4;
    x |= x >> ATOMIC_K_SHIFT8;
    x |= x >> ATOMIC_K_SHIFT16;
    x++;
    return ATOMIC_K_SHIFT31 - A_CTZ32(x);
}
#endif

#endif
