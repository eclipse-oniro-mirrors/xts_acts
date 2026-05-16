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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009760,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009761,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009762,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009763,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009764,
        "dEQP-GLES31.functional.ssbo.layout.",
        "instance_array_basic_type.shared.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009765,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009766,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009767,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009768,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009769,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009770,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009771,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009772,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009773,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009774,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009775,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009776,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009777,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.shared.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009778,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.shared.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009779,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009780,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.shared.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009781,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.shared.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009782,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.shared.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009783,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.shared.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009784,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.shared.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009785,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.shared.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009786,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.shared.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009787,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.shared.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009788,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.shared.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009789,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.shared.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009790,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.shared.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009791,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.shared.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009792,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.shared.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009793,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.shared.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009794,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.shared.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009795,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.shared.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009796,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.shared.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009797,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.shared.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009798,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.shared.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009799,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.shared.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009800,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.shared.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009801,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.shared.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009802,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.shared.column_major_mat4x3");
