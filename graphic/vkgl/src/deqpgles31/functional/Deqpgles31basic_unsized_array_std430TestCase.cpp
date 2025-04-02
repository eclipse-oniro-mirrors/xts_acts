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
#include "../ActsDeqpgles310010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009117,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009118,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009119,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009120,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009121,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.basic_unsized_array.std430.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009122,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009123,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009124,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009125,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009126,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009127,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009128,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009129,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009130,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009131,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009132,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009133,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009134,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.std430.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009135,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std430.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009136,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009137,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.std430.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009138,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std430.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009139,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std430.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009140,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.std430.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009141,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std430.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009142,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std430.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009143,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std430.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009144,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std430.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009145,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std430.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009146,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std430.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009147,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std430.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009148,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std430.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009149,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std430.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009150,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std430.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009151,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std430.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009152,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std430.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009153,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std430.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009154,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std430.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009155,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std430.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009156,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std430.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009157,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std430.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009158,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std430.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009159,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std430.column_major_mat4x3");
