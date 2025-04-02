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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005788,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.cos.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005789,
        "dEQP-GLES2.functional.shaders.operator.angle",
        "_and_trigonometry.cos.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005790,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005791,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.cos.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005792,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005793,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.cos.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005794,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005795,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005796,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005797,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.cos.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005798,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005799,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005800,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005801,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.cos.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005802,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005803,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005804,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005805,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005806,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005807,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005808,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005809,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005810,
        "dEQP-GLES2.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005811,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.lowp_vec4_fragment");
