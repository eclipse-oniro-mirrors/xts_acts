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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006132,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.mod.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006133,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.mod.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006134,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mod.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006135,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.mod.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006136,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mod.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006137,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.mod.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006138,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.mod.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006139,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mod.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006140,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mod.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006141,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.mod.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006142,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.mod.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006143,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mod.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006144,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mod.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006145,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.mod.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006146,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.mod.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006147,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.mod.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006148,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mod.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006149,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.mod.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006150,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.mod.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006151,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mod.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006152,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mod.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006153,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.mod.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006154,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.mod.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006155,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mod.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006156,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mod.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006157,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.mod.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006158,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.mod.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006159,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.mod.highp_vec4_float_fragment");
