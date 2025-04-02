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
#include "../ActsDeqpgles20016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015353,
        "dEQP-GLES2.functional.state_query",
        ".integers.subpixel_bits_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015354,
        "dEQP-GLES2.functional.state_quer",
        "y.integers.subpixel_bits_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015355,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.max_texture_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015356,
        "dEQP-GLES2.functional.state_query.",
        "integers.max_texture_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015357,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.max_cube_map_texture_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015358,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.max_cube_map_texture_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015359,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.max_vertex_attribs_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015360,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.max_vertex_attribs_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015361,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.max_vertex_uniform_vectors_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015362,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.max_vertex_uniform_vectors_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015363,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.max_varying_vectors_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015364,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.max_varying_vectors_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015365,
        "dEQP-GLES2.functional.state_query.integers.",
        "max_combined_texture_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015366,
        "dEQP-GLES2.functional.state_query.integers",
        ".max_combined_texture_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015367,
        "dEQP-GLES2.functional.state_query.integers",
        ".max_vertex_texture_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015368,
        "dEQP-GLES2.functional.state_query.integer",
        "s.max_vertex_texture_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015369,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.max_texture_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015370,
        "dEQP-GLES2.functional.state_query.int",
        "egers.max_texture_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015371,
        "dEQP-GLES2.functional.state_query.integer",
        "s.max_fragment_uniform_vectors_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015372,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.max_fragment_uniform_vectors_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015373,
        "dEQP-GLES2.functional.state_query.int",
        "egers.max_renderbuffer_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015374,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.max_renderbuffer_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015375,
        "dEQP-GLES2.functional.state_query.",
        "integers.sample_buffers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015376,
        "dEQP-GLES2.functional.state_query",
        ".integers.sample_buffers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015377,
        "dEQP-GLES2.functional.state_qu",
        "ery.integers.samples_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015378,
        "dEQP-GLES2.functional.state_qu",
        "ery.integers.samples_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015379,
        "dEQP-GLES2.functional.state_q",
        "uery.integers.samples_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015380,
        "dEQP-GLES2.functional.state_query.int",
        "egers.generate_mipmap_hint_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015381,
        "dEQP-GLES2.functional.state_query.int",
        "egers.generate_mipmap_hint_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015382,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.generate_mipmap_hint_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015383,
        "dEQP-GLES2.functional.state_quer",
        "y.integers.depth_func_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015384,
        "dEQP-GLES2.functional.state_quer",
        "y.integers.depth_func_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015385,
        "dEQP-GLES2.functional.state_que",
        "ry.integers.depth_func_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015386,
        "dEQP-GLES2.functional.state_query.",
        "integers.cull_face_mode_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015387,
        "dEQP-GLES2.functional.state_query.",
        "integers.cull_face_mode_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015388,
        "dEQP-GLES2.functional.state_query",
        ".integers.cull_face_mode_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015389,
        "dEQP-GLES2.functional.state_query.",
        "integers.front_face_mode_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015390,
        "dEQP-GLES2.functional.state_query.",
        "integers.front_face_mode_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015391,
        "dEQP-GLES2.functional.state_query",
        ".integers.front_face_mode_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015392,
        "dEQP-GLES2.functional.state_que",
        "ry.integers.viewport_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015393,
        "dEQP-GLES2.functional.state_que",
        "ry.integers.viewport_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015394,
        "dEQP-GLES2.functional.state_qu",
        "ery.integers.viewport_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015395,
        "dEQP-GLES2.functional.state_quer",
        "y.integers.scissor_box_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015396,
        "dEQP-GLES2.functional.state_quer",
        "y.integers.scissor_box_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015397,
        "dEQP-GLES2.functional.state_que",
        "ry.integers.scissor_box_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015398,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.max_viewport_dims_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015399,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.max_viewport_dims_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015400,
        "dEQP-GLES2.functional.state_query.",
        "integers.max_viewport_dims_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015401,
        "dEQP-GLES2.functional.state_query.int",
        "egers.buffer_component_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015402,
        "dEQP-GLES2.functional.state_query.int",
        "egers.buffer_component_size_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015403,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.buffer_component_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015404,
        "dEQP-GLES2.functional.state_quer",
        "y.integers.stencil_ref_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015405,
        "dEQP-GLES2.functional.state_quer",
        "y.integers.stencil_ref_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015406,
        "dEQP-GLES2.functional.state_que",
        "ry.integers.stencil_ref_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015407,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.stencil_back_ref_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015408,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.stencil_back_ref_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015409,
        "dEQP-GLES2.functional.state_query.",
        "integers.stencil_back_ref_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015410,
        "dEQP-GLES2.functional.state_query.int",
        "egers.stencil_ref_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015411,
        "dEQP-GLES2.functional.state_query.int",
        "egers.stencil_ref_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015412,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.stencil_ref_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015413,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_ref_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015414,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_ref_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015415,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.stencil_ref_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015416,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_back_ref_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015417,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_back_ref_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015418,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.stencil_back_ref_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015419,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_back_ref_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015420,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_back_ref_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015421,
        "dEQP-GLES2.functional.state_query.integer",
        "s.stencil_back_ref_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015422,
        "dEQP-GLES2.functional.state_query",
        ".integers.stencil_fail_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015423,
        "dEQP-GLES2.functional.state_query",
        ".integers.stencil_fail_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015424,
        "dEQP-GLES2.functional.state_quer",
        "y.integers.stencil_fail_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015425,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.stencil_back_fail_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015426,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.stencil_back_fail_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015427,
        "dEQP-GLES2.functional.state_query.",
        "integers.stencil_back_fail_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015428,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_fail_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015429,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_fail_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015430,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_fail_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015431,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_back_fail_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015432,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_back_fail_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015433,
        "dEQP-GLES2.functional.state_query.integer",
        "s.stencil_back_fail_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015434,
        "dEQP-GLES2.functional.state_query.int",
        "egers.stencil_fail_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015435,
        "dEQP-GLES2.functional.state_query.int",
        "egers.stencil_fail_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015436,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.stencil_fail_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015437,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_back_fail_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015438,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_back_fail_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015439,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_back_fail_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015440,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.stencil_depth_fail_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015441,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.stencil_depth_fail_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015442,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.stencil_depth_fail_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015443,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.stencil_back_depth_fail_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015444,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.stencil_back_depth_fail_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015445,
        "dEQP-GLES2.functional.state_query.int",
        "egers.stencil_back_depth_fail_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015446,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_depth_fail_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015447,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_depth_fail_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015448,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_depth_fail_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015449,
        "dEQP-GLES2.functional.state_query.integers.st",
        "encil_back_depth_fail_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015450,
        "dEQP-GLES2.functional.state_query.integers.st",
        "encil_back_depth_fail_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015451,
        "dEQP-GLES2.functional.state_query.integers.s",
        "tencil_back_depth_fail_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015452,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_depth_fail_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015453,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_depth_fail_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015454,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_depth_fail_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015455,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_back_depth_fail_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015456,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_back_depth_fail_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015457,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_back_depth_fail_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015458,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.stencil_depth_pass_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015459,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.stencil_depth_pass_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015460,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.stencil_depth_pass_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015461,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.stencil_back_depth_pass_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015462,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.stencil_back_depth_pass_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015463,
        "dEQP-GLES2.functional.state_query.int",
        "egers.stencil_back_depth_pass_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015464,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_depth_pass_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015465,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_depth_pass_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015466,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_depth_pass_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015467,
        "dEQP-GLES2.functional.state_query.integers.st",
        "encil_back_depth_pass_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015468,
        "dEQP-GLES2.functional.state_query.integers.st",
        "encil_back_depth_pass_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015469,
        "dEQP-GLES2.functional.state_query.integers.s",
        "tencil_back_depth_pass_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015470,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_depth_pass_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015471,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_depth_pass_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015472,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_depth_pass_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015473,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_back_depth_pass_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015474,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_back_depth_pass_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015475,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_back_depth_pass_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015476,
        "dEQP-GLES2.functional.state_query",
        ".integers.stencil_func_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015477,
        "dEQP-GLES2.functional.state_query",
        ".integers.stencil_func_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015478,
        "dEQP-GLES2.functional.state_quer",
        "y.integers.stencil_func_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015479,
        "dEQP-GLES2.functional.state_query.int",
        "egers.stencil_func_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015480,
        "dEQP-GLES2.functional.state_query.int",
        "egers.stencil_func_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015481,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.stencil_func_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015482,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_func_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015483,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_func_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015484,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_func_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015485,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_back_func_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015486,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_back_func_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015487,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_back_func_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015488,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_back_func_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015489,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_back_func_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015490,
        "dEQP-GLES2.functional.state_query.integer",
        "s.stencil_back_func_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015491,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.stencil_value_mask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015492,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.stencil_value_mask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015493,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.stencil_value_mask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015494,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.stencil_back_value_mask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015495,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.stencil_back_value_mask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015496,
        "dEQP-GLES2.functional.state_query.int",
        "egers.stencil_back_value_mask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015497,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_value_mask_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015498,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_value_mask_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015499,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_value_mask_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015500,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_value_mask_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015501,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_value_mask_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015502,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_value_mask_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015503,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_back_value_mask_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015504,
        "dEQP-GLES2.functional.state_query.integers.",
        "stencil_back_value_mask_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015505,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_back_value_mask_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015506,
        "dEQP-GLES2.functional.state_query.integers.st",
        "encil_back_value_mask_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015507,
        "dEQP-GLES2.functional.state_query.integers.st",
        "encil_back_value_mask_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015508,
        "dEQP-GLES2.functional.state_query.integers.s",
        "tencil_back_value_mask_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015509,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.stencil_writemask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015510,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.stencil_writemask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015511,
        "dEQP-GLES2.functional.state_query.",
        "integers.stencil_writemask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015512,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.stencil_back_writemask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015513,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.stencil_back_writemask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015514,
        "dEQP-GLES2.functional.state_query.int",
        "egers.stencil_back_writemask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015515,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_writemask_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015516,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.stencil_writemask_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015517,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.stencil_writemask_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015518,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_writemask_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015519,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_writemask_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015520,
        "dEQP-GLES2.functional.state_query.integer",
        "s.stencil_writemask_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015521,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_back_writemask_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015522,
        "dEQP-GLES2.functional.state_query.integers",
        ".stencil_back_writemask_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015523,
        "dEQP-GLES2.functional.state_query.integer",
        "s.stencil_back_writemask_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015524,
        "dEQP-GLES2.functional.state_query.integers.st",
        "encil_back_writemask_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015525,
        "dEQP-GLES2.functional.state_query.integers.st",
        "encil_back_writemask_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015526,
        "dEQP-GLES2.functional.state_query.integers.s",
        "tencil_back_writemask_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015527,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.unpack_alignment_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015528,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.unpack_alignment_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015529,
        "dEQP-GLES2.functional.state_query.",
        "integers.unpack_alignment_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015530,
        "dEQP-GLES2.functional.state_query.",
        "integers.pack_alignment_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015531,
        "dEQP-GLES2.functional.state_query.",
        "integers.pack_alignment_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015532,
        "dEQP-GLES2.functional.state_query",
        ".integers.pack_alignment_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015533,
        "dEQP-GLES2.functional.state_query",
        ".integers.blend_src_rgb_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015534,
        "dEQP-GLES2.functional.state_query",
        ".integers.blend_src_rgb_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015535,
        "dEQP-GLES2.functional.state_quer",
        "y.integers.blend_src_rgb_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015536,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.blend_src_rgb_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015537,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.blend_src_rgb_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015538,
        "dEQP-GLES2.functional.state_query.int",
        "egers.blend_src_rgb_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015539,
        "dEQP-GLES2.functional.state_query.",
        "integers.blend_src_alpha_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015540,
        "dEQP-GLES2.functional.state_query.",
        "integers.blend_src_alpha_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015541,
        "dEQP-GLES2.functional.state_query",
        ".integers.blend_src_alpha_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015542,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.blend_src_alpha_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015543,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.blend_src_alpha_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015544,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.blend_src_alpha_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015545,
        "dEQP-GLES2.functional.state_query",
        ".integers.blend_dst_rgb_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015546,
        "dEQP-GLES2.functional.state_query",
        ".integers.blend_dst_rgb_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015547,
        "dEQP-GLES2.functional.state_quer",
        "y.integers.blend_dst_rgb_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015548,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.blend_dst_rgb_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015549,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.blend_dst_rgb_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015550,
        "dEQP-GLES2.functional.state_query.int",
        "egers.blend_dst_rgb_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015551,
        "dEQP-GLES2.functional.state_query.",
        "integers.blend_dst_alpha_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015552,
        "dEQP-GLES2.functional.state_query.",
        "integers.blend_dst_alpha_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015553,
        "dEQP-GLES2.functional.state_query",
        ".integers.blend_dst_alpha_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015554,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.blend_dst_alpha_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015555,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.blend_dst_alpha_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015556,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.blend_dst_alpha_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015557,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.blend_equation_rgb_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015558,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.blend_equation_rgb_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015559,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.blend_equation_rgb_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015560,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.blend_equation_rgb_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015561,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.blend_equation_rgb_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015562,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.blend_equation_rgb_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015563,
        "dEQP-GLES2.functional.state_query.int",
        "egers.blend_equation_alpha_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015564,
        "dEQP-GLES2.functional.state_query.int",
        "egers.blend_equation_alpha_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015565,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.blend_equation_alpha_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015566,
        "dEQP-GLES2.functional.state_query.integer",
        "s.blend_equation_alpha_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015567,
        "dEQP-GLES2.functional.state_query.integer",
        "s.blend_equation_alpha_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015568,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.blend_equation_alpha_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015569,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.compressed_texture_formats_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015570,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.compressed_texture_formats_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015571,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.compressed_texture_formats_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015572,
        "dEQP-GLES2.functional.state_query.int",
        "egers.shader_binary_formats_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015573,
        "dEQP-GLES2.functional.state_query.int",
        "egers.shader_binary_formats_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015574,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.shader_binary_formats_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015575,
        "dEQP-GLES2.functional.state_query.int",
        "egers.array_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015576,
        "dEQP-GLES2.functional.state_query.int",
        "egers.array_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015577,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.array_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015578,
        "dEQP-GLES2.functional.state_query.integer",
        "s.element_array_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015579,
        "dEQP-GLES2.functional.state_query.integer",
        "s.element_array_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015580,
        "dEQP-GLES2.functional.state_query.intege",
        "rs.element_array_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015581,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.current_program_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015582,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.current_program_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015583,
        "dEQP-GLES2.functional.state_query.int",
        "egers.current_program_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015584,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.stencil_clear_value_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015585,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.stencil_clear_value_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015586,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.stencil_clear_value_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015587,
        "dEQP-GLES2.functional.state_query.",
        "integers.active_texture_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015588,
        "dEQP-GLES2.functional.state_query.",
        "integers.active_texture_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015589,
        "dEQP-GLES2.functional.state_query",
        ".integers.active_texture_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015590,
        "dEQP-GLES2.functional.state_query.int",
        "egers.renderbuffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015591,
        "dEQP-GLES2.functional.state_query.int",
        "egers.renderbuffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015592,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.renderbuffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015593,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.texture_binding_2d_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015594,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.texture_binding_2d_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015595,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.texture_binding_2d_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015596,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.texture_binding_cube_map_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015597,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.texture_binding_cube_map_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015598,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.texture_binding_cube_map_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015599,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.framebuffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015600,
        "dEQP-GLES2.functional.state_query.in",
        "tegers.framebuffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015601,
        "dEQP-GLES2.functional.state_query.i",
        "ntegers.framebuffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015602,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.implementation_color_read_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015603,
        "dEQP-GLES2.functional.state_query.integ",
        "ers.implementation_color_read_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015604,
        "dEQP-GLES2.functional.state_query.inte",
        "gers.implementation_color_read_getfloat");
