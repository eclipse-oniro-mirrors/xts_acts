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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006160,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.min.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006161,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.min.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006162,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.min.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006163,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.min.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006164,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.min.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006165,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.min.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006166,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.min.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006167,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.min.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006168,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.min.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006169,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.min.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006170,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.min.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006171,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.min.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006172,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.min.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006173,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.min.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006174,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.min.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006175,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.min.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006176,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.min.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006177,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.min.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006178,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.min.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006179,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.min.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006180,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.min.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006181,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.min.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006182,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.min.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006183,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.min.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006184,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.min.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006185,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.min.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006186,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.min.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006187,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.min.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006188,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.min.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006189,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.min.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006190,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.min.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006191,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.min.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006192,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.min.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006193,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.min.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006194,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.min.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006195,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.min.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006196,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.min.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006197,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.min.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006198,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.min.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006199,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.min.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006200,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.min.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006201,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.min.highp_vec4_float_fragment");
