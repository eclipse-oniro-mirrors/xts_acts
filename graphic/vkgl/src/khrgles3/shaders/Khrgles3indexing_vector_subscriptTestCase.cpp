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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000170,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec2_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000171,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c2_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000172,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec2_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000173,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c2_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000174,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec",
        "2_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000175,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec2",
        "_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000176,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec2",
        "_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000177,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec2_",
        "direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000178,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec2_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000179,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c2_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000180,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec2_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000181,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c2_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000182,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec",
        "2_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000183,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec2",
        "_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000184,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec2",
        "_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000185,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec2_",
        "dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000186,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec3_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000187,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c3_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000188,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec3_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000189,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c3_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000190,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec",
        "3_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000191,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec3",
        "_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000192,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec3",
        "_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000193,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec3_",
        "direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000194,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec3_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000195,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c3_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000196,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec3_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000197,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c3_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000198,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec",
        "3_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000199,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec3",
        "_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000200,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec3",
        "_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000201,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec3_",
        "dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000202,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec4_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000203,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c4_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000204,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec4_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000205,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c4_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000206,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec",
        "4_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000207,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec4",
        "_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000208,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec4",
        "_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000209,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec4_",
        "direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000210,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec4_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000211,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c4_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000212,
        "KHR-GLES3.shaders.indexing.vector_subscript.v",
        "ec4_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000213,
        "KHR-GLES3.shaders.indexing.vector_subscript.ve",
        "c4_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000214,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec",
        "4_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000215,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec4",
        "_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000216,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec4",
        "_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000217,
        "KHR-GLES3.shaders.indexing.vector_subscript.vec4_",
        "dynamic_loop_subscript_write_direct_read_fragment");
