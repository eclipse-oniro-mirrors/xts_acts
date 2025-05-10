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
#include "../ActsDeqpgles30043TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042358,
        "dEQP-GLES3.functional.state_query.boolea",
        "n.primitive_restart_fixed_index_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042359,
        "dEQP-GLES3.functional.state_query.boolean",
        ".primitive_restart_fixed_index_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042360,
        "dEQP-GLES3.functional.state_query.boolean",
        ".primitive_restart_fixed_index_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042361,
        "dEQP-GLES3.functional.state_query.boolean.",
        "primitive_restart_fixed_index_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042362,
        "dEQP-GLES3.functional.state_query.boolea",
        "n.primitive_restart_fixed_index_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042363,
        "dEQP-GLES3.functional.state_query.b",
        "oolean.rasterizer_discard_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042364,
        "dEQP-GLES3.functional.state_query.b",
        "oolean.rasterizer_discard_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042365,
        "dEQP-GLES3.functional.state_query.b",
        "oolean.rasterizer_discard_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042366,
        "dEQP-GLES3.functional.state_query.bo",
        "olean.rasterizer_discard_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042367,
        "dEQP-GLES3.functional.state_query.",
        "boolean.rasterizer_discard_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042368,
        "dEQP-GLES3.functional.state_qu",
        "ery.boolean.cull_face_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042369,
        "dEQP-GLES3.functional.state_que",
        "ry.boolean.cull_face_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042370,
        "dEQP-GLES3.functional.state_que",
        "ry.boolean.cull_face_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042371,
        "dEQP-GLES3.functional.state_quer",
        "y.boolean.cull_face_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042372,
        "dEQP-GLES3.functional.state_qu",
        "ery.boolean.cull_face_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042373,
        "dEQP-GLES3.functional.state_query.b",
        "oolean.polygon_offset_fill_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042374,
        "dEQP-GLES3.functional.state_query.bo",
        "olean.polygon_offset_fill_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042375,
        "dEQP-GLES3.functional.state_query.bo",
        "olean.polygon_offset_fill_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042376,
        "dEQP-GLES3.functional.state_query.boo",
        "lean.polygon_offset_fill_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042377,
        "dEQP-GLES3.functional.state_query.b",
        "oolean.polygon_offset_fill_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042378,
        "dEQP-GLES3.functional.state_query.bool",
        "ean.sample_alpha_to_coverage_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042379,
        "dEQP-GLES3.functional.state_query.bool",
        "ean.sample_alpha_to_coverage_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042380,
        "dEQP-GLES3.functional.state_query.bool",
        "ean.sample_alpha_to_coverage_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042381,
        "dEQP-GLES3.functional.state_query.boole",
        "an.sample_alpha_to_coverage_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042382,
        "dEQP-GLES3.functional.state_query.boo",
        "lean.sample_alpha_to_coverage_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042383,
        "dEQP-GLES3.functional.state_query",
        ".boolean.sample_coverage_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042384,
        "dEQP-GLES3.functional.state_query.",
        "boolean.sample_coverage_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042385,
        "dEQP-GLES3.functional.state_query.",
        "boolean.sample_coverage_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042386,
        "dEQP-GLES3.functional.state_query.b",
        "oolean.sample_coverage_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042387,
        "dEQP-GLES3.functional.state_query",
        ".boolean.sample_coverage_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042388,
        "dEQP-GLES3.functional.state_quer",
        "y.boolean.scissor_test_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042389,
        "dEQP-GLES3.functional.state_quer",
        "y.boolean.scissor_test_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042390,
        "dEQP-GLES3.functional.state_quer",
        "y.boolean.scissor_test_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042391,
        "dEQP-GLES3.functional.state_query",
        ".boolean.scissor_test_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042392,
        "dEQP-GLES3.functional.state_que",
        "ry.boolean.scissor_test_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042393,
        "dEQP-GLES3.functional.state_quer",
        "y.boolean.stencil_test_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042394,
        "dEQP-GLES3.functional.state_quer",
        "y.boolean.stencil_test_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042395,
        "dEQP-GLES3.functional.state_quer",
        "y.boolean.stencil_test_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042396,
        "dEQP-GLES3.functional.state_query",
        ".boolean.stencil_test_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042397,
        "dEQP-GLES3.functional.state_que",
        "ry.boolean.stencil_test_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042398,
        "dEQP-GLES3.functional.state_que",
        "ry.boolean.depth_test_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042399,
        "dEQP-GLES3.functional.state_que",
        "ry.boolean.depth_test_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042400,
        "dEQP-GLES3.functional.state_que",
        "ry.boolean.depth_test_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042401,
        "dEQP-GLES3.functional.state_quer",
        "y.boolean.depth_test_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042402,
        "dEQP-GLES3.functional.state_qu",
        "ery.boolean.depth_test_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042403,
        "dEQP-GLES3.functional.state_",
        "query.boolean.blend_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042404,
        "dEQP-GLES3.functional.state_q",
        "uery.boolean.blend_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042405,
        "dEQP-GLES3.functional.state_q",
        "uery.boolean.blend_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042406,
        "dEQP-GLES3.functional.state_qu",
        "ery.boolean.blend_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042407,
        "dEQP-GLES3.functional.state_",
        "query.boolean.blend_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042408,
        "dEQP-GLES3.functional.state_q",
        "uery.boolean.dither_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042409,
        "dEQP-GLES3.functional.state_q",
        "uery.boolean.dither_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042410,
        "dEQP-GLES3.functional.state_q",
        "uery.boolean.dither_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042411,
        "dEQP-GLES3.functional.state_qu",
        "ery.boolean.dither_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042412,
        "dEQP-GLES3.functional.state_",
        "query.boolean.dither_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042413,
        "dEQP-GLES3.functional.state_query.",
        "boolean.color_writemask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042414,
        "dEQP-GLES3.functional.state_query.",
        "boolean.color_writemask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042415,
        "dEQP-GLES3.functional.state_query.b",
        "oolean.color_writemask_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042416,
        "dEQP-GLES3.functional.state_query",
        ".boolean.color_writemask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042417,
        "dEQP-GLES3.functional.state_query.",
        "boolean.depth_writemask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042418,
        "dEQP-GLES3.functional.state_query.",
        "boolean.depth_writemask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042419,
        "dEQP-GLES3.functional.state_query.b",
        "oolean.depth_writemask_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042420,
        "dEQP-GLES3.functional.state_query",
        ".boolean.depth_writemask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042421,
        "dEQP-GLES3.functional.state_query.boo",
        "lean.sample_coverage_invert_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042422,
        "dEQP-GLES3.functional.state_query.boo",
        "lean.sample_coverage_invert_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042423,
        "dEQP-GLES3.functional.state_query.bool",
        "ean.sample_coverage_invert_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042424,
        "dEQP-GLES3.functional.state_query.bo",
        "olean.sample_coverage_invert_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042425,
        "dEQP-GLES3.functional.state_query.",
        "boolean.shader_compiler_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042426,
        "dEQP-GLES3.functional.state_query.",
        "boolean.shader_compiler_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042427,
        "dEQP-GLES3.functional.state_query.b",
        "oolean.shader_compiler_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042428,
        "dEQP-GLES3.functional.state_query",
        ".boolean.shader_compiler_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042429,
        "dEQP-GLES3.functional.state_query.boolean.t",
        "ransform_feedback_active_initial_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042430,
        "dEQP-GLES3.functional.state_query.boolean.t",
        "ransform_feedback_active_initial_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042431,
        "dEQP-GLES3.functional.state_query.boolean.tr",
        "ansform_feedback_active_initial_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042432,
        "dEQP-GLES3.functional.state_query.boolean.",
        "transform_feedback_active_initial_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042433,
        "dEQP-GLES3.functional.state_query.boolean.t",
        "ransform_feedback_paused_initial_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042434,
        "dEQP-GLES3.functional.state_query.boolean.t",
        "ransform_feedback_paused_initial_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042435,
        "dEQP-GLES3.functional.state_query.boolean.tr",
        "ansform_feedback_paused_initial_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042436,
        "dEQP-GLES3.functional.state_query.boolean.",
        "transform_feedback_paused_initial_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042437,
        "dEQP-GLES3.functional.state_query.b",
        "oolean.transform_feedback_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042438,
        "dEQP-GLES3.functional.state_query.b",
        "oolean.transform_feedback_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042439,
        "dEQP-GLES3.functional.state_query.bo",
        "olean.transform_feedback_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042440,
        "dEQP-GLES3.functional.state_query.",
        "boolean.transform_feedback_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042441,
        "dEQP-GLES3.functional.state_query.boolean.t",
        "ransform_feedback_implicit_resume_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042442,
        "dEQP-GLES3.functional.state_query.boolean.t",
        "ransform_feedback_implicit_resume_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042443,
        "dEQP-GLES3.functional.state_query.boolean.tr",
        "ansform_feedback_implicit_resume_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042444,
        "dEQP-GLES3.functional.state_query.boolean.",
        "transform_feedback_implicit_resume_getfloat");
