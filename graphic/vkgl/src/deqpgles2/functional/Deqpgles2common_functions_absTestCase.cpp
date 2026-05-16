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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006012,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.abs.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006013,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.abs.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006014,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.abs.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006015,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.abs.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006016,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.abs.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006017,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.abs.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006018,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.abs.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006019,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.abs.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006020,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.abs.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006021,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.abs.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006022,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.abs.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006023,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.abs.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006024,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.abs.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006025,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.abs.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006026,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.abs.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006027,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.abs.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006028,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.abs.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006029,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.abs.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006030,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.abs.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006031,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.abs.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006032,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.abs.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006033,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.abs.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006034,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.abs.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006035,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.abs.highp_vec4_fragment");
