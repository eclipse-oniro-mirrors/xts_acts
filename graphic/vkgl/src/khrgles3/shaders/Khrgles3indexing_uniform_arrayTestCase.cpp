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
#include "../ActsKhrgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000089,
        "KHR-GLES3.shaders.indexing.unifo",
        "rm_array.float_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000090,
        "KHR-GLES3.shaders.indexing.unifor",
        "m_array.float_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000091,
        "KHR-GLES3.shaders.indexing.unifor",
        "m_array.float_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000092,
        "KHR-GLES3.shaders.indexing.uniform",
        "_array.float_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000093,
        "KHR-GLES3.shaders.indexing.uniform_",
        "array.float_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000094,
        "KHR-GLES3.shaders.indexing.uniform_a",
        "rray.float_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000095,
        "KHR-GLES3.shaders.indexing.uniform_",
        "array.float_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000096,
        "KHR-GLES3.shaders.indexing.uniform_a",
        "rray.float_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000097,
        "KHR-GLES3.shaders.indexing.unifo",
        "rm_array.vec2_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000098,
        "KHR-GLES3.shaders.indexing.unifor",
        "m_array.vec2_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000099,
        "KHR-GLES3.shaders.indexing.unifo",
        "rm_array.vec2_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000100,
        "KHR-GLES3.shaders.indexing.unifor",
        "m_array.vec2_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000101,
        "KHR-GLES3.shaders.indexing.uniform",
        "_array.vec2_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000102,
        "KHR-GLES3.shaders.indexing.uniform_",
        "array.vec2_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000103,
        "KHR-GLES3.shaders.indexing.uniform_",
        "array.vec2_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000104,
        "KHR-GLES3.shaders.indexing.uniform_a",
        "rray.vec2_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000105,
        "KHR-GLES3.shaders.indexing.unifo",
        "rm_array.vec3_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000106,
        "KHR-GLES3.shaders.indexing.unifor",
        "m_array.vec3_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000107,
        "KHR-GLES3.shaders.indexing.unifo",
        "rm_array.vec3_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000108,
        "KHR-GLES3.shaders.indexing.unifor",
        "m_array.vec3_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000109,
        "KHR-GLES3.shaders.indexing.uniform",
        "_array.vec3_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000110,
        "KHR-GLES3.shaders.indexing.uniform_",
        "array.vec3_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000111,
        "KHR-GLES3.shaders.indexing.uniform_",
        "array.vec3_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000112,
        "KHR-GLES3.shaders.indexing.uniform_a",
        "rray.vec3_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000113,
        "KHR-GLES3.shaders.indexing.unifo",
        "rm_array.vec4_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000114,
        "KHR-GLES3.shaders.indexing.unifor",
        "m_array.vec4_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000115,
        "KHR-GLES3.shaders.indexing.unifo",
        "rm_array.vec4_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000116,
        "KHR-GLES3.shaders.indexing.unifor",
        "m_array.vec4_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000117,
        "KHR-GLES3.shaders.indexing.uniform",
        "_array.vec4_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000118,
        "KHR-GLES3.shaders.indexing.uniform_",
        "array.vec4_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000119,
        "KHR-GLES3.shaders.indexing.uniform_",
        "array.vec4_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000120,
        "KHR-GLES3.shaders.indexing.uniform_a",
        "rray.vec4_dynamic_loop_read_fragment");
