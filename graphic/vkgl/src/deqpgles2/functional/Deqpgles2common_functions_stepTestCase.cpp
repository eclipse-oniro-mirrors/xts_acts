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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006328,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.step.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006329,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.step.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006330,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.step.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006331,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.step.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006332,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.step.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006333,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.step.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006334,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.step.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006335,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.step.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006336,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.step.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006337,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.step.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006338,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.step.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006339,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.step.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006340,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.step.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006341,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.step.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006342,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.step.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006343,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.step.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006344,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.step.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006345,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.step.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006346,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.step.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006347,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.step.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006348,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.step.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006349,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.step.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006350,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.step.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006351,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.step.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006352,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.step.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006353,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.step.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006354,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.step.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006355,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.step.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006356,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.step.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006357,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.step.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006358,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.step.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006359,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.step.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006360,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.step.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006361,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.step.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006362,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.step.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006363,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.step.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006364,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.step.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006365,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.step.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006366,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.step.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006367,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.step.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006368,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.step.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006369,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.step.highp_float_vec4_fragment");
