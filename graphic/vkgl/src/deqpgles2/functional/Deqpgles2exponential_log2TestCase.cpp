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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005964,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.log2.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005965,
        "dEQP-GLES2.functional.shaders.operator.",
        "exponential.log2.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005966,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.log2.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005967,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.log2.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005968,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.log2.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005969,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.log2.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005970,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.log2.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005971,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.log2.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005972,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.log2.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005973,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.log2.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005974,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.log2.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005975,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.log2.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005976,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.log2.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005977,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.log2.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005978,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.log2.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005979,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.log2.highp_vec4_fragment");
