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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012470,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012471,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.log.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012472,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.log.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012473,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012474,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012475,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.log.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012476,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.log.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012477,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012478,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012479,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.log.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012480,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.log.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012481,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012482,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012483,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.log.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012484,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.log.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012485,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.log.highp_vec4_fragment");