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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012502,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.log2.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012503,
        "dEQP-GLES3.functional.shaders.operator.",
        "exponential.log2.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012504,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log2.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012505,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.log2.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012506,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log2.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012507,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.log2.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012508,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.log2.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012509,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log2.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012510,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log2.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012511,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.log2.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012512,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.log2.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012513,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log2.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012514,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log2.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012515,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.log2.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012516,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.log2.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012517,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log2.highp_vec4_fragment");
