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

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011324,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_and_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011325,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011326,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011327,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011328,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011329,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011330,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011331,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011332,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011333,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011334,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011335,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011336,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011337,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011338,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011339,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011340,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_and_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011341,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011342,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011343,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011344,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011345,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011346,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011347,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011348,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_and_assign_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011349,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011350,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011351,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011352,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011353,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011354,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011355,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011356,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011357,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011358,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011359,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011360,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011361,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011362,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011363,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011364,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011365,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011366,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011367,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011368,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011369,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011370,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011371,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_result.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011372,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011373,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011374,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011375,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011376,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011377,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011378,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011379,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011380,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011381,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011382,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011383,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011384,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011385,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011386,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011387,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011388,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011389,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011390,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011391,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011392,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_result.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011393,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_and_assign_result.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011394,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011395,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011396,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_result.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011397,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_and_assign_result.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011398,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_result.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011399,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011400,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_result.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011401,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_and_assign_result.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011402,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011403,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_result.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011404,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011405,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_result.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011406,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_result.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011407,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_result.highp_uvec4_uint_fragment");
