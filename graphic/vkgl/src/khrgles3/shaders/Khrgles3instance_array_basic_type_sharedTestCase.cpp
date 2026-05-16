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

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002004,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.float");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002005,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.shared.vec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002006,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.shared.vec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002007,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.shared.vec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002008,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.shared.int");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002009,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002010,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002011,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002012,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.shared.uint");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002013,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002014,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002015,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002016,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.shared.bool");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002017,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.bvec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002018,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.bvec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002019,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.bvec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002020,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.shared.mat2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002021,
        "KHR-GLES3.shaders.uniform_block.instanc",
        "e_array_basic_type.shared.row_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002022,
        "KHR-GLES3.shaders.uniform_block.instance_",
        "array_basic_type.shared.column_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002023,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.shared.mat3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002024,
        "KHR-GLES3.shaders.uniform_block.instanc",
        "e_array_basic_type.shared.row_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002025,
        "KHR-GLES3.shaders.uniform_block.instance_",
        "array_basic_type.shared.column_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002026,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.shared.mat4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002027,
        "KHR-GLES3.shaders.uniform_block.instanc",
        "e_array_basic_type.shared.row_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002028,
        "KHR-GLES3.shaders.uniform_block.instance_",
        "array_basic_type.shared.column_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002029,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002030,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.shared.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002031,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002032,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002033,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.shared.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002034,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002035,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002036,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.shared.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002037,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002038,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002039,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.shared.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002040,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002041,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002042,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.shared.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002043,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002044,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002045,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.shared.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002046,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat4x3");
