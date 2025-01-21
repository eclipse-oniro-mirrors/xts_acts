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

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011576,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.lowp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011577,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011578,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.mediump_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011579,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011580,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011581,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011582,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011583,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_result.mediump_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011584,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011585,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011586,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011587,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_result.mediump_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011588,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011589,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011590,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011591,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_result.mediump_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011592,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.highp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011593,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011594,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011595,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.highp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011596,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011597,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.highp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011598,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011599,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.highp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011600,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011601,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011602,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011603,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011604,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011605,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011606,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011607,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011608,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011609,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011610,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011611,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011612,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011613,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011614,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011615,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011616,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011617,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011618,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011619,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011620,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011621,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011622,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011623,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011624,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011625,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011626,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011627,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011628,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011629,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011630,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011631,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011632,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011633,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011634,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011635,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011636,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011637,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011638,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011639,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011640,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011641,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011642,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011643,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011644,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011645,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011646,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011647,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011648,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011649,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011650,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011651,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011652,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011653,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011654,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011655,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011656,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011657,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011658,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011659,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011660,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.left_shift_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011661,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011662,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011663,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011664,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011665,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011666,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011667,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011668,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011669,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011670,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011671,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011672,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011673,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011674,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011675,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011676,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.left_shift_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011677,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011678,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011679,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011680,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011681,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011682,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.left_shift_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011683,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011684,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.lowp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011685,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011686,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.mediump_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011687,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011688,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011689,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011690,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011691,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_result.mediump_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011692,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011693,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011694,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011695,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_result.mediump_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011696,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011697,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.lowp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011698,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011699,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".left_shift_assign_result.mediump_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011700,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.highp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011701,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011702,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011703,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.highp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011704,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011705,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.highp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011706,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011707,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.highp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011708,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011709,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011710,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011711,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011712,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011713,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011714,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011715,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011716,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011717,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011718,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011719,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011720,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011721,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011722,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011723,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011724,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011725,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011726,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.lowp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011727,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011728,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011729,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011730,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.lowp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011731,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011732,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011733,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011734,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.left_shift_assign_result.lowp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011735,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.lowp_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011736,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.mediump_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011737,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.left_shift_assign_result.mediump_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011738,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011739,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011740,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011741,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011742,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.left_shift_assign_result.highp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011743,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.left_shift_assign_result.highp_uvec4_int_fragment");
