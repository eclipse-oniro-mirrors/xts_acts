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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006036,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.sign.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006037,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.sign.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006038,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.sign.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006039,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.sign.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006040,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.sign.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006041,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.sign.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006042,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.sign.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006043,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.sign.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006044,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.sign.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006045,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.sign.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006046,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.sign.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006047,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.sign.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006048,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.sign.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006049,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.sign.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006050,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.sign.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006051,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.sign.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006052,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.sign.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006053,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.sign.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006054,
        "dEQP-GLES2.functional.shaders.operator",
        ".common_functions.sign.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006055,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.sign.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006056,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.sign.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006057,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.sign.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006058,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.sign.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006059,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.sign.highp_vec4_fragment");
