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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009590,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009591,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009592,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009593,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009594,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.3_level_unsized_array.std140.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009595,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009596,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009597,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009598,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009599,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009600,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009601,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009602,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009603,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009604,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009605,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009606,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009607,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.std140.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009608,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std140.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009609,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009610,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.std140.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009611,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std140.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009612,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.std140.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009613,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.std140.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009614,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std140.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009615,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std140.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009616,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std140.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009617,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std140.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009618,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std140.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009619,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std140.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009620,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std140.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009621,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std140.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009622,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std140.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009623,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std140.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009624,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std140.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009625,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std140.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009626,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std140.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009627,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std140.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009628,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std140.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009629,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std140.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009630,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.std140.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009631,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.std140.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009632,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.std140.column_major_mat4x3");
