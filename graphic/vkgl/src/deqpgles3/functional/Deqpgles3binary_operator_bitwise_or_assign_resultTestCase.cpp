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

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011408,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_or_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011409,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011410,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011411,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011412,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011413,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011414,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011415,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011416,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011417,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011418,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011419,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011420,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011421,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011422,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011423,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011424,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011425,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011426,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011427,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011428,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011429,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011430,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011431,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011432,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011433,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011434,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011435,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011436,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011437,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011438,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011439,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011440,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011441,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011442,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011443,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011444,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011445,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011446,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011447,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011448,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011449,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011450,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011451,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011452,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011453,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011454,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011455,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011456,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011457,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011458,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011459,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011460,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011461,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011462,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011463,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011464,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011465,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011466,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011467,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011468,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011469,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011470,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011471,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011472,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011473,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011474,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011475,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011476,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011477,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_result.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011478,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011479,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011480,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011481,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_result.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011482,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011483,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011484,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011485,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_result.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011486,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011487,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011488,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011489,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011490,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_result.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011491,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_result.highp_uvec4_uint_fragment");
