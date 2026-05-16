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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006015,
        "dEQP-GLES3.functional.shaders.indexing",
        ".uniform_array.float_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006016,
        "dEQP-GLES3.functional.shaders.indexing.",
        "uniform_array.float_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006017,
        "dEQP-GLES3.functional.shaders.indexing.",
        "uniform_array.float_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006018,
        "dEQP-GLES3.functional.shaders.indexing.u",
        "niform_array.float_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006019,
        "dEQP-GLES3.functional.shaders.indexing.un",
        "iform_array.float_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006020,
        "dEQP-GLES3.functional.shaders.indexing.uni",
        "form_array.float_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006021,
        "dEQP-GLES3.functional.shaders.indexing.un",
        "iform_array.float_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006022,
        "dEQP-GLES3.functional.shaders.indexing.uni",
        "form_array.float_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006023,
        "dEQP-GLES3.functional.shaders.indexing",
        ".uniform_array.vec2_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006024,
        "dEQP-GLES3.functional.shaders.indexing.",
        "uniform_array.vec2_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006025,
        "dEQP-GLES3.functional.shaders.indexing",
        ".uniform_array.vec2_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006026,
        "dEQP-GLES3.functional.shaders.indexing.",
        "uniform_array.vec2_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006027,
        "dEQP-GLES3.functional.shaders.indexing.u",
        "niform_array.vec2_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006028,
        "dEQP-GLES3.functional.shaders.indexing.un",
        "iform_array.vec2_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006029,
        "dEQP-GLES3.functional.shaders.indexing.un",
        "iform_array.vec2_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006030,
        "dEQP-GLES3.functional.shaders.indexing.uni",
        "form_array.vec2_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006031,
        "dEQP-GLES3.functional.shaders.indexing",
        ".uniform_array.vec3_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006032,
        "dEQP-GLES3.functional.shaders.indexing.",
        "uniform_array.vec3_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006033,
        "dEQP-GLES3.functional.shaders.indexing",
        ".uniform_array.vec3_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006034,
        "dEQP-GLES3.functional.shaders.indexing.",
        "uniform_array.vec3_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006035,
        "dEQP-GLES3.functional.shaders.indexing.u",
        "niform_array.vec3_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006036,
        "dEQP-GLES3.functional.shaders.indexing.un",
        "iform_array.vec3_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006037,
        "dEQP-GLES3.functional.shaders.indexing.un",
        "iform_array.vec3_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006038,
        "dEQP-GLES3.functional.shaders.indexing.uni",
        "form_array.vec3_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006039,
        "dEQP-GLES3.functional.shaders.indexing",
        ".uniform_array.vec4_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006040,
        "dEQP-GLES3.functional.shaders.indexing.",
        "uniform_array.vec4_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006041,
        "dEQP-GLES3.functional.shaders.indexing",
        ".uniform_array.vec4_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006042,
        "dEQP-GLES3.functional.shaders.indexing.",
        "uniform_array.vec4_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006043,
        "dEQP-GLES3.functional.shaders.indexing.u",
        "niform_array.vec4_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006044,
        "dEQP-GLES3.functional.shaders.indexing.un",
        "iform_array.vec4_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006045,
        "dEQP-GLES3.functional.shaders.indexing.un",
        "iform_array.vec4_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006046,
        "dEQP-GLES3.functional.shaders.indexing.uni",
        "form_array.vec4_dynamic_loop_read_fragment");
