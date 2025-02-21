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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001446,
        "KHR-GLES3.shaders.stru",
        "ct.uniform.basic_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001447,
        "KHR-GLES3.shaders.struc",
        "t.uniform.basic_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001448,
        "KHR-GLES3.shaders.struc",
        "t.uniform.nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001449,
        "KHR-GLES3.shaders.struct",
        ".uniform.nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001450,
        "KHR-GLES3.shaders.struct.u",
        "niform.array_member_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001451,
        "KHR-GLES3.shaders.struct.un",
        "iform.array_member_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001452,
        "KHR-GLES3.shaders.struct.uniform.",
        "array_member_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001453,
        "KHR-GLES3.shaders.struct.uniform.a",
        "rray_member_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001454,
        "KHR-GLES3.shaders.struct.u",
        "niform.struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001455,
        "KHR-GLES3.shaders.struct.un",
        "iform.struct_array_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001456,
        "KHR-GLES3.shaders.struct.uniform.",
        "struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001457,
        "KHR-GLES3.shaders.struct.uniform.s",
        "truct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001458,
        "KHR-GLES3.shaders.struct.unif",
        "orm.nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001459,
        "KHR-GLES3.shaders.struct.unifo",
        "rm.nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001460,
        "KHR-GLES3.shaders.struct.uniform.nes",
        "ted_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001461,
        "KHR-GLES3.shaders.struct.uniform.nest",
        "ed_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001462,
        "KHR-GLES3.shaders.struct.uni",
        "form.loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001463,
        "KHR-GLES3.shaders.struct.unif",
        "orm.loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001464,
        "KHR-GLES3.shaders.struct.uniform",
        ".loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001465,
        "KHR-GLES3.shaders.struct.uniform.",
        "loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001466,
        "KHR-GLES3.shaders.struct.uniform",
        ".dynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001467,
        "KHR-GLES3.shaders.struct.uniform.",
        "dynamic_loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001468,
        "KHR-GLES3.shaders.struct.uniform.dyn",
        "amic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001469,
        "KHR-GLES3.shaders.struct.uniform.dyna",
        "mic_loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001470,
        "KHR-GLES3.shaders.struc",
        "t.uniform.sampler_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001471,
        "KHR-GLES3.shaders.struct",
        ".uniform.sampler_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001472,
        "KHR-GLES3.shaders.struct.un",
        "iform.sampler_nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001473,
        "KHR-GLES3.shaders.struct.uni",
        "form.sampler_nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001474,
        "KHR-GLES3.shaders.struct.u",
        "niform.sampler_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001475,
        "KHR-GLES3.shaders.struct.un",
        "iform.sampler_array_fragment");
