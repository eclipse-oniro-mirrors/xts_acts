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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005980,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.sqrt.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005981,
        "dEQP-GLES2.functional.shaders.operator.",
        "exponential.sqrt.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005982,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.sqrt.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005983,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.sqrt.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005984,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.sqrt.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005985,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.sqrt.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005986,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.sqrt.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005987,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.sqrt.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005988,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.sqrt.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005989,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.sqrt.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005990,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.sqrt.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005991,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.sqrt.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005992,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.sqrt.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005993,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.sqrt.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005994,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.sqrt.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005995,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.sqrt.highp_vec4_fragment");