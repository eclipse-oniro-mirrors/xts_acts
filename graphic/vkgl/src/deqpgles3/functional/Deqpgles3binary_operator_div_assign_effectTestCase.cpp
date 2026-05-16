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

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009938,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009939,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009940,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009941,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009942,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009943,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009944,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009945,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009946,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009947,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009948,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009949,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009950,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009951,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009952,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009953,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009954,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009955,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009956,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009957,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009958,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009959,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009960,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009961,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009962,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009963,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009964,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009965,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009966,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009967,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009968,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009969,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009970,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009971,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009972,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009973,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009974,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009975,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009976,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009977,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009978,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009979,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009980,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009981,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009982,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009983,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009984,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009985,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009986,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009987,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009988,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009989,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009990,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009991,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009992,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009993,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009994,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009995,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009996,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009997,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009998,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009999,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010000,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010001,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010002,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010003,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010004,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010005,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010006,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010007,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010008,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010009,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010010,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010011,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010012,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010013,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_effect.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010014,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010015,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010016,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010017,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010018,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010019,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_effect.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010020,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010021,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010022,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010023,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010024,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010025,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_effect.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010026,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010027,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010028,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010029,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010030,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010031,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010032,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010033,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010034,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010035,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010036,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010037,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010038,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010039,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010040,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010041,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010042,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010043,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010044,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010045,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010046,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010047,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010048,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010049,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_effect.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010050,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010051,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010052,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010053,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_effect.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010054,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010055,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010056,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010057,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_effect.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010058,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010059,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010060,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010061,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010062,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_010063,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.highp_uvec4_uint_fragment");
