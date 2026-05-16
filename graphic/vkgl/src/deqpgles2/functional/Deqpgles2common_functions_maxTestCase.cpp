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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006202,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.max.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006203,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.max.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006204,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.max.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006205,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.max.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006206,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.max.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006207,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.max.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006208,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.max.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006209,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.max.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006210,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.max.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006211,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.max.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006212,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.max.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006213,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.max.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006214,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.max.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006215,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.max.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006216,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.max.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006217,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.max.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006218,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.max.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006219,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.max.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006220,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.max.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006221,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.max.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006222,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.max.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006223,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.max.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006224,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.max.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006225,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.max.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006226,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.max.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006227,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.max.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006228,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.max.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006229,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.max.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006230,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.max.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006231,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.max.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006232,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.max.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006233,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.max.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006234,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.max.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006235,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.max.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006236,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.max.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006237,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.max.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006238,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.max.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006239,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.max.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006240,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.max.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006241,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.max.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006242,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.max.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006243,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.max.highp_vec4_float_fragment");
