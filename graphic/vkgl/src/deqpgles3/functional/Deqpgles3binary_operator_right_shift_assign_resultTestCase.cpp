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

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011744,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.lowp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011745,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011746,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.mediump_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011747,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011748,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011749,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.lowp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011750,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011751,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011752,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011753,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.lowp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011754,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011755,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011756,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011757,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.lowp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011758,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011759,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011760,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.highp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011761,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011762,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011763,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011764,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011765,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011766,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011767,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011768,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.right_shift_assign_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011769,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011770,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011771,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011772,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011773,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011774,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011775,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011776,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011777,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011778,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011779,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011780,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011781,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011782,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011783,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011784,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011785,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011786,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011787,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011788,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011789,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011790,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011791,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011792,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011793,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011794,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011795,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011796,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011797,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011798,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011799,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011800,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011801,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011802,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011803,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011804,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011805,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011806,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011807,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011808,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011809,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011810,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011811,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011812,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011813,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011814,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011815,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011816,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011817,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011818,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011819,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011820,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011821,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011822,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011823,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011824,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011825,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011826,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011827,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011828,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.right_shift_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011829,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011830,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011831,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011832,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011833,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011834,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011835,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011836,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011837,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011838,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011839,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011840,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011841,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011842,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011843,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011844,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.right_shift_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011845,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011846,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011847,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011848,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011849,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011850,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.right_shift_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011851,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011852,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.right_shift_assign_result.lowp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011853,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011854,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.mediump_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011855,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011856,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011857,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.lowp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011858,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011859,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011860,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011861,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.lowp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011862,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011863,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011864,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011865,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.lowp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011866,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011867,
        "dEQP-GLES3.functional.shaders.operator.binary_operator",
        ".right_shift_assign_result.mediump_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011868,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.highp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011869,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011870,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011871,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011872,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011873,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011874,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011875,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.highp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011876,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011877,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011878,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011879,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011880,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011881,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011882,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011883,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011884,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011885,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011886,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011887,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011888,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011889,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011890,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011891,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011892,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011893,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011894,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011895,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011896,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.mediump_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011897,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011898,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011899,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011900,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.mediump_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011901,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011902,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.lowp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011903,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.lowp_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011904,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.mediump_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011905,
        "dEQP-GLES3.functional.shaders.operator.binary_operato",
        "r.right_shift_assign_result.mediump_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011906,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.highp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011907,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011908,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.highp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011909,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011910,
        "dEQP-GLES3.functional.shaders.operator.binary_opera",
        "tor.right_shift_assign_result.highp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011911,
        "dEQP-GLES3.functional.shaders.operator.binary_operat",
        "or.right_shift_assign_result.highp_uvec4_int_fragment");
