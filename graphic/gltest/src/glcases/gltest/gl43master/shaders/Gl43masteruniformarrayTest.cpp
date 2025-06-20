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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001358,
    "KHR-GL43.shaders.indexing.uniform_array.float_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001359,
    "KHR-GL43.shaders.indexing.uniform_array.float_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001360,
    "KHR-GL43.shaders.indexing.uniform_array.float_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001361,
    "KHR-GL43.shaders.indexing.uniform_array.float_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001362,
    "KHR-GL43.shaders.indexing.uniform_array.float_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001363,
    "KHR-GL43.shaders.indexing.uniform_array.float_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001364,
    "KHR-GL43.shaders.indexing.uniform_array.float_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001365,
    "KHR-GL43.shaders.indexing.uniform_array.float_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001366,
    "KHR-GL43.shaders.indexing.uniform_array.vec2_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001367,
    "KHR-GL43.shaders.indexing.uniform_array.vec2_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001368,
    "KHR-GL43.shaders.indexing.uniform_array.vec2_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001369,
    "KHR-GL43.shaders.indexing.uniform_array.vec2_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001370,
    "KHR-GL43.shaders.indexing.uniform_array.vec2_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001371,
    "KHR-GL43.shaders.indexing.uniform_array.vec2_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001372,
    "KHR-GL43.shaders.indexing.uniform_array.vec2_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001373,
    "KHR-GL43.shaders.indexing.uniform_array.vec2_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001374,
    "KHR-GL43.shaders.indexing.uniform_array.vec3_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001375,
    "KHR-GL43.shaders.indexing.uniform_array.vec3_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001376,
    "KHR-GL43.shaders.indexing.uniform_array.vec3_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001377,
    "KHR-GL43.shaders.indexing.uniform_array.vec3_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001378,
    "KHR-GL43.shaders.indexing.uniform_array.vec3_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001379,
    "KHR-GL43.shaders.indexing.uniform_array.vec3_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001380,
    "KHR-GL43.shaders.indexing.uniform_array.vec3_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001381,
    "KHR-GL43.shaders.indexing.uniform_array.vec3_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001382,
    "KHR-GL43.shaders.indexing.uniform_array.vec4_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001383,
    "KHR-GL43.shaders.indexing.uniform_array.vec4_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001384,
    "KHR-GL43.shaders.indexing.uniform_array.vec4_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001385,
    "KHR-GL43.shaders.indexing.uniform_array.vec4_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001386,
    "KHR-GL43.shaders.indexing.uniform_array.vec4_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001387,
    "KHR-GL43.shaders.indexing.uniform_array.vec4_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001388,
    "KHR-GL43.shaders.indexing.uniform_array.vec4_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001389,
    "KHR-GL43.shaders.indexing.uniform_array.vec4_dynamic_loop_read_fragment");
