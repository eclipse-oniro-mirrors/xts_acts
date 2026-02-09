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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006084,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.ceil.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006085,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.ceil.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006086,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.ceil.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006087,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.ceil.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006088,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.ceil.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006089,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.ceil.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006090,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.ceil.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006091,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.ceil.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006092,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.ceil.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006093,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.ceil.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006094,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.ceil.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006095,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.ceil.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006096,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.ceil.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006097,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.ceil.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006098,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.ceil.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006099,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.ceil.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006100,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.ceil.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006101,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.ceil.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006102,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.ceil.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006103,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.ceil.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006104,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.ceil.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006105,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.ceil.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006106,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.ceil.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006107,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.ceil.highp_vec4_fragment");
