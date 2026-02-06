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
#include "../ActsDeqpgles30012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011240,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mod_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011241,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011242,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011243,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011244,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011245,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011246,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011247,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011248,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011249,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011250,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011251,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011252,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011253,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011254,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011255,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011256,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mod_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011257,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011258,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011259,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011260,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011261,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011262,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011263,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011264,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mod_assign_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011265,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011266,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011267,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011268,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011269,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011270,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011271,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011272,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011273,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011274,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011275,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011276,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011277,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011278,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011279,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011280,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011281,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011282,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011283,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011284,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011285,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011286,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011287,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_result.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011288,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011289,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011290,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011291,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011292,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011293,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011294,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011295,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011296,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011297,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011298,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011299,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011300,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011301,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011302,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011303,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011304,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011305,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011306,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011307,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011308,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_result.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011309,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mod_assign_result.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011310,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011311,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011312,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_result.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011313,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mod_assign_result.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011314,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_result.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011315,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011316,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_result.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011317,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mod_assign_result.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011318,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011319,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_result.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011320,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011321,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_result.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011322,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_result.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011323,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_result.highp_uvec4_uint_fragment");
