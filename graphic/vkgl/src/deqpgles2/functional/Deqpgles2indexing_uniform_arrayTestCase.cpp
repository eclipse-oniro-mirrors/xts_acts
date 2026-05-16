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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002803,
        "dEQP-GLES2.functional.shaders.indexing",
        ".uniform_array.float_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002804,
        "dEQP-GLES2.functional.shaders.indexing.",
        "uniform_array.float_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002805,
        "dEQP-GLES2.functional.shaders.indexing.",
        "uniform_array.float_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002806,
        "dEQP-GLES2.functional.shaders.indexing.u",
        "niform_array.float_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002807,
        "dEQP-GLES2.functional.shaders.indexing.un",
        "iform_array.float_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002808,
        "dEQP-GLES2.functional.shaders.indexing.uni",
        "form_array.float_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002809,
        "dEQP-GLES2.functional.shaders.indexing.un",
        "iform_array.float_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002810,
        "dEQP-GLES2.functional.shaders.indexing.uni",
        "form_array.float_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002811,
        "dEQP-GLES2.functional.shaders.indexing",
        ".uniform_array.vec2_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002812,
        "dEQP-GLES2.functional.shaders.indexing.",
        "uniform_array.vec2_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002813,
        "dEQP-GLES2.functional.shaders.indexing",
        ".uniform_array.vec2_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002814,
        "dEQP-GLES2.functional.shaders.indexing.",
        "uniform_array.vec2_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002815,
        "dEQP-GLES2.functional.shaders.indexing.u",
        "niform_array.vec2_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002816,
        "dEQP-GLES2.functional.shaders.indexing.un",
        "iform_array.vec2_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002817,
        "dEQP-GLES2.functional.shaders.indexing.un",
        "iform_array.vec2_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002818,
        "dEQP-GLES2.functional.shaders.indexing.uni",
        "form_array.vec2_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002819,
        "dEQP-GLES2.functional.shaders.indexing",
        ".uniform_array.vec3_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002820,
        "dEQP-GLES2.functional.shaders.indexing.",
        "uniform_array.vec3_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002821,
        "dEQP-GLES2.functional.shaders.indexing",
        ".uniform_array.vec3_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002822,
        "dEQP-GLES2.functional.shaders.indexing.",
        "uniform_array.vec3_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002823,
        "dEQP-GLES2.functional.shaders.indexing.u",
        "niform_array.vec3_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002824,
        "dEQP-GLES2.functional.shaders.indexing.un",
        "iform_array.vec3_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002825,
        "dEQP-GLES2.functional.shaders.indexing.un",
        "iform_array.vec3_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002826,
        "dEQP-GLES2.functional.shaders.indexing.uni",
        "form_array.vec3_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002827,
        "dEQP-GLES2.functional.shaders.indexing",
        ".uniform_array.vec4_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002828,
        "dEQP-GLES2.functional.shaders.indexing.",
        "uniform_array.vec4_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002829,
        "dEQP-GLES2.functional.shaders.indexing",
        ".uniform_array.vec4_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002830,
        "dEQP-GLES2.functional.shaders.indexing.",
        "uniform_array.vec4_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002831,
        "dEQP-GLES2.functional.shaders.indexing.u",
        "niform_array.vec4_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002832,
        "dEQP-GLES2.functional.shaders.indexing.un",
        "iform_array.vec4_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002833,
        "dEQP-GLES2.functional.shaders.indexing.un",
        "iform_array.vec4_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002834,
        "dEQP-GLES2.functional.shaders.indexing.uni",
        "form_array.vec4_dynamic_loop_read_fragment");
