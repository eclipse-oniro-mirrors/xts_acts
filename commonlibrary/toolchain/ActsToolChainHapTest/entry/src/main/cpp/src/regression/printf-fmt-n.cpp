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
#include "libc_test_shim.h"

namespace {
using SnprintfFn = int (*)(char*, size_t, const char*, ...);

static constexpr int EXPECTED_SNPRINTF_LEN_AFTER = 258;
static constexpr int EXPECTED_SNPRINTF_LEN = 257;
static constexpr int INT_D_1 = 1;
static constexpr int INT_D_2 = 2;
static constexpr int INT_D_3 = 3;

struct PrintfFmtNContext {
    int* status;
    char* buf;
    size_t bufSize;
    int* retv;
    const char* label;
};

static void CheckPrintfFmtNCaseAfter(const PrintfFmtNContext& ctx)
{
    if (*ctx.retv != EXPECTED_SNPRINTF_LEN_AFTER) {
        LibcTestError(ctx.status, "%s: expected snprintf to write 258 chars, got %d\n", ctx.label, *ctx.retv);
    }
}

template <typename T> static void CheckPrintfFmtNVar(const PrintfFmtNContext& ctx, T* var)
{
    if (*var != EXPECTED_SNPRINTF_LEN) {
        LibcTestError(ctx.status, "%s: %%n format failed: wanted 257\n", ctx.label);
    }
}

static void CheckPrintfFmtNCase(const PrintfFmtNContext& ctx, int* var)
{
    SnprintfFn unsafeSnprintf = &std::snprintf;
    *ctx.retv = unsafeSnprintf(ctx.buf, ctx.bufSize, "%256d%d%n%d", INT_D_1, INT_D_2, var, INT_D_3);
    CheckPrintfFmtNCaseAfter(ctx);
    CheckPrintfFmtNVar(ctx, var);
}

// On LP64, intmax_t may be a typedef of long; keep one overload and select %ln vs %jn explicitly.
static void CheckPrintfFmtNCase(const PrintfFmtNContext& ctx, long* var, bool useJn)
{
    SnprintfFn unsafeSnprintf = &std::snprintf;
    if (useJn) {
        *ctx.retv = unsafeSnprintf(
            ctx.buf, ctx.bufSize, "%256d%d%jn%d", INT_D_1, INT_D_2, reinterpret_cast<intmax_t*>(var), INT_D_3);
    } else {
        *ctx.retv = unsafeSnprintf(ctx.buf, ctx.bufSize, "%256d%d%ln%d", INT_D_1, INT_D_2, var, INT_D_3);
    }
    CheckPrintfFmtNCaseAfter(ctx);
    CheckPrintfFmtNVar(ctx, var);
}

static void CheckPrintfFmtNCase(const PrintfFmtNContext& ctx, long long* var)
{
    SnprintfFn unsafeSnprintf = &std::snprintf;
    *ctx.retv = unsafeSnprintf(ctx.buf, ctx.bufSize, "%256d%d%lln%d", INT_D_1, INT_D_2, var, INT_D_3);
    CheckPrintfFmtNCaseAfter(ctx);
    CheckPrintfFmtNVar(ctx, var);
}

static void CheckPrintfFmtNCase(const PrintfFmtNContext& ctx, short* var)
{
    SnprintfFn unsafeSnprintf = &std::snprintf;
    *ctx.retv = unsafeSnprintf(ctx.buf, ctx.bufSize, "%256d%d%hn%d", INT_D_1, INT_D_2, var, INT_D_3);
    CheckPrintfFmtNCaseAfter(ctx);
    CheckPrintfFmtNVar(ctx, var);
}

static void CheckPrintfFmtNCase(const PrintfFmtNContext& ctx, size_t* var)
{
    SnprintfFn unsafeSnprintf = &std::snprintf;
    *ctx.retv = unsafeSnprintf(ctx.buf, ctx.bufSize, "%256d%d%zn%d", INT_D_1, INT_D_2, var, INT_D_3);
    CheckPrintfFmtNCaseAfter(ctx);
    CheckPrintfFmtNVar(ctx, var);
}

} // namespace

int PrintfFmtNTest()
{
    int status = SUCCESS_CODE;

    char buf[1024];
    int ret;
    int i;
    long l;
    long long ll;
    short h;
    size_t z;
    intmax_t j;
    const PrintfFmtNContext ctx = { &status, buf, sizeof(buf), &ret, "%n" };

    CheckPrintfFmtNCase(ctx, &i);
    CheckPrintfFmtNCase(ctx, &l, false);
    CheckPrintfFmtNCase(ctx, &ll);
    CheckPrintfFmtNCase(ctx, &h);
    CheckPrintfFmtNCase(ctx, &z);
    CheckPrintfFmtNCase(ctx, reinterpret_cast<long*>(&j), true);

    return status;
}
