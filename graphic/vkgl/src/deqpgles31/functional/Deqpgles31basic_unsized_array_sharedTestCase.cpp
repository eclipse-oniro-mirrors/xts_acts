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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008988,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008989,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008990,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008991,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008992,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.basic_unsized_array.shared.int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008993,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008994,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008995,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008996,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008997,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008998,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008999,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009000,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009001,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009002,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009003,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009004,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009005,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.shared.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009006,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.shared.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009007,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009008,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.shared.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009009,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.shared.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009010,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.basic_unsized_array.shared.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009011,
        "dEQP-GLES31.functional.ssbo.layout.bas",
        "ic_unsized_array.shared.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009012,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.shared.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009013,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.shared.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009014,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.shared.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009015,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.shared.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009016,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.shared.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009017,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.shared.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009018,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.shared.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009019,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.shared.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009020,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.shared.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009021,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.shared.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009022,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.shared.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009023,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.shared.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009024,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.shared.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009025,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.shared.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009026,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.shared.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009027,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.shared.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009028,
        "dEQP-GLES31.functional.ssbo.layout",
        ".basic_unsized_array.shared.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009029,
        "dEQP-GLES31.functional.ssbo.layout.basi",
        "c_unsized_array.shared.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_009030,
        "dEQP-GLES31.functional.ssbo.layout.basic",
        "_unsized_array.shared.column_major_mat4x3");
