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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009461,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009462,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009463,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009464,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009465,
        "dEQP-GLES31.functional.ssbo.l",
        "ayout.3_level_array.std430.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009466,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009467,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009468,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009469,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009470,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009471,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009472,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009473,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009474,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009475,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009476,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009477,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009478,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.std430.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009479,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std430.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009480,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009481,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.std430.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009482,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std430.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009483,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std430.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009484,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.std430.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009485,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std430.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009486,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std430.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009487,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std430.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009488,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std430.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009489,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std430.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009490,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std430.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009491,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std430.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009492,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std430.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009493,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std430.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009494,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std430.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009495,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std430.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009496,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std430.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009497,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std430.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009498,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std430.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009499,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std430.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009500,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std430.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009501,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std430.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009502,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std430.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009503,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std430.column_major_mat4x3");
