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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001439,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001440,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001441,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001442,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001443,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001444,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001445,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001446,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001447,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001448,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001449,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001450,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001451,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001452,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001453,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001454,
    "KHR-GL43.shaders.indexing.vector_subscript.vec2_dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001455,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001456,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001457,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001458,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001459,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001460,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001461,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001462,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001463,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001464,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001465,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001466,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001467,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001468,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001469,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001470,
    "KHR-GL43.shaders.indexing.vector_subscript.vec3_dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001471,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001472,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001473,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001474,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001475,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001476,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001477,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001478,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001479,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001480,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001481,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001482,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001483,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001484,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001485,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001486,
    "KHR-GL43.shaders.indexing.vector_subscript.vec4_dynamic_loop_subscript_write_direct_read_fragment");
