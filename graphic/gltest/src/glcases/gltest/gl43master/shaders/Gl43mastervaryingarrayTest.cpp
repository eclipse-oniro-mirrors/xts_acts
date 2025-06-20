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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001298,
    "KHR-GL43.shaders.indexing.varying_array.float_static_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001299,
    "KHR-GL43.shaders.indexing.varying_array.float_static_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001300,
    "KHR-GL43.shaders.indexing.varying_array.float_static_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001301,
    "KHR-GL43.shaders.indexing.varying_array.float_dynamic_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001302,
    "KHR-GL43.shaders.indexing.varying_array.float_dynamic_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001303,
    "KHR-GL43.shaders.indexing.varying_array.float_dynamic_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001304,
    "KHR-GL43.shaders.indexing.varying_array.float_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001305,
    "KHR-GL43.shaders.indexing.varying_array.float_static_loop_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001306,
    "KHR-GL43.shaders.indexing.varying_array.float_static_loop_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001307,
    "KHR-GL43.shaders.indexing.varying_array.float_static_loop_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001308,
    "KHR-GL43.shaders.indexing.varying_array.float_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001309,
    "KHR-GL43.shaders.indexing.varying_array.float_dynamic_loop_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001310,
    "KHR-GL43.shaders.indexing.varying_array.float_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001311,
    "KHR-GL43.shaders.indexing.varying_array.float_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001312,
    "KHR-GL43.shaders.indexing.varying_array.float_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001313,
    "KHR-GL43.shaders.indexing.varying_array.vec2_static_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001314,
    "KHR-GL43.shaders.indexing.varying_array.vec2_static_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001315,
    "KHR-GL43.shaders.indexing.varying_array.vec2_static_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001316,
    "KHR-GL43.shaders.indexing.varying_array.vec2_dynamic_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001317,
    "KHR-GL43.shaders.indexing.varying_array.vec2_dynamic_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001318,
    "KHR-GL43.shaders.indexing.varying_array.vec2_dynamic_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001319,
    "KHR-GL43.shaders.indexing.varying_array.vec2_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001320,
    "KHR-GL43.shaders.indexing.varying_array.vec2_static_loop_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001321,
    "KHR-GL43.shaders.indexing.varying_array.vec2_static_loop_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001322,
    "KHR-GL43.shaders.indexing.varying_array.vec2_static_loop_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001323,
    "KHR-GL43.shaders.indexing.varying_array.vec2_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001324,
    "KHR-GL43.shaders.indexing.varying_array.vec2_dynamic_loop_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001325,
    "KHR-GL43.shaders.indexing.varying_array.vec2_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001326,
    "KHR-GL43.shaders.indexing.varying_array.vec2_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001327,
    "KHR-GL43.shaders.indexing.varying_array.vec2_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001328,
    "KHR-GL43.shaders.indexing.varying_array.vec3_static_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001329,
    "KHR-GL43.shaders.indexing.varying_array.vec3_static_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001330,
    "KHR-GL43.shaders.indexing.varying_array.vec3_static_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001331,
    "KHR-GL43.shaders.indexing.varying_array.vec3_dynamic_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001332,
    "KHR-GL43.shaders.indexing.varying_array.vec3_dynamic_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001333,
    "KHR-GL43.shaders.indexing.varying_array.vec3_dynamic_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001334,
    "KHR-GL43.shaders.indexing.varying_array.vec3_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001335,
    "KHR-GL43.shaders.indexing.varying_array.vec3_static_loop_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001336,
    "KHR-GL43.shaders.indexing.varying_array.vec3_static_loop_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001337,
    "KHR-GL43.shaders.indexing.varying_array.vec3_static_loop_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001338,
    "KHR-GL43.shaders.indexing.varying_array.vec3_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001339,
    "KHR-GL43.shaders.indexing.varying_array.vec3_dynamic_loop_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001340,
    "KHR-GL43.shaders.indexing.varying_array.vec3_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001341,
    "KHR-GL43.shaders.indexing.varying_array.vec3_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001342,
    "KHR-GL43.shaders.indexing.varying_array.vec3_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001343,
    "KHR-GL43.shaders.indexing.varying_array.vec4_static_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001344,
    "KHR-GL43.shaders.indexing.varying_array.vec4_static_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001345,
    "KHR-GL43.shaders.indexing.varying_array.vec4_static_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001346,
    "KHR-GL43.shaders.indexing.varying_array.vec4_dynamic_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001347,
    "KHR-GL43.shaders.indexing.varying_array.vec4_dynamic_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001348,
    "KHR-GL43.shaders.indexing.varying_array.vec4_dynamic_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001349,
    "KHR-GL43.shaders.indexing.varying_array.vec4_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001350,
    "KHR-GL43.shaders.indexing.varying_array.vec4_static_loop_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001351,
    "KHR-GL43.shaders.indexing.varying_array.vec4_static_loop_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001352,
    "KHR-GL43.shaders.indexing.varying_array.vec4_static_loop_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001353,
    "KHR-GL43.shaders.indexing.varying_array.vec4_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001354,
    "KHR-GL43.shaders.indexing.varying_array.vec4_dynamic_loop_write_static_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001355,
    "KHR-GL43.shaders.indexing.varying_array.vec4_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001356,
    "KHR-GL43.shaders.indexing.varying_array.vec4_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001357,
    "KHR-GL43.shaders.indexing.varying_array.vec4_dynamic_loop_write_dynamic_loop_read");
