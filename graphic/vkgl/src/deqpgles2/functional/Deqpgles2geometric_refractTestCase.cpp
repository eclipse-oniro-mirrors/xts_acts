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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006512,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.refract.mediump_float_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006513,
        "dEQP-GLES2.functional.shaders.operator.geo",
        "metric.refract.mediump_float_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006514,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.refract.highp_float_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006515,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.refract.highp_float_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006516,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.refract.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006517,
        "dEQP-GLES2.functional.shaders.operator.geo",
        "metric.refract.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006518,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.refract.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006519,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.refract.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006520,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.refract.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006521,
        "dEQP-GLES2.functional.shaders.operator.geo",
        "metric.refract.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006522,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.refract.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006523,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.refract.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006524,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.refract.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006525,
        "dEQP-GLES2.functional.shaders.operator.geo",
        "metric.refract.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006526,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.refract.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006527,
        "dEQP-GLES2.functional.shaders.operator.ge",
        "ometric.refract.highp_vec4_float_fragment");
