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
#include "../ActsDeqpgles30010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009104,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_xor.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009105,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009106,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009107,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009108,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009109,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009110,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009111,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009112,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009113,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009114,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009115,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009116,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009117,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009118,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009119,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009120,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_xor.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009121,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009122,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009123,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009124,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009125,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009126,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009127,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009128,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_xor.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009129,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009130,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009131,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009132,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009133,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009134,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009135,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009136,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009137,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009138,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009139,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009140,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009141,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009142,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009143,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009144,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009145,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009146,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009147,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009148,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009149,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009150,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_xor.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009151,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_xor.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009152,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009153,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009154,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009155,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009156,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009157,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009158,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009159,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009160,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009161,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009162,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009163,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009164,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009165,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009166,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009167,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009168,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009169,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009170,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009171,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009172,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009173,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_xor.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009174,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009175,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009176,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009177,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_xor.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009178,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009179,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009180,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009181,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_xor.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009182,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009183,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009184,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009185,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009186,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009187,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009188,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009189,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009190,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009191,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009192,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009193,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009194,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009195,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009196,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009197,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009198,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009199,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009200,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009201,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009202,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009203,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009204,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009205,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009206,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009207,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009208,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009209,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_xor.mediump_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009210,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009211,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009212,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009213,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_xor.mediump_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009214,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_xor.lowp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009215,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.lowp_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009216,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.mediump_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009217,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_xor.mediump_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009218,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009219,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.highp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009220,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009221,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.highp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009222,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_xor.highp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009223,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_xor.highp_uint_uvec4_fragment");
