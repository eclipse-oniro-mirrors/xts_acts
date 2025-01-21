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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005836,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005837,
        "dEQP-GLES2.functional.shaders.operator.angle",
        "_and_trigonometry.asin.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005838,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.asin.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005839,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005840,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005841,
        "dEQP-GLES2.functional.shaders.operator.angle",
        "_and_trigonometry.asin.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005842,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.asin.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005843,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005844,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005845,
        "dEQP-GLES2.functional.shaders.operator.angle",
        "_and_trigonometry.asin.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005846,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.asin.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005847,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005848,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005849,
        "dEQP-GLES2.functional.shaders.operator.angle",
        "_and_trigonometry.asin.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005850,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.asin.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005851,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.highp_vec4_fragment");
