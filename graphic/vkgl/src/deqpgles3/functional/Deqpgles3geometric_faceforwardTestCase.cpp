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
#include "../ActsDeqpgles30014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013342,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.faceforward.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013343,
        "dEQP-GLES3.functional.shaders.operator.ge",
        "ometric.faceforward.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013344,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.faceforward.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013345,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.faceforward.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013346,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.faceforward.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013347,
        "dEQP-GLES3.functional.shaders.operator.ge",
        "ometric.faceforward.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013348,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.faceforward.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013349,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.faceforward.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013350,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.faceforward.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013351,
        "dEQP-GLES3.functional.shaders.operator.ge",
        "ometric.faceforward.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013352,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.faceforward.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013353,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.faceforward.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013354,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.faceforward.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013355,
        "dEQP-GLES3.functional.shaders.operator.ge",
        "ometric.faceforward.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013356,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.faceforward.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013357,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.faceforward.highp_vec4_fragment");
