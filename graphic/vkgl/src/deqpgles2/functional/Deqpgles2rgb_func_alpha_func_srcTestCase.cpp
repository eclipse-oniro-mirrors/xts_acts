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

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011782,
        "dEQP-GLES2.functional.fragment_ops.bl",
        "end.rgb_func_alpha_func.src.zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011783,
        "dEQP-GLES2.functional.fragment_ops.b",
        "lend.rgb_func_alpha_func.src.zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011784,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011785,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011786,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011787,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011788,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011789,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011790,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011791,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011792,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011793,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011794,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011795,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011796,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.zero_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011797,
        "dEQP-GLES2.functional.fragment_ops.b",
        "lend.rgb_func_alpha_func.src.one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011798,
        "dEQP-GLES2.functional.fragment_ops.b",
        "lend.rgb_func_alpha_func.src.one_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011799,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011800,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011801,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011802,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011803,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011804,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011805,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011806,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011807,
        "dEQP-GLES2.functional.fragment_ops.blend.",
        "rgb_func_alpha_func.src.one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011808,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011809,
        "dEQP-GLES2.functional.fragment_ops.blend.",
        "rgb_func_alpha_func.src.one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011810,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011811,
        "dEQP-GLES2.functional.fragment_ops.blend.rg",
        "b_func_alpha_func.src.one_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011812,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011813,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011814,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011815,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011816,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011817,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011818,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011819,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011820,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011821,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011822,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011823,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011824,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011825,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011826,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011827,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011828,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011829,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011830,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011831,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011832,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011833,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011834,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011835,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011836,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011837,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011838,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011839,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011840,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011841,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a",
        "lpha_func.src.one_minus_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011842,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011843,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011844,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011845,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011846,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011847,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011848,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011849,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011850,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011851,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011852,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011853,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011854,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011855,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011856,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011857,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011858,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011859,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011860,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011861,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011862,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011863,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011864,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011865,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011866,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011867,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011868,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011869,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011870,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011871,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a",
        "lpha_func.src.one_minus_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011872,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011873,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011874,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011875,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011876,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011877,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011878,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011879,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011880,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011881,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011882,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011883,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011884,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011885,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011886,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011887,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011888,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011889,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011890,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011891,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011892,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011893,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011894,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011895,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011896,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011897,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011898,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011899,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011900,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011901,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a",
        "lpha_func.src.one_minus_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011902,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011903,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.src.dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011904,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011905,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011906,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011907,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011908,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011909,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011910,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011911,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011912,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011913,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011914,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011915,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011916,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011917,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011918,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011919,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011920,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011921,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011922,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011923,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011924,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011925,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011926,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011927,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011928,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011929,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011930,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011931,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a",
        "lpha_func.src.one_minus_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011932,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011933,
        "dEQP-GLES2.functional.fragment_ops.blend.",
        "rgb_func_alpha_func.src.constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011934,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011935,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011936,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011937,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011938,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011939,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011940,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011941,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011942,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011943,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011944,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011945,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011946,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011947,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011948,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011949,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011950,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011951,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011952,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011953,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011954,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011955,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011956,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011957,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011958,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f",
        "unc.src.one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011959,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011960,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f",
        "unc.src.one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011961,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011962,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.src.constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011963,
        "dEQP-GLES2.functional.fragment_ops.blend.",
        "rgb_func_alpha_func.src.constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011964,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011965,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011966,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011967,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011968,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011969,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011970,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011971,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011972,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011973,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011974,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011975,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011976,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011977,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.src.one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011978,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011979,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011980,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011981,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011982,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011983,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011984,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011985,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011986,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011987,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011988,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f",
        "unc.src.one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011989,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.src.one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011990,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f",
        "unc.src.one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011991,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.one_minus_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011992,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.src.src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011993,
        "dEQP-GLES2.functional.fragment_ops.blend.rg",
        "b_func_alpha_func.src.src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011994,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011995,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a",
        "lpha_func.src.src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011996,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011997,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a",
        "lpha_func.src.src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011998,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011999,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a",
        "lpha_func.src.src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_012000,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.src.src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_012001,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a",
        "lpha_func.src.src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_012002,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_012003,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_012004,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.src.src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_012005,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.src.src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_012006,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a",
        "lpha_func.src.src_alpha_saturate_src_alpha_saturate");
