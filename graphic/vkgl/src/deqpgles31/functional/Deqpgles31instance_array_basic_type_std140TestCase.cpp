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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009846,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009847,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009848,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009849,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009850,
        "dEQP-GLES31.functional.ssbo.layout.",
        "instance_array_basic_type.std140.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009851,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009852,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009853,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009854,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009855,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009856,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009857,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009858,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009859,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009860,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009861,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009862,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009863,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.std140.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009864,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std140.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009865,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009866,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.std140.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009867,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std140.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009868,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std140.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009869,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.std140.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009870,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std140.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009871,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std140.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009872,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std140.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009873,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std140.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009874,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std140.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009875,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std140.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009876,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std140.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009877,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std140.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009878,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std140.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009879,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std140.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009880,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std140.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009881,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std140.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009882,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std140.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009883,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std140.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009884,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std140.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009885,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std140.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009886,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std140.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009887,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std140.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009888,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std140.column_major_mat4x3");
