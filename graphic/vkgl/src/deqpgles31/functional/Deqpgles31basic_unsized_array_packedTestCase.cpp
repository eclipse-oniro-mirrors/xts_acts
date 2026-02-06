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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009031,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009032,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009033,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009034,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009035,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.basic_unsized_array.packed.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009036,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009037,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009038,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009039,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009040,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009041,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009042,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009043,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009044,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009045,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009046,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009047,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009048,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.packed.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009049,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.packed.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009050,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009051,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.packed.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009052,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.packed.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009053,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.packed.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009054,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.packed.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009055,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.packed.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009056,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.packed.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009057,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.packed.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009058,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.packed.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009059,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.packed.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009060,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.packed.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009061,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.packed.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009062,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.packed.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009063,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.packed.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009064,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.packed.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009065,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.packed.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009066,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.packed.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009067,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.packed.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009068,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.packed.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009069,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.packed.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009070,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.packed.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009071,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.packed.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009072,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.packed.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009073,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.packed.column_major_mat4x3");
