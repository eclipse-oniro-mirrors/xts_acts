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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002090,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.float");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002091,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.std140.vec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002092,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.std140.vec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002093,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.std140.vec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002094,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.std140.int");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002095,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002096,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002097,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002098,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.std140.uint");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002099,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002100,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002101,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002102,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.std140.bool");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002103,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.bvec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002104,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.bvec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002105,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.bvec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002106,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.std140.mat2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002107,
        "KHR-GLES3.shaders.uniform_block.instanc",
        "e_array_basic_type.std140.row_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002108,
        "KHR-GLES3.shaders.uniform_block.instance_",
        "array_basic_type.std140.column_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002109,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.std140.mat3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002110,
        "KHR-GLES3.shaders.uniform_block.instanc",
        "e_array_basic_type.std140.row_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002111,
        "KHR-GLES3.shaders.uniform_block.instance_",
        "array_basic_type.std140.column_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002112,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.std140.mat4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002113,
        "KHR-GLES3.shaders.uniform_block.instanc",
        "e_array_basic_type.std140.row_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002114,
        "KHR-GLES3.shaders.uniform_block.instance_",
        "array_basic_type.std140.column_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002115,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002116,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.std140.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002117,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002118,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002119,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.std140.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002120,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002121,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002122,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.std140.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002123,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002124,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002125,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.std140.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002126,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002127,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002128,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.std140.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002129,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002130,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002131,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.std140.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002132,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat4x3");
