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

static struct DD t[] = {
#include "crlibm/sinh.h"
#include "sanity/sinh.h"
#include "special/sinh.h"
#include "ucb/sinh.h"

};

#ifndef __aarch64__
static int ReportSinhExcept(const struct DD* p, int e)
{
    if (Checkexcept(e, p->e, p->r)) {
        return 0;
    }
    printf("%s:%d: bad fp exception: %s sinh(%a)=%a, want %s",
           p->file,
           p->line,
           Rstr(p->r),
           p->x,
           p->y,
           Estr(p->e));
    printf(" got %s\n", Estr(e));
    return 1;
}
#endif

static int ReportSinhUlp(const struct DD* p, double y, float d)
{
    if (Checkulp(d, p->r)) {
        return 0;
    }
    if (fabsf(d) < 2.0f || p->r != ROUND_TO_NEAREST) {
        printf("X ");
    } else {
        return 1;
    }
    printf("%s:%d: %s sinh(%a) want %a got %a ulperr %.3f = %.3f + %.3f\n",
           p->file,
           p->line,
           Rstr(p->r),
           p->x,
           p->y,
           y,
           d,
           d - p->dy,
           p->dy);
    return 0;
}

static int SinhTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    double y;
    float d;
    int e;
    int i;
    int err = 0;
    struct DD* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;

        if (p->r < 0) {
            continue;
        }
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = sinh(p->x);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);

#ifndef __aarch64__
        err += ReportSinhExcept(p, e);
#endif
        d = Ulperr(y, p->y, p->dy);
        err += ReportSinhUlp(p, y, d);
    }
    return !!err;
}

int SinhTest(void)
{
    return SinhTestImpl();
}
