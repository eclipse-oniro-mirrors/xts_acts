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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001925,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001926,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001927,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001928,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001929,
        "KHR-GLES3.shaders.uniform_bloc",
        "k.single_basic_array.std140.int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001930,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001931,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001932,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001933,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001934,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001935,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001936,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001937,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.bool");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001938,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.bvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001939,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.bvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001940,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.bvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001941,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001942,
        "KHR-GLES3.shaders.uniform_block.sing",
        "le_basic_array.std140.row_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001943,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.std140.column_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001944,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001945,
        "KHR-GLES3.shaders.uniform_block.sing",
        "le_basic_array.std140.row_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001946,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.std140.column_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001947,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.std140.mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001948,
        "KHR-GLES3.shaders.uniform_block.sing",
        "le_basic_array.std140.row_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001949,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.std140.column_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001950,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.std140.mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001951,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001952,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.std140.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001953,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.std140.mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001954,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001955,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.std140.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001956,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.std140.mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001957,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001958,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.std140.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001959,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.std140.mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001960,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001961,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.std140.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001962,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.std140.mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001963,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001964,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.std140.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001965,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.std140.mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001966,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001967,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.std140.column_major_mat4x3");
