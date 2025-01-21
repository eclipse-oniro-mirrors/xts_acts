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

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010316,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_xor_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010317,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010318,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010319,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010320,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010321,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010322,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010323,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010324,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010325,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010326,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010327,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010328,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010329,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010330,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010331,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010332,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_xor_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010333,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010334,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010335,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010336,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010337,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010338,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010339,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010340,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_xor_assign_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010341,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010342,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010343,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010344,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010345,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010346,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010347,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010348,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010349,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010350,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010351,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010352,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010353,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010354,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010355,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010356,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010357,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010358,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010359,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010360,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010361,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010362,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010363,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_effect.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010364,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010365,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010366,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010367,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010368,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010369,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010370,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010371,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010372,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010373,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010374,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010375,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010376,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010377,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010378,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010379,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010380,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010381,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010382,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010383,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010384,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_effect.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010385,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_xor_assign_effect.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010386,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010387,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010388,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_effect.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010389,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_xor_assign_effect.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010390,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_effect.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010391,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010392,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_effect.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010393,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_xor_assign_effect.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010394,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010395,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_effect.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010396,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010397,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_effect.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010398,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_effect.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010399,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_effect.highp_uvec4_uint_fragment");
