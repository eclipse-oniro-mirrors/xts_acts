/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#define _DEFAULT_SOURCE 1
#define _BSD_SOURCE 1
#include <cstdint>
#include <cstdio>
#include "mtest.h"

static fF t[] = {
#include "sanity/y0f.h"
#include "special/y0f.h"

};

static int Y0fTest_impl(void)
{
    #pragma STDC FENV_ACCESS ON
    float y;
    float d;
    int e;
    int i;
    int bad;
    int err = 0;
    fF *p;

    for (i = 0; i < sizeof t/sizeof *t; i++) {
        p = t + i;

        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = y0f(p->x);
        e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
#ifndef __aarch64__
        if (!checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s y0f(%a)=%a, want %s",
                p->file, p->line, rstr(p->r), p->x, p->y, estr(p->e));
            printf(" got %s\n", estr(e));
            err++;
        }
#endif
        d = ulperrf(y, p->y, p->dy);
        bad = p->x < 0 && !isnan(y) && y != -INF;
        if (bad || (!(p->x < 0) && !checkulp(d, p->r))) {
            if (!bad && fabsf(d) < 0x1p23f)
                printf("X ");
            else
                err++;
            printf("%s:%d: %s y0f(%a) want %a got %a ulperr %.3f = %a + %a\n",
                   p->file, p->line, rstr(p->r), p->x, p->y, y, d, d-p->dy, p->dy);
        }
    }
    return !!err;
}

int Y0fTest(void)
{
    return Y0fTest_impl();
}
