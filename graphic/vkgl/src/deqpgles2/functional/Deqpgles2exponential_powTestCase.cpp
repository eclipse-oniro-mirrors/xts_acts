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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005900,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.pow.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005901,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.pow.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005902,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.pow.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005903,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.pow.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005904,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.pow.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005905,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.pow.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005906,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.pow.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005907,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.pow.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005908,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.pow.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005909,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.pow.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005910,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.pow.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005911,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.pow.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005912,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.pow.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005913,
        "dEQP-GLES2.functional.shaders.operator",
        ".exponential.pow.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005914,
        "dEQP-GLES2.functional.shaders.operat",
        "or.exponential.pow.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005915,
        "dEQP-GLES2.functional.shaders.operato",
        "r.exponential.pow.highp_vec4_fragment");
