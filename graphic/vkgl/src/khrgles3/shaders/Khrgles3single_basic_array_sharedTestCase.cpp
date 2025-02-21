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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001839,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001840,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001841,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001842,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001843,
        "KHR-GLES3.shaders.uniform_bloc",
        "k.single_basic_array.shared.int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001844,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001845,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001846,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001847,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001848,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001849,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001850,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001851,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.bool");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001852,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.bvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001853,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.bvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001854,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.bvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001855,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001856,
        "KHR-GLES3.shaders.uniform_block.sing",
        "le_basic_array.shared.row_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001857,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.shared.column_major_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001858,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001859,
        "KHR-GLES3.shaders.uniform_block.sing",
        "le_basic_array.shared.row_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001860,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.shared.column_major_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001861,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_array.shared.mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001862,
        "KHR-GLES3.shaders.uniform_block.sing",
        "le_basic_array.shared.row_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001863,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.shared.column_major_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001864,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.shared.mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001865,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001866,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.shared.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001867,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.shared.mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001868,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001869,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.shared.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001870,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.shared.mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001871,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001872,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.shared.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001873,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.shared.mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001874,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001875,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.shared.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001876,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.shared.mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001877,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001878,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.shared.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001879,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_array.shared.mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001880,
        "KHR-GLES3.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001881,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_array.shared.column_major_mat4x3");
