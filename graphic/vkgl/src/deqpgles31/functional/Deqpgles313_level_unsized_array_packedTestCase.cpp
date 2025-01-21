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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009547,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009548,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009549,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009550,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009551,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.3_level_unsized_array.packed.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009552,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009553,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009554,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009555,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009556,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009557,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009558,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009559,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009560,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009561,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009562,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009563,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009564,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.packed.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009565,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.packed.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009566,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009567,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.packed.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009568,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.packed.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009569,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.packed.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009570,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.packed.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009571,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.packed.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009572,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.packed.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009573,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.packed.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009574,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.packed.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009575,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.packed.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009576,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.packed.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009577,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.packed.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009578,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.packed.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009579,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.packed.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009580,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.packed.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009581,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.packed.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009582,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.packed.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009583,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.packed.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009584,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.packed.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009585,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.packed.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009586,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.packed.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009587,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.packed.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009588,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.packed.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009589,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.packed.column_major_mat4x3");
