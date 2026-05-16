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

#include <cmath>
#include "mtest.h"
#include "test.h"

enum { LESS, EQUAL, GREATER, UNORD };

namespace {
constexpr double K_POS_ZERO = 0.0;
constexpr double K_NEG_ZERO = -0.0;
constexpr float K_POS_ZEROF = 0.0f;
constexpr float K_NEG_ZEROF = -0.0f;
constexpr long double K_POS_ZERO_L = 0.0L;
constexpr long double K_NEG_ZERO_L = -0.0L;
constexpr double K_ONE = 1.0;
constexpr double K_ONE_POINT_ONE = 1.1;
constexpr float K_ONEF = 1.0f;
constexpr float K_ONE_POINT_ONEF = 1.1f;
constexpr long double K_ONE_L = 1.0L;
constexpr long double K_ONE_POINT_ONE_L = 1.1L;
constexpr int K_FLOAT_RELATION_SCALE = 2;
constexpr double K_QUARTER = 0.25;
constexpr float K_QUARTERF = 0.25f;
constexpr long double K_QUARTER_L = 0.25L;
constexpr double K_HALF = 0.5;
constexpr float K_HALFF = 0.5f;
constexpr long double K_HALF_L = 0.5L;
constexpr double K_TINY_FRAC9 = 0x1p-9;
constexpr double K_TINY_FRAC8 = 0x1p-8;
constexpr float K_TINY_FRAC9F = 0x1p-9f;
constexpr float K_TINY_FRAC8F = 0x1p-8f;
constexpr long double K_TINY_FRAC9_L = 0x1p-9L;
constexpr long double K_TINY_FRAC8_L = 0x1p-8L;
} // namespace

/* compare result only; skip fetestexcept — some OHOS targets report stale/spurious flags after
 * feclearexcept, causing false failures. */
static void CheckPredicateResult(const char* pred, int got, bool want)
{
    if ((got != 0) != want) {
        t_error("%s failed: got %d want %d\n", pred, got, static_cast<int>(want));
    }
}

/* __builtin_* avoids <cmath> macro/overload mismatch; cast to long double unifies mixed float ranks. */
static void CheckRelation(long double la, long double lb, int rel)
{
    feclearexcept(FE_ALL_EXCEPT);
    CheckPredicateResult("isunordered", __builtin_isunordered(la, lb), rel == UNORD);
    CheckPredicateResult("isless", __builtin_isless(la, lb), rel == LESS);
    CheckPredicateResult("islessequal", __builtin_islessequal(la, lb), rel == LESS || rel == EQUAL);
    CheckPredicateResult("islessgreater", __builtin_islessgreater(la, lb), rel == LESS || rel == GREATER);
    CheckPredicateResult("isgreater", __builtin_isgreater(la, lb), rel == GREATER);
    CheckPredicateResult("isgreaterequal", __builtin_isgreaterequal(la, lb), rel == GREATER || rel == EQUAL);
}

static void IslessTestNanUnordered(void)
{
    CheckRelation(NAN, K_ONE, UNORD);
    CheckRelation(K_ONE, NAN, UNORD);
    CheckRelation(NAN, NAN, UNORD);
    CheckRelation(NAN, NAN + K_ONE, UNORD);
    CheckRelation(NAN, NAN + K_ONE_L, UNORD);
}

static void IslessTestOrderedDouble(volatile double huge, volatile double tiny, volatile double eps)
{
    CheckRelation(K_ONE, K_ONE_POINT_ONE, LESS);
    CheckRelation(K_ONE, K_ONE + eps, LESS);
    CheckRelation(K_ONE + eps, K_ONE, GREATER);
    CheckRelation(huge - K_ONE, huge, EQUAL);
    CheckRelation(huge, huge * huge, LESS);
    CheckRelation(K_NEG_ZERO, K_POS_ZERO, EQUAL);
    CheckRelation(-tiny, K_POS_ZERO, LESS);
    CheckRelation(tiny, K_FLOAT_RELATION_SCALE * tiny, LESS);
    CheckRelation(tiny * K_TINY_FRAC9, tiny * K_TINY_FRAC8, LESS);
}

static void IslessTestOrderedFloat(volatile float hugef, volatile float tinyf, volatile float epsf)
{
    CheckRelation(K_ONEF, K_ONE_POINT_ONEF, LESS);
    CheckRelation(K_ONEF, K_ONEF + epsf, LESS);
    CheckRelation(K_ONEF + epsf, K_ONEF, GREATER);
    CheckRelation(hugef - K_ONEF, hugef, EQUAL);
    CheckRelation(hugef, hugef * hugef, LESS);
    CheckRelation(K_NEG_ZEROF, K_POS_ZEROF, EQUAL);
    CheckRelation(-tinyf, K_POS_ZEROF, LESS);
    CheckRelation(tinyf, K_FLOAT_RELATION_SCALE * tinyf, LESS);
    CheckRelation(tinyf * K_TINY_FRAC9F, tinyf * K_TINY_FRAC8F, LESS);
}

