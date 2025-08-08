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

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010568,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.lowp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010569,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010570,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.mediump_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010571,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010572,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010573,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.lowp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010574,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010575,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010576,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010577,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.lowp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010578,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010579,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010580,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010581,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.lowp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010582,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010583,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010584,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.highp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010585,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010586,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010587,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010588,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010589,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010590,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010591,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010592,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.right_shift_assign_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010593,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010594,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010595,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010596,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010597,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010598,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010599,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010600,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010601,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010602,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010603,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010604,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010605,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010606,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010607,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010608,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010609,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010610,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010611,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010612,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010613,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010614,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010615,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010616,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010617,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010618,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010619,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010620,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010621,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010622,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010623,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010624,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010625,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010626,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010627,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010628,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010629,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010630,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010631,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010632,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010633,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010634,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010635,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010636,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010637,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010638,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010639,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010640,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010641,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010642,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010643,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010644,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010645,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010646,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010647,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010648,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010649,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010650,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010651,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010652,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.right_shift_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010653,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010654,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010655,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010656,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010657,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010658,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010659,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010660,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010661,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010662,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010663,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010664,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010665,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010666,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010667,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010668,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.right_shift_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010669,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010670,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010671,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010672,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010673,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010674,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010675,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010676,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_effect.lowp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010677,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010678,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.mediump_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010679,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010680,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010681,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.lowp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010682,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010683,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010684,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010685,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.lowp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010686,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010687,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010688,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010689,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.lowp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010690,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010691,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_effect.mediump_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010692,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.highp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010693,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010694,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010695,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010696,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010697,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010698,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010699,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.highp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010700,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010701,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010702,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010703,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010704,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010705,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010706,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010707,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010708,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010709,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010710,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010711,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010712,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010713,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010714,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010715,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010716,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010717,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010718,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010719,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010720,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.mediump_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010721,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010722,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010723,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010724,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.mediump_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010725,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010726,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.lowp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010727,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.lowp_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010728,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.mediump_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010729,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_effect.mediump_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010730,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.highp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010731,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010732,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.highp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010733,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010734,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_effect.highp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010735,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_effect.highp_uvec4_int_fragment");
