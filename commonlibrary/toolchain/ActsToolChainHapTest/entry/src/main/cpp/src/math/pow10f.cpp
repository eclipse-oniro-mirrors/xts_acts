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
#include <dlfcn.h>
#include "mtest.h"
static struct FF t[] = {
#include "sanity/pow10f.h"
#include "special/exp10f.h"

};

static int Pow10fTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    float y;
    float d;
    int e;
    int i;
    int err = 0;
    struct FF* p;

    typedef float (*Pow10fFunc)(float);
    Pow10fFunc pow10f = (Pow10fFunc)dlsym(RTLD_DEFAULT, "pow10f");

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;
        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = pow10f(p->x);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
        if (!Checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s pow10f(%a)=%a, want %s",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->y,
                   Estr(p->e));
            printf(" got %s\n", Estr(e));
            err++;
        }
        d = Ulperrf(y, p->y, p->dy);
        if (!Checkulp(d, p->r)) {
            printf("%s:%d: %s pow10f(%a) want %a got %a ulperr %.3f = %.3f + %.3f\n",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->y,
                   y,
                   d,
                   d - p->dy,
                   p->dy);
            err++;
        }
    }
    return !!err;
}

int Pow10fTest(void)
{
    return Pow10fTestImpl();
}

