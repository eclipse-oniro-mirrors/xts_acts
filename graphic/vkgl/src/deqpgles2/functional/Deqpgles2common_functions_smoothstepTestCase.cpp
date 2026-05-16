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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006370,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.smoothstep.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006371,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.smoothstep.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006372,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.smoothstep.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006373,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.smoothstep.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006374,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.smoothstep.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006375,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.smoothstep.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006376,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.smoothstep.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006377,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.smoothstep.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006378,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.smoothstep.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006379,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.smoothstep.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006380,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.smoothstep.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006381,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.smoothstep.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006382,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.smoothstep.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006383,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.smoothstep.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006384,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.smoothstep.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006385,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.smoothstep.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006386,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.smoothstep.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006387,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.smoothstep.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006388,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.smoothstep.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006389,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.smoothstep.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006390,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.smoothstep.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006391,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.smoothstep.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006392,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.smoothstep.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006393,
        "dEQP-GLES2.functional.shaders.operator.comm",
        "on_functions.smoothstep.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006394,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.smoothstep.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006395,
        "dEQP-GLES2.functional.shaders.operator.common",
        "_functions.smoothstep.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006396,
        "dEQP-GLES2.functional.shaders.operator.common_",
        "functions.smoothstep.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006397,
        "dEQP-GLES2.functional.shaders.operator.common_f",
        "unctions.smoothstep.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006398,
        "dEQP-GLES2.functional.shaders.operator.common",
        "_functions.smoothstep.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006399,
        "dEQP-GLES2.functional.shaders.operator.common_",
        "functions.smoothstep.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006400,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.smoothstep.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006401,
        "dEQP-GLES2.functional.shaders.operator.common",
        "_functions.smoothstep.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006402,
        "dEQP-GLES2.functional.shaders.operator.common_",
        "functions.smoothstep.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006403,
        "dEQP-GLES2.functional.shaders.operator.common_f",
        "unctions.smoothstep.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006404,
        "dEQP-GLES2.functional.shaders.operator.common",
        "_functions.smoothstep.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006405,
        "dEQP-GLES2.functional.shaders.operator.common_",
        "functions.smoothstep.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006406,
        "dEQP-GLES2.functional.shaders.operator.commo",
        "n_functions.smoothstep.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006407,
        "dEQP-GLES2.functional.shaders.operator.common",
        "_functions.smoothstep.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006408,
        "dEQP-GLES2.functional.shaders.operator.common_",
        "functions.smoothstep.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006409,
        "dEQP-GLES2.functional.shaders.operator.common_f",
        "unctions.smoothstep.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006410,
        "dEQP-GLES2.functional.shaders.operator.common",
        "_functions.smoothstep.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006411,
        "dEQP-GLES2.functional.shaders.operator.common_",
        "functions.smoothstep.highp_float_vec4_fragment");
