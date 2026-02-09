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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006060,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.floor.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006061,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.floor.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006062,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.floor.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006063,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.floor.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006064,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.floor.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006065,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.floor.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006066,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.floor.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006067,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.floor.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006068,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.floor.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006069,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.floor.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006070,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.floor.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006071,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.floor.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006072,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.floor.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006073,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.floor.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006074,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.floor.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006075,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.floor.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006076,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.floor.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006077,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.floor.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006078,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.floor.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006079,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.floor.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006080,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.floor.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006081,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.floor.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006082,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.floor.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006083,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.floor.highp_vec4_fragment");
