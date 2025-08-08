/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30028TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027693,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_never_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027694,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_never_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027695,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_never_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027696,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_never_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027697,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_never_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027698,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_never_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027699,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_never_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027700,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_never_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027701,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.stencil_never_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027702,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_always_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027703,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_always_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027704,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_always_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027705,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_always_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027706,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_always_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027707,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_always_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027708,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_always_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027709,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_always_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027710,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_always_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027711,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_less_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027712,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_less_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027713,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_less_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027714,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_less_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027715,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_less_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027716,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_less_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027717,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_less_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027718,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_less_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027719,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.stencil_less_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027720,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_lequal_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027721,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_lequal_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027722,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_lequal_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027723,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_lequal_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027724,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_lequal_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027725,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_lequal_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027726,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_lequal_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027727,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_lequal_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027728,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_lequal_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027729,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_equal_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027730,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_equal_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027731,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_equal_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027732,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_equal_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027733,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_equal_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027734,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_equal_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027735,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_equal_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027736,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_equal_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027737,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.stencil_equal_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027738,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_gequal_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027739,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_gequal_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027740,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_gequal_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027741,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_gequal_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027742,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_gequal_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027743,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_gequal_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027744,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_gequal_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027745,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_gequal_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027746,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_gequal_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027747,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_greater_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027748,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_greater_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027749,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_greater_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027750,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_greater_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027751,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_greater_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027752,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_greater_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027753,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_greater_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027754,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_greater_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027755,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_greater_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027756,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_notequal_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027757,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_notequal_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027758,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_notequal_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027759,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_notequal_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027760,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_notequal_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027761,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_notequal_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027762,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_notequal_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027763,
        "dEQP-GLES3.functional.fragment_ops.depth_stencil.s",
        "tencil_depth_funcs.stencil_notequal_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027764,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_notequal_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027765,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.no_stencil_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027766,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.no_stencil_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027767,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.no_stencil_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027768,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.no_stencil_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027769,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.no_stencil_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027770,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.no_stencil_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027771,
        "dEQP-GLES3.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.no_stencil_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027772,
        "dEQP-GLES3.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.no_stencil_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027773,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_depth_funcs.no_stencil_no_depth");
