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

static struct FI t[] = {
#include "sanity/ilogbf.h"
#include "special/ilogbf.h"

};

static void IlogbfTestOne(struct FI* p, int* err)
{
#pragma STDC FENV_ACCESS ON
    long long yi;
    int e;
    if (p->r < 0) {
        return;
    }
    fesetround(p->r);
    feclearexcept(FE_ALL_EXCEPT);
    yi = ilogbf(p->x);
    e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
#ifndef __aarch64__
    if (!Checkexcept(e, p->e, p->r)) {
        const double excX = static_cast<double>(p->x);
        printf("%s:%d: bad fp exception: %s ilogbf(%a)=%lld, want %s",
               p->file,
               p->line,
               Rstr(p->r),
               excX,
               p->i,
               Estr(p->e));
        printf(" got %s\n", Estr(e));
        (*err)++;
    }
#endif
    if (yi != p->i) {
        const double wantX = static_cast<double>(p->x);
        printf("%s:%d: %s ilogbf(%a) want %lld got %lld\n", p->file, p->line, Rstr(p->r), wantX, p->i, yi);
        (*err)++;
    }
}

static int IlogbfTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    int i;
    int err = 0;
    for (i = 0; i < sizeof t / sizeof *t; i++) {
        IlogbfTestOne(t + i, &err);
    }
    return !!err;
}

int IlogbfTest(void)
{
    return IlogbfTestImpl();
}
