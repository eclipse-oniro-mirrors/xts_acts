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
#include "../ActsDeqpgles20007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006480,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.faceforward.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006481,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.faceforward.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006482,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.faceforward.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006483,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.faceforward.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006484,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.faceforward.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006485,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.faceforward.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006486,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.faceforward.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006487,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.faceforward.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006488,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.faceforward.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006489,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.faceforward.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006490,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.faceforward.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006491,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.faceforward.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006492,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.faceforward.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006493,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.faceforward.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006494,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.faceforward.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006495,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.faceforward.highp_vec4_fragment");
