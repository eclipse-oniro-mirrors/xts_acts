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

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009392,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.lowp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009393,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009394,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.mediump_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009395,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009396,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009397,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.lowp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009398,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009399,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009400,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009401,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.lowp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009402,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009403,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009404,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009405,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.lowp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009406,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009407,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009408,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.highp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009409,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009410,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009411,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009412,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009413,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009414,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009415,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009416,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.right_shift.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009417,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009418,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009419,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009420,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009421,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009422,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009423,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009424,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009425,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009426,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009427,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009428,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009429,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009430,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009431,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009432,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009433,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009434,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009435,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009436,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009437,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009438,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009439,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009440,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009441,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009442,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009443,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009444,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009445,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009446,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009447,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009448,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009449,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009450,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009451,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009452,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009453,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009454,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009455,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009456,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009457,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009458,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009459,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009460,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009461,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009462,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009463,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009464,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009465,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009466,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009467,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009468,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009469,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009470,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009471,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009472,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009473,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009474,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009475,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009476,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.right_shift.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009477,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009478,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009479,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009480,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009481,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009482,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009483,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009484,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009485,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009486,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009487,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009488,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009489,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009490,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009491,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009492,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.right_shift.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009493,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009494,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009495,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009496,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009497,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009498,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.right_shift.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009499,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009500,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.right_shift.lowp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009501,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009502,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.mediump_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009503,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009504,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009505,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.lowp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009506,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009507,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009508,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009509,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.lowp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009510,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009511,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009512,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009513,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.lowp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009514,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009515,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.right_shift.mediump_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009516,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.highp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009517,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009518,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009519,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009520,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009521,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009522,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009523,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.highp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009524,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009525,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009526,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009527,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009528,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009529,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009530,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009531,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009532,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009533,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009534,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009535,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009536,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009537,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009538,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009539,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009540,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009541,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009542,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009543,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009544,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.mediump_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009545,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009546,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009547,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009548,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.mediump_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009549,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009550,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.lowp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009551,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.lowp_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009552,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.mediump_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009553,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.right_shift.mediump_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009554,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.highp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009555,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009556,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.highp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009557,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009558,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.right_shift.highp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009559,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.right_shift.highp_uvec4_int_fragment");
