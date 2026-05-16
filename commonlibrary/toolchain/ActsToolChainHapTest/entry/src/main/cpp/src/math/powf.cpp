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

static struct FfF t[] = {
#include "sanity/powf.h"
#include "special/powf.h"
#include "ucb/powf.h"

};

#ifndef __aarch64__
static int ReportPowfExcept(const struct FfF* p, int e, float y)
{
    if (Checkexcept(e, p->e, p->r)) {
        return 0;
    }
    if (fabsf(y) < 0x1p-126f && (e | INEXACT) == (INEXACT | UNDERFLOW)) {
        printf("X ");
    } else {
        return 1;
    }
    printf("%s:%d: bad fp exception: %s powf(%a,%a)=%a, want %s",
           p->file,
           p->line,
           Rstr(p->r),
           p->x,
           p->x2,
           p->y,
           Estr(p->e));
    printf(" got %s\n", Estr(e));
    return 0;
}
#endif

static int ReportPowfUlp(const struct FfF* p, float y, float d)
{
    if (Checkulp(d, p->r)) {
        return 0;
    }
    printf("%s:%d: %s powf(%a,%a) want %a got %a ulperr %.3f = %.3f + %.3f\n",
           p->file,
           p->line,
           Rstr(p->r),
           p->x,
           p->x2,
           p->y,
           static_cast<double>(y),
           d,
           d - p->dy,
           p->dy);
    return 1;
}

static int PowfTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    float y;
    float d;
    int e;
    int i;
    int err = 0;
    struct FfF* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;
        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = powf(p->x, p->x2);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
#ifndef __aarch64__
        err += ReportPowfExcept(p, e, y);
#endif
        d = Ulperrf(y, p->y, p->dy);
        err += ReportPowfUlp(p, y, d);
    }
    return !!err;
}

int PowfTest(void)
{
    return PowfTestImpl();
}
