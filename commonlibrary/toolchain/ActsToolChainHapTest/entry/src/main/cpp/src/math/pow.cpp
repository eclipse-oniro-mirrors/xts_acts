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

static struct DdD t[] = {
#include "../../include/crlibm/pow.h"
#include "ucb/pow.h"
#include "../../include/sanity/pow.h"
#include "../../include/special/pow.h"
};

static int PowTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    double y;
    float d;
    int e;
    int i;
    int err = 0;
    struct DdD *p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;

        if (p->r < 0) {
            continue;
        }
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = pow(p->x, p->x2);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
        if (!Checkexcept(e, p->e, p->r)) {
            if (fabs(y) < 0x1p-1022 && (e | INEXACT) == (INEXACT | UNDERFLOW)) {
                printf("X ");
            } else {
                err++;
            }
            printf("%s:%d: bad fp exception: %s pow(%a,%a)=%a, want %s",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->x2,
                   p->y,
                   Estr(p->e));
            printf(" got %s\n", Estr(e));
        }
        d = Ulperr(y, p->y, p->dy);
        if (!Checkulp(d, p->r)) {
            printf("%s:%d: %s pow(%a,%a) want %a got %a ulperr %.3f = %.3f + %.3f\n",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->x2,
                   p->y,
                   (double)y,
                   (double)d,
                   (double)(d - p->dy),
                   p->dy);
            err++;
        }
    }
    return !!err;
}

int PowTest(void)
{
    return PowTestImpl();
}
