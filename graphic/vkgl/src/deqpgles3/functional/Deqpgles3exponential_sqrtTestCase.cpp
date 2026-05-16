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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012518,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.sqrt.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012519,
        "dEQP-GLES3.functional.shaders.operator.",
        "exponential.sqrt.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012520,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.sqrt.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012521,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.sqrt.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012522,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.sqrt.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012523,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.sqrt.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012524,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.sqrt.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012525,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.sqrt.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012526,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.sqrt.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012527,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.sqrt.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012528,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.sqrt.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012529,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.sqrt.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012530,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.sqrt.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012531,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.sqrt.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012532,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.sqrt.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012533,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.sqrt.highp_vec4_fragment");
