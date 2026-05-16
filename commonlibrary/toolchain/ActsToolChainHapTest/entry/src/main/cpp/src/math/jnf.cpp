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
#include "sanity/jnf.h"
#include "special/jnf.h"
};

static int JnfTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    double y;
    float d;
    int e;
    int i;
    int err = 0;
    struct FiF* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;

        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = jnf(p->i, p->x);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
        if (!Checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s jnf(%lld, %a)=%a, want %s",
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
        d = Ulperrf(y, p->y, p->dy);
        if (!Checkulp(d, p->r)) {
            if (fabsf(d) < 3.0f)
                printf("X ");
            else
                err++;
            printf("%s:%d: %s jnf(%lld, %a) want %a got %a, ulperr %.3f = %.3f + %.3f\n",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->i,
                   p->x,
                   p->y,
                   (double)y,
                   (double)d,
                   d - p->dy,
                   p->dy);
        }
    }
    return !!err;
}

int JnfTest(void)
{
    return JnfTestImpl();
}

