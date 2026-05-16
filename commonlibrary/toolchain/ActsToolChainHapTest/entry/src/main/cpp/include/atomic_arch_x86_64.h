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

#ifndef ATOMIC_ARCH_X86_64_H_H
#define ATOMIC_ARCH_X86_64_H_H

#define A_CAS A_CAS
static inline int A_CAS(volatile int* p, int t, int s)
{
    __asm__ __volatile__("lock ; cmpxchg %3, %1" : "=a"(t), "=m"(*p) : "a"(t), "r"(s) : "memory");
    return t;
}

#define A_CAS_P A_CAS_P
static inline void* A_CAS_P(volatile void* p, void* t, void* s)
{
    __asm__("lock ; cmpxchg %3, %1" : "=a"(t), "=m"(*(void* volatile*)p) : "a"(t), "r"(s) : "memory");
    return t;
}

#define A_SWAP A_SWAP
static inline int A_SWAP(volatile int* p, int v)
{
    __asm__ __volatile__("xchg %0, %1" : "=r"(v), "=m"(*p) : "0"(v) : "memory");
    return v;
}

#define A_FETCH_ADD A_FETCH_ADD
static inline int A_FETCH_ADD(volatile int* p, int v)
{
    __asm__ __volatile__("lock ; xadd %0, %1" : "=r"(v), "=m"(*p) : "0"(v) : "memory");
    return v;
}

#define A_AND A_AND
static inline void A_AND(volatile int* p, int v)
{
    __asm__ __volatile__("lock ; and %1, %0" : "=m"(*p) : "r"(v) : "memory");
}

#define A_OR A_OR
static inline void A_OR(volatile int* p, int v)
{
    __asm__ __volatile__("lock ; or %1, %0" : "=m"(*p) : "r"(v) : "memory");
}

#define A_AND64 A_AND64
static inline void A_AND64(volatile uint64_t* p, uint64_t v)
{
    __asm__ __volatile("lock ; and %1, %0" : "=m"(*p) : "r"(v) : "memory");
}

#define A_OR64 A_OR64
static inline void A_OR64(volatile uint64_t* p, uint64_t v)
{
    __asm__ __volatile__("lock ; or %1, %0" : "=m"(*p) : "r"(v) : "memory");
}

#define A_INC A_INC
static inline void A_INC(volatile int* p)
{
    __asm__ __volatile__("lock ; incl %0" : "=m"(*p) : "m"(*p) : "memory");
}

#define A_DEC A_DEC
static inline void A_DEC(volatile int* p)
{
    __asm__ __volatile__("lock ; decl %0" : "=m"(*p) : "m"(*p) : "memory");
}

#define A_STORE A_STORE
static inline void A_STORE(volatile int* p, int x)
{
    __asm__ __volatile__("mov %1, %0 ; lock ; orl $0,(%%rsp)" : "=m"(*p) : "r"(x) : "memory");
}

#define A_BARRIER A_BARRIER
static inline void A_BARRIER()
{
    __asm__ __volatile__("" : : : "memory");
}

#define A_SPIN A_SPIN
static inline void A_SPIN()
{
    __asm__ __volatile__("pause" : : : "memory");
}

#define A_CRASH A_CRASH
static inline void A_CRASH()
{
    __asm__ __volatile__("hlt" : : : "memory");
}

#define A_CTZ_64 A_CTZ_64
static inline int A_CTZ_64(uint64_t x)
{
    __asm__("bsf %1,%0" : "=r"(x) : "r"(x));
    return x;
}

#define A_CLZ64 A_CLZ64
static inline int A_CLZ64(uint64_t x)
{
    __asm__("bsr %1,%0 ; xor $63,%0" : "=r"(x) : "r"(x));
    return x;
}

#endif // ATOMIC_ARCH_X86_64_H_H
