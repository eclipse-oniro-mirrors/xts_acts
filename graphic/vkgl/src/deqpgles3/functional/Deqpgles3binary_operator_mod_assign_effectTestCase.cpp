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

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010064,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mod_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010065,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010066,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010067,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010068,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010069,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010070,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010071,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010072,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010073,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010074,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010075,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010076,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010077,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010078,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010079,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010080,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mod_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010081,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010082,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010083,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010084,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010085,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010086,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010087,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010088,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mod_assign_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010089,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010090,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010091,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010092,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010093,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010094,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010095,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010096,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010097,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010098,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010099,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010100,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010101,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010102,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010103,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010104,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010105,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010106,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010107,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010108,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010109,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010110,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mod_assign_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010111,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mod_assign_effect.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010112,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010113,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010114,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010115,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010116,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010117,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010118,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010119,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010120,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010121,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010122,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010123,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010124,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010125,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010126,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010127,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010128,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010129,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010130,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010131,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010132,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_effect.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010133,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mod_assign_effect.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010134,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010135,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010136,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_effect.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010137,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mod_assign_effect.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010138,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mod_assign_effect.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010139,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010140,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_effect.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010141,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mod_assign_effect.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010142,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010143,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_effect.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010144,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010145,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_effect.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010146,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mod_assign_effect.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010147,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mod_assign_effect.highp_uvec4_uint_fragment");
