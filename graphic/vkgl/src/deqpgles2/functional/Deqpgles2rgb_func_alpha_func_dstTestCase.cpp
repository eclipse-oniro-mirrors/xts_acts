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
#include "../ActsDeqpgles20013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012007,
        "dEQP-GLES2.functional.fragment_ops.bl",
        "end.rgb_func_alpha_func.dst.zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012008,
        "dEQP-GLES2.functional.fragment_ops.b",
        "lend.rgb_func_alpha_func.dst.zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012009,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012010,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012011,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012012,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012013,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012014,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012015,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012016,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012017,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012018,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012019,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012020,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012021,
        "dEQP-GLES2.functional.fragment_ops.b",
        "lend.rgb_func_alpha_func.dst.one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012022,
        "dEQP-GLES2.functional.fragment_ops.b",
        "lend.rgb_func_alpha_func.dst.one_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012023,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012024,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012025,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012026,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012027,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012028,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012029,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012030,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012031,
        "dEQP-GLES2.functional.fragment_ops.blend.",
        "rgb_func_alpha_func.dst.one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012032,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.dst.one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012033,
        "dEQP-GLES2.functional.fragment_ops.blend.",
        "rgb_func_alpha_func.dst.one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012034,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.dst.one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012035,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012036,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012037,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012038,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012039,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012040,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012041,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012042,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012043,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012044,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012045,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012046,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012047,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012048,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012049,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012050,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012051,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012052,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012053,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012054,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012055,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012056,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012057,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012058,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012059,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012060,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012061,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012062,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012063,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012064,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012065,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012066,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012067,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012068,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012069,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012070,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012071,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012072,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012073,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012074,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012075,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012076,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012077,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012078,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012079,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012080,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012081,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012082,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012083,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012084,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012085,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012086,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012087,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012088,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012089,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012090,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012091,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012092,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012093,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012094,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012095,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012096,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012097,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012098,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012099,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012100,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012101,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012102,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012103,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012104,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012105,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012106,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012107,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012108,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012109,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012110,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012111,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012112,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012113,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012114,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012115,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012116,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012117,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012118,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012119,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012120,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.rgb_func_alpha_func.dst.dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012121,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012122,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012123,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012124,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012125,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012126,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012127,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012128,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012129,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012130,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012131,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012132,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012133,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012134,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012135,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012136,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012137,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012138,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012139,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012140,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012141,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012142,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012143,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012144,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012145,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012146,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012147,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012148,
        "dEQP-GLES2.functional.fragment_ops.blend.",
        "rgb_func_alpha_func.dst.constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012149,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012150,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012151,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012152,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012153,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012154,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012155,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012156,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012157,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012158,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012159,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012160,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012161,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012162,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.dst.one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012163,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012164,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012165,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012166,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012167,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012168,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012169,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012170,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012171,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012172,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f",
        "unc.dst.one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012173,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012174,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f",
        "unc.dst.one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012175,
        "dEQP-GLES2.functional.fragment_ops.blend.r",
        "gb_func_alpha_func.dst.constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012176,
        "dEQP-GLES2.functional.fragment_ops.blend.",
        "rgb_func_alpha_func.dst.constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012177,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012178,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012179,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012180,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012181,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012182,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012183,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_func_alpha_func.dst.constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012184,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012185,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012186,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012187,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012188,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012189,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu",
        "nc_alpha_func.dst.one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012190,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f",
        "unc_alpha_func.dst.one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012191,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012192,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012193,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012194,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012195,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012196,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012197,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func",
        "_alpha_func.dst.one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012198,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph",
        "a_func.dst.one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012199,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012200,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f",
        "unc.dst.one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012201,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al",
        "pha_func.dst.one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012202,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f",
        "unc.dst.one_minus_constant_alpha_one_minus_constant_alpha");
