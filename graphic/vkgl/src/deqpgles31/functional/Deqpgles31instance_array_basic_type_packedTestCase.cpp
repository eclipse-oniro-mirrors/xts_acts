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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009803,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009804,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009805,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009806,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009807,
        "dEQP-GLES31.functional.ssbo.layout.",
        "instance_array_basic_type.packed.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009808,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009809,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009810,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009811,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009812,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009813,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009814,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009815,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009816,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009817,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009818,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009819,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009820,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.packed.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009821,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.packed.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009822,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009823,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.packed.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009824,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.packed.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009825,
        "dEQP-GLES31.functional.ssbo.layout.i",
        "nstance_array_basic_type.packed.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009826,
        "dEQP-GLES31.functional.ssbo.layout.instan",
        "ce_array_basic_type.packed.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009827,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.packed.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009828,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.packed.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009829,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.packed.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009830,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.packed.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009831,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.packed.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009832,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.packed.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009833,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.packed.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009834,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.packed.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009835,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.packed.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009836,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.packed.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009837,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.packed.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009838,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.packed.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009839,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.packed.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009840,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.packed.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009841,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.packed.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009842,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.packed.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009843,
        "dEQP-GLES31.functional.ssbo.layout.in",
        "stance_array_basic_type.packed.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009844,
        "dEQP-GLES31.functional.ssbo.layout.instanc",
        "e_array_basic_type.packed.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009845,
        "dEQP-GLES31.functional.ssbo.layout.instance",
        "_array_basic_type.packed.column_major_mat4x3");
