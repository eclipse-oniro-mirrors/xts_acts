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

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028286,
        "dEQP-GLES3.functional.fragment_o",
        "ps.depth_stencil.write_mask.depth");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028287,
        "dEQP-GLES3.functional.fragment_op",
        "s.depth_stencil.write_mask.stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028288,
        "dEQP-GLES3.functional.fragment_o",
        "ps.depth_stencil.write_mask.both");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028991,
        "dEQP-GLES3.functional.fragment_ops.blend.defaul",
        "t_framebuffer.rgb_func_alpha_func.src.zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028992,
        "dEQP-GLES3.functional.fragment_ops.blend.defau",
        "lt_framebuffer.rgb_func_alpha_func.src.zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028993,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028994,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028995,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028996,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028997,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028998,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028999,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029000,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029001,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029002,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029003,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029004,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029005,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.zero_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029006,
        "dEQP-GLES3.functional.fragment_ops.blend.defau",
        "lt_framebuffer.rgb_func_alpha_func.src.one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029007,
        "dEQP-GLES3.functional.fragment_ops.blend.defau",
        "lt_framebuffer.rgb_func_alpha_func.src.one_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029008,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029009,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029010,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029011,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029012,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029013,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029014,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029015,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029016,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fr",
        "amebuffer.rgb_func_alpha_func.src.one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029017,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029018,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fr",
        "amebuffer.rgb_func_alpha_func.src.one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029019,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029020,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.rgb_func_alpha_func.src.one_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029021,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029022,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029023,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029024,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029025,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029026,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029027,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029028,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029029,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029030,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029031,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029032,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029033,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029034,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029035,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029036,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029037,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029038,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029039,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029040,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029041,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029042,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029043,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029044,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029045,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029046,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029047,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029048,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029049,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029050,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.src.one_minus_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029051,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029052,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029053,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029054,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029055,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029056,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029057,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029058,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029059,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029060,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029061,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029062,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029063,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029064,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029065,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029066,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029067,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029068,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029069,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029070,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029071,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029072,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029073,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029074,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029075,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029076,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029077,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029078,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029079,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029080,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.src.one_minus_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029081,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029082,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.rgb_func_alpha_func.src.src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029083,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029084,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029085,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029086,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029087,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029088,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029089,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.rgb_func_alpha_func.src.src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029090,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029091,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029092,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029093,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029094,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029095,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029096,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029097,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029098,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029099,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.r",
        "gb_func_alpha_func.src.one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029100,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_func_alpha_func.src.one_minus_src_alpha_dst_color");
