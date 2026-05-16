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

static struct FFf t[] = {
#include "sanity/modff.h"
#include "special/modff.h"
};

static void PrintModffMismatch(const struct FFf* p, float y, float yi, float d, float di)
{
    printf("%s:%d: %s modff(%a) want %a,%a got %a,%a, ulperr %.3f = %.3f + %.3f, %.3f = %.3f + %.3f\n",
           p->file,
           p->line,
           Rstr(p->r),
           p->x,
           p->y,
           p->y2,
           static_cast<double>(y),
           static_cast<double>(yi),
           static_cast<double>(d),
           d - p->dy,
           p->dy,
           di,
           di - p->dy2,
           p->dy2);
}

static int ModffTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    float y;
    float yi;
    float d;
    float di;
    int e;
    int i;
    int err = 0;
    struct FFf* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;
        if (p->r < 0) {
            continue;
        }
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = modff(p->x, &yi);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
        if (!Checkexceptall(e | INEXACT, p->e | INEXACT, p->r)) {
            printf("%s:%d: bad fp exception: %s modff(%a)=%a,%a, want %s",
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
        d = Ulperr(y, p->y, p->dy);
        di = Ulperr(yi, p->y2, p->dy2);
        if (!Checkcr(y, p->y, p->r) || !Checkcr(yi, p->y2, p->r)) {
            PrintModffMismatch(p, y, yi, d, di);
            err++;
        }
    }
    return !!err;
}

int ModffTest(void)
{
    return ModffTestImpl();
}
