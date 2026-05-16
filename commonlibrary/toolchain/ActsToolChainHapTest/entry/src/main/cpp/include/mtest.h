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

#ifndef MTEST_H_H
#define MTEST_H_H

#include <fenv.h>
#include <float.h>
#include <math.h>

#undef ROUND_TO_NEAREST
#undef RZ
#undef RD
#undef RU
#ifdef FE_TONEAREST
#define ROUND_TO_NEAREST FE_TONEAREST
#else
#define ROUND_TO_NEAREST 0
#endif
#ifdef FE_TOWARDZERO
#define RZ FE_TOWARDZERO
#else
#define RZ -1
#endif
#ifdef FE_DOWNWARD
#define RD FE_DOWNWARD
#else
#define RD -1
#endif
#ifdef FE_UPWARD
#define RU FE_UPWARD
#else
#define RU -1
#endif

#undef INEXACT
#undef INVALID
#undef DIVBYZERO
#undef UNDERFLOW
#undef OVERFLOW
#ifdef FE_INEXACT
#define INEXACT FE_INEXACT
#else
#define INEXACT 0
#endif
#ifdef FE_INVALID
#define INVALID FE_INVALID
#else
#define INVALID 0
#endif
#ifdef FE_DIVBYZERO
#define DIVBYZERO FE_DIVBYZERO
#else
#define DIVBYZERO 0
#endif
#ifdef FE_UNDERFLOW
#define UNDERFLOW FE_UNDERFLOW
#else
#define UNDERFLOW 0
#endif
#ifdef FE_OVERFLOW
#define OVERFLOW FE_OVERFLOW
#else
#define OVERFLOW 0
#endif

#undef INF
#undef NAN
#define INF INFINITY
#define NAN (0.0f / 0.0f)

#define T(...) { __FILE__, __LINE__, __VA_ARGS__ },

#define POS     \
    char* file; \
    int line
struct DD {
    POS;
    int r;
    double x;
    double y;
    float dy;
    int e;
};
struct FF {
    POS;
    int r;
    float x;
    float y;
    float dy;
    int e;
};
struct LL {
    POS;
    int r;
    long double x;
    long double y;
    float dy;
    int e;
};
struct FfF {
    POS;
    int r;
    float x;
    float x2;
    float y;
    float dy;
    int e;
};
struct DdD {
    POS;
    int r;
    double x;
    double x2;
    double y;
    float dy;
    int e;
};
struct LlL {
    POS;
    int r;
    long double x;
    long double x2;
    long double y;
    float dy;
    int e;
};
struct DDi {
    POS;
    int r;
    double x;
    double y;
    float dy;
    long long i;
    int e;
};
struct FFi {
    POS;
    int r;
    float x;
    float y;
    float dy;
    long long i;
    int e;
};
struct LLi {
    POS;
    int r;
    long double x;
    long double y;
    float dy;
    long long i;
    int e;
};
struct DiD {
    POS;
    int r;
    double x;
    long long i;
    double y;
    float dy;
    int e;
};
struct FiF {
    POS;
    int r;
    float x;
    long long i;
    float y;
    float dy;
    int e;
};
struct LiL {
    POS;
    int r;
    long double x;
    long long i;
    long double y;
    float dy;
    int e;
};
struct DI {
    POS;
    int r;
    double x;
    long long i;
    int e;
};
struct FI {
    POS;
    int r;
    float x;
    long long i;
    int e;
};
struct LI {
    POS;
    int r;
    long double x;
    long long i;
    int e;
};
struct DDd {
    POS;
    int r;
    double x;
    double y;
    float dy;
    double y2;
    float dy2;
    int e;
};
struct FFf {
    POS;
    int r;
    float x;
    float y;
    float dy;
    float y2;
    float dy2;
    int e;
};
struct LLl {
    POS;
    int r;
    long double x;
    long double y;
    float dy;
    long double y2;
    float dy2;
    int e;
};
struct FfFi {
    POS;
    int r;
    float x;
    float x2;
    float y;
    float dy;
    long long i;
    int e;
};
struct DdDi {
    POS;
    int r;
    double x;
    double x2;
    double y;
    float dy;
    long long i;
    int e;
};
struct LlLi {
    POS;
    int r;
    long double x;
    long double x2;
    long double y;
    float dy;
    long long i;
    int e;
};
struct FffF {
    POS;
    int r;
    float x;
    float x2;
    float x3;
    float y;
    float dy;
    int e;
};
struct DddD {
    POS;
    int r;
    double x;
    double x2;
    double x3;
    double y;
    float dy;
    int e;
};
struct LllL {
    POS;
    int r;
    long double x;
    long double x2;
    long double x3;
    long double y;
    float dy;
    int e;
};
#undef POS

// Typedefs for lowercase struct names used in test files
typedef struct DD dD;
typedef struct FF fF;
typedef struct FfF ffF;

#ifdef __cplusplus
extern "C" {
#endif
char* Estr(int);
char* Rstr(int);
float Ulperr(double got, double want, float dwant);
float Ulperrf(float got, float want, float dwant);
float Ulperrl(long double got, long double want, float dwant);
#ifdef __cplusplus
}
#endif

// Macros for lowercase function names used in test files
#define estr Estr
#define rstr Rstr
#define ulperr Ulperr
#define ulperrf Ulperrf
#define ulperrl Ulperrl
#define checkexcept Checkexcept
#define checkexceptall Checkexceptall
#define checkulp Checkulp
#define checkcr Checkcr

static int Checkexcept(int got, int want, int r)
{
    if (r == ROUND_TO_NEAREST) {
#if defined CHECK_INEXACT
        return got == want;
#elif defined CHECK_INEXACT_OMISSION
        return got == want || got == (want | INEXACT);
#else
        return (got | INEXACT) == (want | INEXACT);
#endif
    }
    return (got | INEXACT | UNDERFLOW) == (want | INEXACT | UNDERFLOW);
}

static int Checkexceptall(int got, int want, int r)
{
    return got == want;
}

static int Checkulp(float d, int r)
{
    /* currently accept >1.5 ulp errors; target is 1.0 */
    const float kNearestModeUlpThreshold = 1.0f + 1.0f / 2.0f;
    const float kNonNearestModeUlpThreshold = 2.0f + 1.0f;
    if (r == ROUND_TO_NEAREST) {
        return fabsf(d) <= kNearestModeUlpThreshold;
    }
    /* accept larger error in non-nearest rounding mode */
    return fabsf(d) < kNonNearestModeUlpThreshold;
}

static int Checkcr(long double y, long double ywant, int r)
{
    if (isnan(ywant)) {
        return isnan(y);
    }
    return y == ywant && signbit(y) == signbit(ywant);
}

#endif // MTEST_H_H
