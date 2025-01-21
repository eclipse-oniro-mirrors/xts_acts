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

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010988,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010989,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010990,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010991,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010992,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010993,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010994,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010995,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010996,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010997,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010998,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010999,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011000,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011001,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011002,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011003,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011004,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011005,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011006,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011007,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011008,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011009,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011010,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011011,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011012,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011013,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011014,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011015,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011016,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011017,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011018,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011019,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011020,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011021,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011022,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011023,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011024,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011025,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011026,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011027,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011028,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011029,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011030,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011031,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011032,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011033,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011034,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011035,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011036,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011037,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011038,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011039,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011040,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011041,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011042,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011043,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011044,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011045,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011046,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011047,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011048,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011049,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011050,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011051,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011052,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011053,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011054,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011055,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011056,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011057,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011058,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011059,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011060,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011061,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011062,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011063,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_result.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011064,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011065,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011066,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011067,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011068,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011069,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_result.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011070,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011071,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011072,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011073,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011074,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011075,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_result.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011076,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011077,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011078,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011079,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011080,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011081,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011082,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011083,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011084,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011085,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011086,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011087,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011088,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011089,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011090,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011091,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011092,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011093,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011094,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011095,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011096,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011097,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011098,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011099,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_result.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011100,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011101,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011102,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011103,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_result.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011104,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011105,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011106,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011107,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_result.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011108,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011109,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011110,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011111,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011112,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_011113,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.highp_uvec4_uint_fragment");
