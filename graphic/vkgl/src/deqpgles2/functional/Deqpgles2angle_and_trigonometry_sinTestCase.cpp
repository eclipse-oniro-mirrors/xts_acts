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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005764,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.sin.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005765,
        "dEQP-GLES2.functional.shaders.operator.angle",
        "_and_trigonometry.sin.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005766,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005767,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.sin.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005768,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005769,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.sin.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005770,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005771,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005772,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005773,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.sin.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005774,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005775,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005776,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005777,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.sin.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005778,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005779,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005780,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005781,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005782,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005783,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005784,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005785,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005786,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005787,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.lowp_vec4_fragment");
