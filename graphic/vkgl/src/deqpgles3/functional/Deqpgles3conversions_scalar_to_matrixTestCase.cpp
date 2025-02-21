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
#include "../ActsDeqpgles30003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002107,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.float_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002108,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002109,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002110,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.float_to_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002111,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002112,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.float_to_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002113,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002114,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.float_to_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002115,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.float_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002116,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002117,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002118,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.float_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002119,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002120,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.float_to_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002121,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002122,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.float_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002123,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.float_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002124,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002125,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.scalar_to_matrix.int_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002126,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002127,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002128,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.int_to_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002129,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002130,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.int_to_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002131,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002132,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.int_to_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002133,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.scalar_to_matrix.int_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002134,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002135,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002136,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.int_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002137,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002138,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.int_to_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002139,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002140,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.int_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002141,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.scalar_to_matrix.int_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002142,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002143,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.uint_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002144,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.uint_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002145,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.uint_to_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002146,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.uint_to_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002147,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.uint_to_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002148,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.uint_to_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002149,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.uint_to_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002150,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.uint_to_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002151,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.uint_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002152,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.uint_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002153,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.uint_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002154,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.uint_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002155,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.uint_to_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002156,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.uint_to_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002157,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.uint_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002158,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.uint_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002159,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.uint_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002160,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.uint_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002161,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.bool_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002162,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002163,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002164,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.bool_to_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002165,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002166,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.bool_to_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002167,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002168,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.bool_to_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002169,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.bool_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002170,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002171,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002172,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.bool_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002173,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002174,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.bool_to_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002175,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002176,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_matrix.bool_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002177,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_matrix.bool_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002178,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat2_fragment");
