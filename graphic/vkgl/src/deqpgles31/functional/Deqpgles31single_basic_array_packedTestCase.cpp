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
#include "../ActsDeqpgles310009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008859,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008860,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.packed.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008861,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.packed.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008862,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.packed.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008863,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.packed.int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008864,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008865,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008866,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008867,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.packed.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008868,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008869,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008870,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008871,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.packed.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008872,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008873,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008874,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008875,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.packed.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008876,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.packed.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008877,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.packed.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008878,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.packed.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008879,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.packed.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008880,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.packed.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008881,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.packed.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008882,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.packed.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008883,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.packed.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008884,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008885,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.packed.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008886,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.packed.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008887,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008888,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.packed.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008889,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.packed.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008890,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008891,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.packed.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008892,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.packed.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008893,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008894,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.packed.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008895,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.packed.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008896,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008897,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.packed.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008898,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.packed.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008899,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.packed.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008900,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.packed.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008901,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.packed.column_major_mat4x3");
