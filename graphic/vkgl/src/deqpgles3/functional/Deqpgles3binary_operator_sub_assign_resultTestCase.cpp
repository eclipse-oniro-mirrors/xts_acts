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
#include "../ActsDeqpgles30011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010862,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010863,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010864,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010865,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010866,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010867,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010868,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010869,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010870,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010871,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010872,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010873,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010874,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010875,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010876,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010877,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010878,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010879,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010880,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010881,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010882,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010883,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010884,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010885,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010886,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010887,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010888,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010889,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010890,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010891,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010892,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010893,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010894,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010895,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010896,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010897,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010898,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010899,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010900,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010901,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010902,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010903,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010904,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010905,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010906,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010907,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010908,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010909,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010910,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010911,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010912,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010913,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010914,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010915,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010916,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010917,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010918,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010919,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010920,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010921,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010922,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010923,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010924,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010925,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010926,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010927,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010928,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010929,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010930,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010931,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010932,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010933,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010934,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010935,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010936,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010937,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_result.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010938,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010939,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010940,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010941,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010942,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010943,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_result.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010944,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010945,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010946,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010947,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010948,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010949,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_result.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010950,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010951,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010952,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010953,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010954,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010955,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010956,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010957,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010958,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010959,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010960,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010961,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010962,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010963,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010964,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010965,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010966,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010967,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010968,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010969,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010970,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010971,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010972,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010973,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_result.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010974,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010975,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010976,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010977,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_result.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010978,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010979,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010980,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010981,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_result.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010982,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010983,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010984,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010985,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010986,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010987,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.highp_uvec4_uint_fragment");
