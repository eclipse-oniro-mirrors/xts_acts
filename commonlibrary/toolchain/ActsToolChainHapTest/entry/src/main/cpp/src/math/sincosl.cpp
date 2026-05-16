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

#include <cstdint>
#include <cstdio>
#include "mtest.h"

static struct LLl t[] = {
#if LDBL_MANT_DIG == 53
#include "sanity/sincos.h"
#include "special/sincos.h"
#elif LDBL_MANT_DIG == 64
#include "sanity/sincosl.h"
#include "special/sincosl.h"
#endif
};

static void PrintSincoslMismatch(const struct LLl* p, long double ysin, long double ycos, float dsin, float dcos)
{
    printf("%s:%d: %s sincosl(%La) want %La,%La got %La,%La, ulperr %.3f = %.3f + %.3f, %.3f = %.3f + %.3f\n",
           p->file,
           p->line,
           Rstr(p->r),
           p->x,
           p->y,
           p->y2,
           static_cast<long double>(ysin),
           static_cast<long double>(ycos),
           static_cast<double>(dsin),
           static_cast<double>(dsin - p->dy),
           p->dy,
           dcos,
           static_cast<double>(dcos - p->dy2),
           p->dy2);
}

static int SincoslTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    long double ysin;
    long double ycos;
    float dsin;
    float dcos;
    int e;
    int i;
    int err = 0;
    struct LLl* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;
        if (p->r < 0) {
            continue;
        }
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        sincosl(p->x, &ysin, &ycos);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
        if (!Checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s sincosl(%La)=%La,%La, want %s",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->y,
                   p->y2,
                   Estr(p->e));
            printf(" got %s\n", Estr(e));
            err++;
        }
        dsin = Ulperr(ysin, p->y, p->dy);
        dcos = Ulperr(ycos, p->y2, p->dy2);
        if (!Checkulp(dsin, p->r) || !Checkulp(dcos, p->r)) {
            PrintSincoslMismatch(p, ysin, ycos, dsin, dcos);
            err++;
        }
    }
    return !!err;
}

int SincoslTest(void)
{
    return SincoslTestImpl();
}
