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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008945,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008946,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std430.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008947,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std430.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008948,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std430.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008949,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std430.int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008950,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008951,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008952,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008953,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std430.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008954,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008955,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008956,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008957,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std430.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008958,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008959,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008960,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008961,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std430.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008962,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.std430.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008963,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.std430.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008964,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std430.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008965,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.std430.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008966,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.std430.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008967,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std430.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008968,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.std430.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008969,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.std430.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008970,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008971,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std430.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008972,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std430.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008973,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008974,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std430.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008975,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std430.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008976,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008977,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std430.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008978,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std430.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008979,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008980,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std430.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008981,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std430.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008982,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008983,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std430.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008984,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std430.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008985,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std430.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008986,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std430.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008987,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std430.column_major_mat4x3");
