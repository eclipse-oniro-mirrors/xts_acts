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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008816,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008817,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.shared.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008818,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.shared.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008819,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.shared.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008820,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.shared.int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008821,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008822,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008823,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008824,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.shared.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008825,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008826,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008827,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008828,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.shared.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008829,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008830,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008831,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008832,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.shared.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008833,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.shared.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008834,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.shared.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008835,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.shared.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008836,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.shared.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008837,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.shared.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008838,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_array.shared.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008839,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_array.shared.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008840,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_array.shared.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008841,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008842,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.shared.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008843,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.shared.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008844,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008845,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.shared.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008846,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.shared.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008847,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008848,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.shared.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008849,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.shared.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008850,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008851,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.shared.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008852,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.shared.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008853,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008854,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.shared.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008855,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.shared.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008856,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.single_basic_array.shared.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008857,
        "dEQP-GLES31.functional.ssbo.layout.sin",
        "gle_basic_array.shared.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008858,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_array.shared.column_major_mat4x3");
