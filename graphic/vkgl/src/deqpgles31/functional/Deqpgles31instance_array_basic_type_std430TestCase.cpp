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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009889,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009890,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009891,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009892,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009893,
        "dEQP-GLES31.functional.ssbo.layout.",
        "instance_array_basic_type.std430.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009894,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009895,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009896,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009897,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009898,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009899,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009900,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009901,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009902,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009903,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009904,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009905,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009906,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.std430.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009907,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std430.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009908,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009909,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.std430.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009910,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std430.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009911,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.std430.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009912,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.std430.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009913,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std430.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009914,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std430.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009915,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std430.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009916,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std430.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009917,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std430.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009918,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std430.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009919,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std430.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009920,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std430.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009921,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std430.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009922,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std430.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009923,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std430.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009924,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std430.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009925,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std430.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009926,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std430.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009927,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std430.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009928,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std430.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009929,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.std430.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009930,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.std430.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009931,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.std430.column_major_mat4x3");
