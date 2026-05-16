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

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010400,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.lowp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010401,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010402,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.mediump_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010403,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010404,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010405,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010406,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010407,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_effect.mediump_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010408,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010409,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010410,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010411,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_effect.mediump_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010412,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010413,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010414,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010415,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_effect.mediump_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010416,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.highp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010417,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010418,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010419,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.highp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010420,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010421,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.highp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010422,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010423,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.highp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010424,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010425,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010426,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010427,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010428,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010429,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010430,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010431,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010432,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010433,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010434,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010435,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010436,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010437,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010438,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010439,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010440,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010441,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010442,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010443,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010444,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010445,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010446,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010447,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010448,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010449,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010450,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010451,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010452,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010453,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010454,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010455,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010456,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010457,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010458,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010459,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010460,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010461,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010462,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010463,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010464,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010465,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010466,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010467,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010468,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010469,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010470,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010471,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010472,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010473,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010474,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010475,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010476,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010477,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010478,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010479,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010480,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010481,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010482,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010483,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010484,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.left_shift_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010485,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010486,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010487,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010488,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010489,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010490,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010491,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010492,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010493,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010494,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010495,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010496,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010497,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010498,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010499,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010500,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010501,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010502,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010503,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010504,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010505,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010506,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010507,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010508,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.lowp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010509,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010510,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.mediump_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010511,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010512,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010513,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010514,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010515,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_effect.mediump_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010516,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010517,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010518,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010519,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_effect.mediump_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010520,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010521,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.lowp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010522,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010523,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_effect.mediump_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010524,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.highp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010525,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010526,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010527,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.highp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010528,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010529,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.highp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010530,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010531,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.highp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010532,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010533,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010534,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010535,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010536,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010537,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010538,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010539,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010540,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010541,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010542,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010543,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010544,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010545,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010546,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010547,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010548,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010549,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010550,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.lowp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010551,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010552,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010553,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010554,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.lowp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010555,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010556,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010557,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010558,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_effect.lowp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010559,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.lowp_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010560,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.mediump_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010561,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_effect.mediump_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010562,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010563,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010564,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010565,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010566,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_effect.highp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010567,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_effect.highp_uvec4_int_fragment");
