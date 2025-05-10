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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009633,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009634,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009635,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009636,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009637,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.3_level_unsized_array.std430.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009638,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009639,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009640,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009641,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009642,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009643,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009644,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009645,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009646,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009647,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009648,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009649,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009650,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.std430.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009651,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std430.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009652,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009653,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.std430.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009654,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std430.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009655,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std430.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009656,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.std430.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009657,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std430.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009658,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std430.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009659,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std430.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009660,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std430.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009661,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std430.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009662,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std430.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009663,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std430.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009664,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std430.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009665,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std430.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009666,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std430.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009667,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std430.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009668,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std430.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009669,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std430.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009670,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std430.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009671,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std430.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009672,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std430.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009673,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std430.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009674,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std430.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009675,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std430.column_major_mat4x3");
