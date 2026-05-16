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

static struct FiF t[] = {
#include "../../include/sanity/ynf.h"
#include "../../include/special/ynf.h"
};

static void PrintYnfMismatch(const struct FiF* p, double y, float d)
{
    printf("%s:%d: %s ynf(%lld, %a) want %a got %a, ulperr %.3f = %.3f + %.3f\n",
           p->file,
           p->line,
           Rstr(p->r),
           p->i,
           p->x,
           p->y,
           y,
           d,
           static_cast<double>(d - p->dy),
           p->dy);
}

static int YnfTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    double y;
    float d;
    int e;
    int i;
    int bad;
    int err = 0;
    struct FiF* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;

        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = ynf(p->i, p->x);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
#ifndef __aarch64__
        if (!Checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s ynf(%lld, %a)=%a, want %s",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->i,
                   p->x,
                   p->y,
                   Estr(p->e));
            printf(" got %s\n", Estr(e));
            err++;
        }
#endif
        d = Ulperrf(y, p->y, p->dy);
        bad = p->x < 0 && !isnan(y) && y != -INF;
        if (bad || (!(p->x < 0) && !Checkulp(d, p->r))) {
            if (!bad && fabsf(d) < 2.5f)
                printf("X ");
            else
                err++;
            PrintYnfMismatch(p, y, d);
        }
    }
    return !!err;
}

int YnfTest(void)
{
    return YnfTestImpl();
}
