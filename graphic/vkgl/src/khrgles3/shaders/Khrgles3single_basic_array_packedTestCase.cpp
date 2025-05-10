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
#include "../ActsKhrgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001882,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001883,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001884,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001885,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001886,
        "KHR-GLES3.shaders.uniform_bloc",
        "k.single_basic_array.packed.int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001887,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001888,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001889,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001890,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001891,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001892,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001893,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001894,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.bool");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001895,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.bvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001896,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.bvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001897,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.bvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001898,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001899,
        "KHR-GLES3.shaders.uniform_block.sing",
        "le_basic_array.packed.row_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001900,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.packed.column_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001901,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001902,
        "KHR-GLES3.shaders.uniform_block.sing",
        "le_basic_array.packed.row_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001903,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.packed.column_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001904,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.packed.mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001905,
        "KHR-GLES3.shaders.uniform_block.sing",
        "le_basic_array.packed.row_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001906,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.packed.column_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001907,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.packed.mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001908,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001909,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.packed.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001910,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.packed.mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001911,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001912,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.packed.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001913,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.packed.mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001914,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001915,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.packed.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001916,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.packed.mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001917,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001918,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.packed.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001919,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.packed.mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001920,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001921,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.packed.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001922,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.packed.mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001923,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001924,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.packed.column_major_mat4x3");
