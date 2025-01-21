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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005948,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.exp2.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005949,
        "dEQP-GLES2.functional.shaders.operator.",
        "exponential.exp2.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005950,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp2.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005951,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.exp2.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005952,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp2.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005953,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.exp2.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005954,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.exp2.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005955,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp2.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005956,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp2.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005957,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.exp2.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005958,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.exp2.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005959,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp2.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005960,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp2.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005961,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.exp2.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005962,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.exp2.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005963,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp2.highp_vec4_fragment");
