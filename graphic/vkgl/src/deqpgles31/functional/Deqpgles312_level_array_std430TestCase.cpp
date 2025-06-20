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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009289,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009290,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009291,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009292,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009293,
        "dEQP-GLES31.functional.ssbo.l",
        "ayout.2_level_array.std430.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009294,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009295,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009296,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009297,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009298,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009299,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009300,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009301,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009302,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009303,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009304,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009305,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009306,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.std430.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009307,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std430.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009308,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009309,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.std430.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009310,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std430.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009311,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std430.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009312,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.std430.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009313,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std430.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009314,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std430.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009315,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std430.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009316,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std430.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009317,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std430.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009318,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std430.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009319,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std430.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009320,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std430.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009321,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std430.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009322,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std430.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009323,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std430.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009324,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std430.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009325,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std430.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009326,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std430.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009327,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std430.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009328,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std430.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009329,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std430.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009330,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std430.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009331,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std430.column_major_mat4x3");
