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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011026,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_never_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011027,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_never_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011028,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_never_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011029,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_never_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011030,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_never_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011031,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_never_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011032,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_never_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011033,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_never_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011034,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.stencil_never_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011035,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_always_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011036,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_always_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011037,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_always_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011038,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_always_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011039,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_always_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011040,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_always_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011041,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_always_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011042,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_always_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011043,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_always_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011044,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_less_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011045,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_less_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011046,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_less_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011047,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_less_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011048,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_less_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011049,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_less_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011050,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_less_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011051,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_less_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011052,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.stencil_less_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011053,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_lequal_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011054,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_lequal_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011055,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_lequal_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011056,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_lequal_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011057,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_lequal_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011058,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_lequal_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011059,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_lequal_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011060,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_lequal_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011061,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_lequal_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011062,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_equal_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011063,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_equal_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011064,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_equal_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011065,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_equal_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011066,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_equal_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011067,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_equal_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011068,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_equal_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011069,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_equal_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011070,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.stencil_equal_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011071,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_gequal_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011072,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_gequal_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011073,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_gequal_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011074,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_gequal_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011075,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_gequal_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011076,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_gequal_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011077,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_gequal_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011078,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_gequal_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011079,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_gequal_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011080,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_greater_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011081,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_greater_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011082,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_greater_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011083,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_greater_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011084,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_greater_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011085,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_greater_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011086,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_greater_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011087,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_greater_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011088,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.stencil_greater_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011089,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_notequal_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011090,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_notequal_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011091,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_notequal_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011092,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_notequal_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011093,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil",
        ".stencil_depth_funcs.stencil_notequal_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011094,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_notequal_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011095,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil.",
        "stencil_depth_funcs.stencil_notequal_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011096,
        "dEQP-GLES2.functional.fragment_ops.depth_stencil.s",
        "tencil_depth_funcs.stencil_notequal_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011097,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.stencil_notequal_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011098,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.no_stencil_depth_never");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011099,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.no_stencil_depth_always");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011100,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.no_stencil_depth_less");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011101,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.no_stencil_depth_lequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011102,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_depth_funcs.no_stencil_depth_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011103,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.no_stencil_depth_gequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011104,
        "dEQP-GLES2.functional.fragment_ops.depth_stenc",
        "il.stencil_depth_funcs.no_stencil_depth_greater");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011105,
        "dEQP-GLES2.functional.fragment_ops.depth_stenci",
        "l.stencil_depth_funcs.no_stencil_depth_notequal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011106,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_depth_funcs.no_stencil_no_depth");
