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

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029201,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_func_alpha_func.src.src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029202,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.rgb_func_alpha_func.src.src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029203,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029204,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.src.src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029205,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029206,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.src.src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029207,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029208,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.src.src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029209,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.rgb_func_alpha_func.src.src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029210,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.src.src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029211,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029212,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029213,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.rgb_func_alpha_func.src.src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029214,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.rgb",
        "_func_alpha_func.src.src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_029215,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_func_alpha_func.src.src_alpha_saturate_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030143,
        "dEQP-GLES3.functional.fragment_ops.blend.",
        "fbo_srgb.rgb_func_alpha_func.src.zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030144,
        "dEQP-GLES3.functional.fragment_ops.blend.",
        "fbo_srgb.rgb_func_alpha_func.src.zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030145,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.src.zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030146,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030147,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.src.zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030148,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030149,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.src.zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030150,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030151,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.src.zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030152,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030153,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030154,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030155,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030156,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030157,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.zero_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030158,
        "dEQP-GLES3.functional.fragment_ops.blend.",
        "fbo_srgb.rgb_func_alpha_func.src.one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030159,
        "dEQP-GLES3.functional.fragment_ops.blend",
        ".fbo_srgb.rgb_func_alpha_func.src.one_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030160,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.src.one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030161,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030162,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.src.one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030163,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030164,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.src.one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030165,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030166,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.src.one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030167,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030168,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030169,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030170,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030171,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030172,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.one_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030173,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.src.src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030174,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.src.src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030175,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030176,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030177,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030178,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030179,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030180,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030181,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030182,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030183,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030184,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030185,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030186,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030187,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030188,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030189,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030190,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030191,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030192,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030193,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030194,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030195,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030196,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030197,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030198,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030199,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030200,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030201,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030202,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030203,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.src.dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030204,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.src.dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030205,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030206,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030207,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030208,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030209,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030210,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030211,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030212,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030213,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030214,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030215,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030216,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030217,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030218,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030219,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030220,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030221,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030222,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030223,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030224,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030225,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030226,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030227,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030228,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030229,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030230,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030231,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030232,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030233,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.src.src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030234,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.src.src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030235,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030236,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030237,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030238,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030239,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030240,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030241,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030242,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030243,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030244,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030245,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030246,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030247,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030248,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030249,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030250,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030251,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030252,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030253,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030254,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030255,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030256,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030257,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030258,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030259,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030260,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030261,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030262,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030263,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.src.dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030264,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.src.dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030265,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030266,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030267,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030268,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030269,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030270,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030271,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030272,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030273,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030274,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030275,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030276,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030277,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030278,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030279,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030280,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030281,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030282,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030283,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030284,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030285,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030286,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030287,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030288,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030289,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030290,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030291,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030292,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030293,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030294,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030295,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030296,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030297,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030298,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030299,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030300,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030301,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030302,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030303,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030304,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030305,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030306,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030307,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb",
        "_func_alpha_func.src.constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030308,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030309,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030310,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030311,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030312,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030313,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030314,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030315,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030316,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030317,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030318,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030319,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_al",
        "pha_func.src.one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030320,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030321,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_al",
        "pha_func.src.one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030322,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func",
        "_alpha_func.src.one_minus_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030323,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030324,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.src.constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030325,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030326,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030327,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030328,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030329,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030330,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030331,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.src.constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030332,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030333,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030334,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030335,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030336,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030337,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb",
        "_func_alpha_func.src.constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030338,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030339,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030340,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030341,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030342,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030343,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030344,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030345,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030346,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.src.one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030347,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.src.one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030348,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030349,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_al",
        "pha_func.src.one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030350,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030351,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_al",
        "pha_func.src.one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030352,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func",
        "_alpha_func.src.one_minus_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030353,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030354,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.src.src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030355,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030356,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030357,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030358,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030359,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030360,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030361,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.src.src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030362,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.src.src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030363,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb",
        "_func_alpha_func.src.src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030364,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func",
        "_alpha_func.src.src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030365,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb",
        "_func_alpha_func.src.src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030366,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func",
        "_alpha_func.src.src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_030367,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_f",
        "unc_alpha_func.src.src_alpha_saturate_src_alpha_saturate");
