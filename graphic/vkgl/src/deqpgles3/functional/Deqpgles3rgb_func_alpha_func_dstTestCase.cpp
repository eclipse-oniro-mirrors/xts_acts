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
#include "../ActsDeqpgles30030TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029216,
        "dEQP-GLES3.functional.fragment_ops.blend.defaul",
        "t_framebuffer.rgb_func_alpha_func.dst.zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029217,
        "dEQP-GLES3.functional.fragment_ops.blend.defau",
        "lt_framebuffer.rgb_func_alpha_func.dst.zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029218,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029219,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029220,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029221,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029222,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029223,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029224,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029225,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029226,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029227,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029228,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029229,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029230,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.zero_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029231,
        "dEQP-GLES3.functional.fragment_ops.blend.defau",
        "lt_framebuffer.rgb_func_alpha_func.dst.one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029232,
        "dEQP-GLES3.functional.fragment_ops.blend.defau",
        "lt_framebuffer.rgb_func_alpha_func.dst.one_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029233,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029234,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029235,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029236,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029237,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029238,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029239,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029240,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029241,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fr",
        "amebuffer.rgb_func_alpha_func.dst.one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029242,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029243,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fr",
        "amebuffer.rgb_func_alpha_func.dst.one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029244,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029245,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.rgb_func_alpha_func.dst.one_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029246,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029247,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029248,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029249,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029250,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029251,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029252,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029253,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029254,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029255,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029256,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029257,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029258,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029259,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029260,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029261,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029262,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029263,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029264,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029265,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029266,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029267,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029268,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029269,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029270,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029271,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029272,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029273,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029274,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029275,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.dst.one_minus_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029276,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029277,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029278,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029279,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029280,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029281,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029282,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029283,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029284,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029285,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029286,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029287,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029288,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029289,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029290,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029291,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029292,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029293,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029294,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029295,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029296,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029297,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029298,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029299,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029300,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029301,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029302,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029303,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029304,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029305,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.dst.one_minus_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029306,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029307,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029308,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029309,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029310,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029311,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029312,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029313,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029314,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029315,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029316,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029317,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029318,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029319,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029320,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029321,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029322,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029323,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029324,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029325,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029326,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029327,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029328,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029329,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029330,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029331,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029332,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029333,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029334,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029335,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.dst.one_minus_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029336,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029337,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.dst.dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029338,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029339,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029340,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029341,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029342,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029343,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029344,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029345,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029346,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029347,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029348,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029349,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029350,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029351,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029352,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029353,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029354,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029355,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029356,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029357,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029358,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029359,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029360,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029361,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029362,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029363,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029364,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029365,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.dst.one_minus_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029366,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029367,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fr",
        "amebuffer.rgb_func_alpha_func.dst.constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029368,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029369,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029370,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029371,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029372,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029373,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029374,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029375,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029376,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029377,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029378,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029379,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029380,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029381,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029382,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029383,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029384,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029385,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029386,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029387,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029388,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029389,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029390,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029391,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029392,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb_fu",
        "nc_alpha_func.dst.one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029393,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029394,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb_fu",
        "nc_alpha_func.dst.one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029395,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029396,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.dst.constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029397,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fr",
        "amebuffer.rgb_func_alpha_func.dst.constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029398,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029399,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029400,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029401,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029402,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029403,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029404,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029405,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029406,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029407,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029408,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029409,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029410,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029411,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.dst.one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029412,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029413,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029414,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029415,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029416,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029417,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029418,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029419,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029420,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029421,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029422,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb_fu",
        "nc_alpha_func.dst.one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029423,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.dst.one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029424,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb_fu",
        "nc_alpha_func.dst.one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029425,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.one_minus_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029426,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.dst.src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029427,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.rgb_func_alpha_func.dst.src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029428,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029429,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.dst.src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029430,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029431,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.dst.src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029432,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029433,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.dst.src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029434,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.dst.src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029435,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.dst.src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029436,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029437,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029438,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.dst.src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029439,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.dst.src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029440,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.dst.src_alpha_saturate_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030368,
        "dEQP-GLES3.functional.fragment_ops.blend.",
        "fbo_srgb.rgb_func_alpha_func.dst.zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030369,
        "dEQP-GLES3.functional.fragment_ops.blend.",
        "fbo_srgb.rgb_func_alpha_func.dst.zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030370,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.dst.zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030371,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030372,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.dst.zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030373,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030374,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.dst.zero_src_alpha");
