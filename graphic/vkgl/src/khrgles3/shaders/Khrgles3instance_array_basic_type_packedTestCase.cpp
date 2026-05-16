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

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002047,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.float");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002048,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.packed.vec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002049,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.packed.vec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002050,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.packed.vec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002051,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.packed.int");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002052,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002053,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002054,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002055,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.packed.uint");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002056,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002057,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002058,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002059,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.packed.bool");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002060,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.bvec2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002061,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.bvec3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002062,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.bvec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002063,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.packed.mat2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002064,
        "KHR-GLES3.shaders.uniform_block.instanc",
        "e_array_basic_type.packed.row_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002065,
        "KHR-GLES3.shaders.uniform_block.instance_",
        "array_basic_type.packed.column_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002066,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.packed.mat3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002067,
        "KHR-GLES3.shaders.uniform_block.instanc",
        "e_array_basic_type.packed.row_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002068,
        "KHR-GLES3.shaders.uniform_block.instance_",
        "array_basic_type.packed.column_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002069,
        "KHR-GLES3.shaders.uniform_block.in",
        "stance_array_basic_type.packed.mat4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002070,
        "KHR-GLES3.shaders.uniform_block.instanc",
        "e_array_basic_type.packed.row_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002071,
        "KHR-GLES3.shaders.uniform_block.instance_",
        "array_basic_type.packed.column_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002072,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002073,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.packed.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002074,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002075,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002076,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.packed.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002077,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002078,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002079,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.packed.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002080,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002081,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002082,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.packed.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002083,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002084,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002085,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.packed.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002086,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002087,
        "KHR-GLES3.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002088,
        "KHR-GLES3.shaders.uniform_block.instance",
        "_array_basic_type.packed.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002089,
        "KHR-GLES3.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat4x3");
