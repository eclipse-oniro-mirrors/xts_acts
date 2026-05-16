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

#include "mtest.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

enum {
    MTEST_FLOAT_MANT_BITS = 23,
    MTEST_FLOAT_EXP_MASK = 0xff,
    MTEST_FLOAT_EXP_BIAS = 0x7f,
    MTEST_DOUBLE_MANT_BITS = 52,
    MTEST_DOUBLE_EXP_MASK = 0x7ff,
    MTEST_DOUBLE_EXP_BIAS = 0x3ff,
    MTEST_LDBL_EXP_MASK = 0x7fff,
    MTEST_LDBL_EXP_BIAS = 0x3fff,
    MTEST_LDBL64_MANT_BITS = 63,
    MTEST_LDBL113_MANT_BITS = 112,
    MTEST_ESTR_BUF_SIZE = 256,
};

int Eulpf(float x)
{
    union {
        float f;
        uint32_t i;
    } u = { x };
    int e = (u.i >> MTEST_FLOAT_MANT_BITS) & MTEST_FLOAT_EXP_MASK;

    if (!e) {
        e++;
    }
    return e - MTEST_FLOAT_EXP_BIAS - MTEST_FLOAT_MANT_BITS;
}

int Eulp(double x)
{
    union {
        double f;
        uint64_t i;
    } u = { x };
    int e = (u.i >> MTEST_DOUBLE_MANT_BITS) & MTEST_DOUBLE_EXP_MASK;

    if (!e) {
        e++;
    }
    return e - MTEST_DOUBLE_EXP_BIAS - MTEST_DOUBLE_MANT_BITS;
}

int Eulpl(long double x)
{
#if LDBL_MANT_DIG == 53
    return Eulp(x);
#elif LDBL_MANT_DIG == 64
    union {
        long double f;
        struct {
            uint64_t m;
            uint16_t e;
            uint16_t pad;
        } i;
    } u = { x };
    int e = u.i.e & MTEST_LDBL_EXP_MASK;

    if (!e) {
        e++;
    }
    return e - MTEST_LDBL_EXP_BIAS - MTEST_LDBL64_MANT_BITS;
#elif LDBL_MANT_DIG == 113
    union {
        long double f;
        struct {
            uint64_t lo;
            uint32_t mid;
            uint16_t top;
            uint16_t se;
        } i;
    } u = { x };
    int e = u.i.se & MTEST_LDBL_EXP_MASK;

    if (!e) {
        e++;
    }
    return e - MTEST_LDBL_EXP_BIAS - MTEST_LDBL113_MANT_BITS;

#else
    // fallback for unsupported long double mantissa layouts
    return 0;
#endif
}

float Ulperrf(float got, float want, float dwant)
{
    const float kHalfForInfScaling = 1.0f / 2.0f;
    if (isnan(got) && isnan(want)) {
        return 0;
    }
    if (got == want) {
        if (signbit(got) == signbit(want)) {
            return dwant;
        }
        return INF;
    }
    if (isinf(got)) {
        got = copysignf(0x1p127, got);
        want *= kHalfForInfScaling;
    }
    return scalbn(got - want, -Eulpf(want)) + dwant;
}

float Ulperr(double got, double want, float dwant)
{
    const double kHalfForInfScaling = 1.0 / 2.0;
    if (isnan(got) && isnan(want)) {
        return 0;
    }
    if (got == want) {
        if (signbit(got) == signbit(want)) {
            return dwant;
        }
        return INF; // treat 0 sign errors badly
    }
    if (isinf(got)) {
        got = copysign(0x1p1023, got);
        want *= kHalfForInfScaling;
    }
    return scalbn(got - want, -Eulp(want)) + dwant;
}

float Ulperrl(long double got, long double want, float dwant)
{
#if LDBL_MANT_DIG == 53
    return Ulperr(got, want, dwant);
#elif LDBL_MANT_DIG == 64 || LDBL_MANT_DIG == 113
    const long double kHalfForInfScaling = 1.0L / 2.0L;
    if (isnan(got) && isnan(want)) {
        return 0;
    }
    if (got == want) {
        if (signbit(got) == signbit(want)) {
            return dwant;
        }
        return INF;
    }
    if (isinf(got)) {
        got = copysignl(0x1p16383L, got);
        want *= kHalfForInfScaling;
    }
    return scalbnl(got - want, -Eulpl(want)) + dwant;
#else
    // fallback for unsupported long double mantissa layouts
    return INF;
#endif
}

static struct {
    int flag;
    char* s;
} g_eflags[] = {
    { INEXACT, "INEXACT" },     { INVALID, "INVALID" },   { DIVBYZERO, "DIVBYZERO" },
    { UNDERFLOW, "UNDERFLOW" }, { OVERFLOW, "OVERFLOW" },
};

static int EflagsLength(void)
{
    return (int)(sizeof(g_eflags) / sizeof(g_eflags[0]));
}

char* Estr(int f)
{
    static char buf[MTEST_ESTR_BUF_SIZE];
    char* p = buf;
    int i;
    int all = 0;

    for (i = 0; i < EflagsLength(); i++) {
        if (f & g_eflags[i].flag) {
            size_t rem = (size_t)(buf + MTEST_ESTR_BUF_SIZE - p);
            if (rem == 0U) {
                return buf;
            }
            (void)snprintf(p, rem, "%s%s", all ? "|" : "", g_eflags[i].s);
            p += strlen(p);
            all |= g_eflags[i].flag;
        }
    }
    if (all != f) {
        size_t rem = (size_t)(buf + MTEST_ESTR_BUF_SIZE - p);
        if (rem == 0U) {
            return buf;
        }
        (void)snprintf(p, rem, "%s%d", all ? "|" : "", f & ~all);
        p += strlen(p);
        all = f;
    }
    {
        size_t rem = (size_t)(buf + MTEST_ESTR_BUF_SIZE - p);
        if (rem > 0U) {
            (void)snprintf(p, rem, "%s", all ? "" : "0");
        }
    }
    return buf;
}

char* Rstr(int r)
{
    switch (r) {
        case ROUND_TO_NEAREST:
            return "ROUND_TO_NEAREST";
#ifdef FE_TOWARDZERO
        case RZ:
            return "RZ";
#endif
#ifdef FE_UPWARD
        case RU:
            return "RU";
#endif
#ifdef FE_DOWNWARD
        case RD:
            return "RD";
#endif
    }
    return "R?";
}
