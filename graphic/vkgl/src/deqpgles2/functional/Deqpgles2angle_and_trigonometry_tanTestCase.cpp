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
#include "../ActsDeqpgles20006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005812,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.tan.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005813,
        "dEQP-GLES2.functional.shaders.operator.angle",
        "_and_trigonometry.tan.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005814,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005815,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.tan.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005816,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005817,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.tan.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005818,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005819,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005820,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005821,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.tan.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005822,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005823,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005824,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005825,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.tan.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005826,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005827,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005828,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005829,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005830,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005831,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005832,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005833,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005834,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005835,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.lowp_vec4_fragment");
