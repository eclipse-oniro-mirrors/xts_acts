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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009074,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009075,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009076,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009077,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009078,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.basic_unsized_array.std140.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009079,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009080,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009081,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009082,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009083,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009084,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009085,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009086,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009087,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009088,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009089,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009090,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009091,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.std140.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009092,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std140.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009093,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009094,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.std140.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009095,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std140.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009096,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.std140.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009097,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.std140.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009098,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std140.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009099,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std140.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009100,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std140.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009101,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std140.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009102,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std140.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009103,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std140.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009104,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std140.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009105,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std140.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009106,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std140.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009107,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std140.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009108,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std140.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009109,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std140.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009110,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std140.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009111,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std140.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009112,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std140.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009113,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std140.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009114,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.std140.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009115,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.std140.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009116,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.std140.column_major_mat4x3");
