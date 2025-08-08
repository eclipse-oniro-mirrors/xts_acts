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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005916,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005917,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.exp.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005918,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.exp.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005919,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005920,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005921,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.exp.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005922,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.exp.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005923,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005924,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005925,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.exp.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005926,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.exp.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005927,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005928,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005929,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.exp.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005930,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.exp.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005931,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.exp.highp_vec4_fragment");
