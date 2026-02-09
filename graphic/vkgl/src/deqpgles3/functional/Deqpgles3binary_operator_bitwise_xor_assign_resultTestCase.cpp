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

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011492,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_xor_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011493,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011494,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011495,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011496,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011497,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011498,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011499,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011500,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011501,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011502,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011503,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011504,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011505,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011506,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011507,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011508,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_xor_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011509,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011510,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011511,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011512,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011513,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011514,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011515,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011516,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_xor_assign_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011517,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011518,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011519,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011520,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011521,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011522,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011523,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011524,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011525,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011526,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011527,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011528,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011529,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011530,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011531,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011532,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011533,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011534,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011535,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011536,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011537,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011538,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_xor_assign_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011539,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_xor_assign_result.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011540,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011541,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011542,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011543,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011544,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011545,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011546,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011547,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011548,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011549,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011550,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011551,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011552,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011553,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011554,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011555,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011556,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011557,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011558,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011559,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011560,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_result.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011561,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_xor_assign_result.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011562,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011563,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011564,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_result.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011565,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_xor_assign_result.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011566,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_xor_assign_result.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011567,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011568,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_result.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011569,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_xor_assign_result.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011570,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011571,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_result.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011572,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011573,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_result.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011574,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_xor_assign_result.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011575,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_xor_assign_result.highp_uvec4_uint_fragment");
