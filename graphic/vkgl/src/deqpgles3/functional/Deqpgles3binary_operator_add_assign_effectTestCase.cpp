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
#include "../ActsDeqpgles30010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009560,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009561,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009562,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009563,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009564,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009565,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009566,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009567,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009568,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009569,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009570,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009571,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009572,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009573,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009574,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009575,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009576,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009577,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009578,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009579,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009580,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009581,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009582,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009583,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009584,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009585,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009586,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009587,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009588,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009589,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009590,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009591,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009592,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009593,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009594,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009595,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009596,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009597,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009598,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009599,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009600,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009601,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009602,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009603,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009604,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009605,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009606,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009607,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009608,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009609,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009610,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009611,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009612,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009613,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009614,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009615,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009616,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009617,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009618,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009619,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009620,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009621,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009622,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009623,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009624,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009625,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009626,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009627,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009628,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009629,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009630,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009631,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009632,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009633,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009634,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009635,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_effect.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009636,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009637,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009638,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009639,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009640,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009641,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_effect.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009642,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009643,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009644,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009645,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009646,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009647,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_effect.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009648,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009649,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009650,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009651,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009652,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009653,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009654,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009655,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009656,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009657,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009658,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009659,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009660,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009661,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009662,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009663,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009664,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009665,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009666,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009667,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009668,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009669,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009670,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009671,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_effect.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009672,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009673,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009674,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009675,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_effect.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009676,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009677,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009678,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009679,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_effect.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009680,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009681,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009682,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009683,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009684,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009685,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.highp_uvec4_uint_fragment");
