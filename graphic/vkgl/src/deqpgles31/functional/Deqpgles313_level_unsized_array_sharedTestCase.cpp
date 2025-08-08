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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009504,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009505,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009506,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009507,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009508,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.3_level_unsized_array.shared.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009509,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009510,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009511,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009512,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009513,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009514,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009515,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009516,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009517,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009518,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009519,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009520,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009521,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.shared.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009522,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.shared.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009523,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009524,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.shared.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009525,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.shared.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009526,
        "dEQP-GLES31.functional.ssbo.layout",
        ".3_level_unsized_array.shared.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009527,
        "dEQP-GLES31.functional.ssbo.layout.3_le",
        "vel_unsized_array.shared.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009528,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.shared.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009529,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.shared.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009530,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.shared.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009531,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.shared.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009532,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.shared.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009533,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.shared.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009534,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.shared.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009535,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.shared.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009536,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.shared.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009537,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.shared.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009538,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.shared.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009539,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.shared.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009540,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.shared.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009541,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.shared.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009542,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.shared.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009543,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.shared.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009544,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_unsized_array.shared.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009545,
        "dEQP-GLES31.functional.ssbo.layout.3_lev",
        "el_unsized_array.shared.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009546,
        "dEQP-GLES31.functional.ssbo.layout.3_leve",
        "l_unsized_array.shared.column_major_mat4x3");
