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

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010232,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_or_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010233,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010234,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010235,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010236,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010237,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010238,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010239,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010240,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010241,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010242,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010243,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010244,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010245,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010246,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010247,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010248,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010249,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010250,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010251,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010252,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010253,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010254,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010255,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010256,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010257,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010258,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010259,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010260,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010261,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010262,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010263,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010264,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010265,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010266,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010267,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010268,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010269,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010270,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010271,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010272,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.bitwise_or_assign_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010273,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010274,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010275,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010276,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010277,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010278,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.bitwise_or_assign_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010279,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010280,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010281,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010282,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010283,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010284,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010285,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010286,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010287,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010288,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.bitwise_or_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010289,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010290,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010291,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010292,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010293,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010294,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010295,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010296,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010297,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010298,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010299,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010300,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010301,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_effect.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010302,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010303,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010304,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010305,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_effect.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010306,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010307,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010308,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010309,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.bitwise_or_assign_effect.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010310,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010311,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010312,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010313,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010314,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.bitwise_or_assign_effect.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010315,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.bitwise_or_assign_effect.highp_uvec4_uint_fragment");
