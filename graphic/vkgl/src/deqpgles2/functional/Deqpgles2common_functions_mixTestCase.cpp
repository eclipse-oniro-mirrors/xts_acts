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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006286,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.mix.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006287,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mix.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006288,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.mix.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006289,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.mix.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006290,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mix.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006291,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.mix.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006292,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.mix.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006293,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mix.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006294,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mix.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006295,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.mix.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006296,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.mix.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006297,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mix.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006298,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.mix.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006299,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mix.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006300,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mix.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006301,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.mix.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006302,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.mix.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006303,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mix.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006304,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.mix.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006305,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mix.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006306,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mix.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006307,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.mix.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006308,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.mix.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006309,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mix.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006310,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.mix.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006311,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mix.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006312,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mix.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006313,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.mix.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006314,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.mix.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006315,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mix.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006316,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.mix.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006317,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mix.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006318,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mix.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006319,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.mix.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006320,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.mix.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006321,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mix.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006322,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.mix.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006323,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mix.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006324,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mix.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006325,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.mix.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006326,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.mix.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006327,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mix.highp_vec4_float_fragment");
