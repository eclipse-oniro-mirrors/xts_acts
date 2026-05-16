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

static struct DDi t[] = {
#include "sanity/lgamma_r.h"
#include "special/lgamma_r.h"

};

static bool HasLgammaRSignMismatch(const struct DDi* p, int sign)
{
    return !isnan(p->x) && p->x != -INF && !(p->e & DIVBYZERO) && sign != p->i;
}

static void PrintLgammaRMismatch(const struct DDi* p, double y, int sign, float d)
{
    printf("%s:%d: %s lgamma_r(%a) want %a,%lld got %a,%d ulperr %.3f = %.3f + %.3f\n",
           p->file,
           p->line,
           Rstr(p->r),
           p->x,
           p->y,
           p->i,
           static_cast<double>(y),
           sign,
           d,
           static_cast<double>(d - p->dy),
           p->dy);
}

static int LgammaRTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    int yi;
    double y;
    float d;
    int e;
    int i;
    int bad;
    int err = 0;
    struct DDi* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;
        if (p->r < 0) {
            continue;
        }
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = lgamma_r(p->x, &yi);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
        if (!Checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s lgamma_r(%a)=%a,%lld, want %s",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->y,
                   p->i,
                   Estr(p->e));
            printf(" got %s\n", Estr(e));
            err++;
        }
        d = Ulperr(y, p->y, p->dy);
        bad = HasLgammaRSignMismatch(p, yi);
        if (bad || !Checkulp(d, p->r)) {
            if (!bad && fabsf(d) < 11.0f) {
                printf("X ");
            } else {
                err++;
            }
            PrintLgammaRMismatch(p, y, yi, d);
        }
    }
    return !!err;
}

int LgammaRTest(void)
{
    return LgammaRTestImpl();
}

