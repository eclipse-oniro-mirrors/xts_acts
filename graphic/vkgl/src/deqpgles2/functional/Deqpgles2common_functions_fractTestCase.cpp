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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006108,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.fract.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006109,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.fract.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006110,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.fract.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006111,
        "dEQP-GLES2.functional.shaders.operator.com",
        "mon_functions.fract.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006112,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.fract.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006113,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.fract.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006114,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.fract.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006115,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.fract.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006116,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.fract.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006117,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.fract.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006118,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.fract.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006119,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.fract.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006120,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.fract.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006121,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.fract.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006122,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.fract.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006123,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.fract.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006124,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.fract.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006125,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.fract.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006126,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.fract.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006127,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.fract.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006128,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.fract.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006129,
        "dEQP-GLES2.functional.shaders.operator.co",
        "mmon_functions.fract.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006130,
        "dEQP-GLES2.functional.shaders.operator.",
        "common_functions.fract.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006131,
        "dEQP-GLES2.functional.shaders.operator.c",
        "ommon_functions.fract.highp_vec4_fragment");
