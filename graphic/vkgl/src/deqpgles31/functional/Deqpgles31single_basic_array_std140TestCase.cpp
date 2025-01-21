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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008902,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008903,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std140.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008904,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std140.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008905,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std140.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008906,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std140.int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008907,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008908,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008909,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008910,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std140.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008911,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008912,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008913,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008914,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std140.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008915,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008916,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008917,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008918,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std140.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008919,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.std140.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008920,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.std140.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008921,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std140.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008922,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.std140.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008923,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.std140.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008924,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.std140.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008925,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.std140.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008926,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.std140.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008927,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008928,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std140.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008929,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std140.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008930,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008931,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std140.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008932,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std140.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008933,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008934,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std140.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008935,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std140.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008936,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008937,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std140.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008938,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std140.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008939,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008940,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std140.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008941,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std140.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008942,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.std140.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008943,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.std140.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008944,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.std140.column_major_mat4x3");
