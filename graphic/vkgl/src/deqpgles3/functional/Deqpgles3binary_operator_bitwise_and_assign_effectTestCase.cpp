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

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010148,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_and_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010149,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010150,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010151,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010152,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010153,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010154,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010155,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010156,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010157,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010158,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010159,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010160,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010161,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010162,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010163,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010164,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_and_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010165,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010166,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010167,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010168,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010169,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010170,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010171,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010172,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_and_assign_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010173,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010174,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010175,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010176,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010177,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010178,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010179,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010180,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010181,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010182,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010183,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010184,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010185,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010186,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010187,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010188,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010189,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010190,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010191,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010192,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010193,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010194,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_and_assign_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010195,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_and_assign_effect.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010196,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010197,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010198,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010199,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010200,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010201,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010202,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010203,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010204,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010205,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010206,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010207,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010208,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010209,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010210,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010211,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010212,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010213,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010214,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010215,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010216,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_effect.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010217,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_and_assign_effect.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010218,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010219,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010220,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_effect.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010221,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_and_assign_effect.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010222,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_and_assign_effect.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010223,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010224,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_effect.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010225,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".bitwise_and_assign_effect.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010226,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010227,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_effect.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010228,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010229,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_effect.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010230,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_and_assign_effect.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010231,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_and_assign_effect.highp_uvec4_uint_fragment");
