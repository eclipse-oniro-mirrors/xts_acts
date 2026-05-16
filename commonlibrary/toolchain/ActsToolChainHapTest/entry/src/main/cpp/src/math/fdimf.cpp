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

#include <cstdint>
#include <cstdio>
#include "mtest.h"

static ffF t[] = {
#include "sanity/fdimf.h"
#include "special/fdimf.h"

};

static int FdimfTest_impl(void)
{
    #pragma STDC FENV_ACCESS ON
    float y;
    float d;
    int e;
    int i;
    int err = 0;
    ffF *p;

    for (i = 0; i < sizeof t/sizeof *t; i++) {
        p = t + i;

        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = fdimf(p->x, p->x2);
        e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
#ifndef __aarch64__
        if (!checkexceptall(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s fdimf(%a,%a)=%a, want %s",
                   p->file, p->line, rstr(p->r), p->x, p->x2, p->y, estr(p->e));
            printf(" got %s\n", estr(e));
            err++;
        }
#endif
        d = ulperrf(y, p->y, p->dy);
        if (!checkcr(y, p->y, p->r)) {
            printf("%s:%d: %s fdimf(%a,%a) want %a got %a ulperr %.3f = %a + %a\n",
                   p->file, p->line, rstr(p->r), p->x, p->x2, p->y, y, d, d-p->dy, p->dy);
            err++;
        }
    }
    return !!err;
}

int FdimfTest(void)
{
    return FdimfTest_impl();
}
