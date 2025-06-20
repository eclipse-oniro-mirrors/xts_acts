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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001390,
    "KHR-GL42.shaders.indexing.tmp_array.float_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001391,
    "KHR-GL42.shaders.indexing.tmp_array.float_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001392,
    "KHR-GL42.shaders.indexing.tmp_array.float_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001393,
    "KHR-GL42.shaders.indexing.tmp_array.float_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001394,
    "KHR-GL42.shaders.indexing.tmp_array.float_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001395,
    "KHR-GL42.shaders.indexing.tmp_array.float_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001396,
    "KHR-GL42.shaders.indexing.tmp_array.float_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001397,
    "KHR-GL42.shaders.indexing.tmp_array.float_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001398,
    "KHR-GL42.shaders.indexing.tmp_array.float_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001399,
    "KHR-GL42.shaders.indexing.tmp_array.float_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001400,
    "KHR-GL42.shaders.indexing.tmp_array.float_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001401,
    "KHR-GL42.shaders.indexing.tmp_array.float_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001402,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001403,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001404,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001405,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001406,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001407,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001408,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001409,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001410,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001411,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001412,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001413,
    "KHR-GL42.shaders.indexing.tmp_array.vec2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001414,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001415,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001416,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001417,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001418,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001419,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001420,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001421,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001422,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001423,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001424,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001425,
    "KHR-GL42.shaders.indexing.tmp_array.vec3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001426,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001427,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001428,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001429,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001430,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001431,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001432,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001433,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001434,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001435,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001436,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001437,
    "KHR-GL42.shaders.indexing.tmp_array.vec4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001438,
    "KHR-GL42.shaders.indexing.tmp_array.vertexid");