static void
    IslessTestOrderedLongDouble(volatile long double hugel, volatile long double tinyl, volatile long double epsl)
{
    CheckRelation(K_ONE_L, K_ONE_POINT_ONE_L, LESS);
    CheckRelation(K_ONE_L, K_ONE_L + epsl, LESS);
    CheckRelation(K_ONE_L + epsl, K_ONE_L, GREATER);
    CheckRelation(hugel - K_ONE_L, hugel, EQUAL);
    CheckRelation(hugel, hugel * hugel, LESS);
    CheckRelation(K_NEG_ZERO_L, K_POS_ZERO_L, EQUAL);
    CheckRelation(-tinyl, K_POS_ZERO_L, LESS);
    CheckRelation(tinyl, K_FLOAT_RELATION_SCALE * tinyl, LESS);
    CheckRelation(tinyl * K_TINY_FRAC9_L, tinyl * K_TINY_FRAC8_L, LESS);

    CheckRelation(hugel * hugel, hugel * hugel * K_FLOAT_RELATION_SCALE, EQUAL);
    CheckRelation(tinyl * tinyl * K_HALF_L, tinyl * tinyl, EQUAL);
    CheckRelation(-tinyl * tinyl, K_POS_ZERO_L, EQUAL);
    CheckRelation(K_ONE_L, K_ONE_L + epsl * K_QUARTER_L, EQUAL);
}

static void IslessTestFltEvalDouble(volatile double huge, volatile double tiny, volatile double eps)
{
#if FLT_EVAL_METHOD == 2
    CheckRelation(huge * huge, huge * huge * K_FLOAT_RELATION_SCALE, LESS);
    CheckRelation(tiny * tiny * K_HALF, tiny * tiny, LESS);
    CheckRelation(-tiny * tiny, K_POS_ZERO, LESS);
    CheckRelation(K_ONE, K_ONE + eps * K_QUARTER, LESS);
#else
    CheckRelation(huge * huge, huge * huge * K_FLOAT_RELATION_SCALE, EQUAL);
    CheckRelation(tiny * tiny * K_HALF, tiny * tiny, EQUAL);
    CheckRelation(-tiny * tiny, K_POS_ZERO, EQUAL);
    CheckRelation(K_ONE, K_ONE + eps * K_QUARTER, EQUAL);
#endif
}

static void IslessTestFltEvalFloat(volatile float hugef, volatile float tinyf, volatile float epsf)
{
#if FLT_EVAL_METHOD >= 1
    CheckRelation(hugef * hugef, hugef * hugef * K_FLOAT_RELATION_SCALE, LESS);
    CheckRelation(tinyf * tinyf * K_HALFF, tinyf * tinyf, LESS);
    CheckRelation(-tinyf * tinyf, K_POS_ZEROF, LESS);
    CheckRelation(K_ONEF, K_ONEF + epsf * K_QUARTERF, LESS);
#else
    CheckRelation(hugef * hugef, hugef * hugef * K_FLOAT_RELATION_SCALE, EQUAL);
    CheckRelation(tinyf * tinyf * K_HALFF, tinyf * tinyf, EQUAL);
    CheckRelation(-tinyf * tinyf, K_POS_ZEROF, EQUAL);
    CheckRelation(K_ONEF, K_ONEF + epsf * K_QUARTERF, EQUAL);
#endif
}

static int IslessTestImpl()
{
#pragma STDC FENV_ACCESS ON
    T_STATUS = 0;
    volatile double huge = DBL_MAX;
    volatile double tiny = DBL_MIN;
    volatile double eps = DBL_EPSILON;
    volatile float hugef = FLT_MAX;
    volatile float tinyf = FLT_MIN;
    volatile float epsf = FLT_EPSILON;
    volatile long double hugel = LDBL_MAX;
    volatile long double tinyl = LDBL_MIN;
    volatile long double epsl = LDBL_EPSILON;

    IslessTestNanUnordered();
    IslessTestOrderedDouble(huge, tiny, eps);
    IslessTestOrderedFloat(hugef, tinyf, epsf);
    IslessTestOrderedLongDouble(hugel, tinyl, epsl);
    IslessTestFltEvalDouble(huge, tiny, eps);
    IslessTestFltEvalFloat(hugef, tinyf, epsf);

    return T_STATUS;
}

int IslessTest(void)
{
    return IslessTestImpl();
}
