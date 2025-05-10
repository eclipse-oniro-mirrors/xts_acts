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
#include "../ActsDeqpgles30029TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028289,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028290,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.1");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028291,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028292,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028293,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.4");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028294,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028295,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028296,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028297,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028298,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028299,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028300,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028301,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028302,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.13");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028303,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028304,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028305,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028306,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028307,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028308,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028309,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028310,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028311,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.22");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028312,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.23");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028313,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.24");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029101,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029102,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029103,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029104,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029105,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029106,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029107,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029108,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029109,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029110,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.src.one_minus_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029111,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029112,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029113,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029114,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029115,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029116,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029117,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029118,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029119,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029120,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029121,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029122,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029123,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029124,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029125,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029126,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029127,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029128,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029129,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029130,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029131,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029132,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029133,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029134,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029135,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029136,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029137,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029138,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029139,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029140,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.src.one_minus_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029141,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029142,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fr",
        "amebuffer.rgb_func_alpha_func.src.constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029143,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029144,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029145,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029146,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029147,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029148,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029149,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029150,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029151,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029152,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029153,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029154,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029155,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029156,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029157,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029158,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029159,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029160,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029161,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029162,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029163,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029164,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029165,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029166,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029167,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb_fu",
        "nc_alpha_func.src.one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029168,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029169,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb_fu",
        "nc_alpha_func.src.one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029170,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029171,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029172,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fr",
        "amebuffer.rgb_func_alpha_func.src.constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029173,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029174,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029175,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029176,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029177,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029178,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029179,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029180,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029181,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029182,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029183,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029184,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029185,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029186,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029187,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029188,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029189,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029190,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029191,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029192,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029193,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029194,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029195,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029196,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029197,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb_fu",
        "nc_alpha_func.src.one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029198,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029199,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb_fu",
        "nc_alpha_func.src.one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029200,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_constant_alpha_src_alpha_saturate");
