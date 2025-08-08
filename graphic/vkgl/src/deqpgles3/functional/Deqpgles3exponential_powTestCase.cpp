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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012438,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.pow.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012439,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.pow.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012440,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.pow.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012441,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.pow.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012442,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.pow.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012443,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.pow.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012444,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.pow.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012445,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.pow.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012446,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.pow.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012447,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.pow.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012448,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.pow.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012449,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.pow.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012450,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.pow.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012451,
        "dEQP-GLES3.functional.shaders.operator",
        ".exponential.pow.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012452,
        "dEQP-GLES3.functional.shaders.operat",
        "or.exponential.pow.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012453,
        "dEQP-GLES3.functional.shaders.operato",
        "r.exponential.pow.highp_vec4_fragment");
