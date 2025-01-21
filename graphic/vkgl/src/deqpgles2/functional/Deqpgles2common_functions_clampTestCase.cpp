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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006244,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.clamp.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006245,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006246,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006247,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.clamp.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006248,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006249,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.clamp.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006250,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.clamp.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006251,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006252,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.clamp.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006253,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006254,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.clamp.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006255,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006256,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.clamp.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006257,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006258,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.clamp.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006259,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006260,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.clamp.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006261,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006262,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.clamp.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006263,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006264,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.clamp.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006265,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006266,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.clamp.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006267,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006268,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006269,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.clamp.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006270,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006271,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006272,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.clamp.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006273,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.clamp.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006274,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006275,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.clamp.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006276,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006277,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006278,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.clamp.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006279,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.clamp.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006280,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006281,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.clamp.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006282,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006283,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006284,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.clamp.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006285,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.clamp.highp_vec4_float_fragment");
