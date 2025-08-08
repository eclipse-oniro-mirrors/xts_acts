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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012534,
        "dEQP-GLES3.functional.shaders.operator.ex",
        "ponential.inversesqrt.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012535,
        "dEQP-GLES3.functional.shaders.operator.exp",
        "onential.inversesqrt.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012536,
        "dEQP-GLES3.functional.shaders.operator.e",
        "xponential.inversesqrt.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012537,
        "dEQP-GLES3.functional.shaders.operator.ex",
        "ponential.inversesqrt.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012538,
        "dEQP-GLES3.functional.shaders.operator.ex",
        "ponential.inversesqrt.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012539,
        "dEQP-GLES3.functional.shaders.operator.exp",
        "onential.inversesqrt.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012540,
        "dEQP-GLES3.functional.shaders.operator.e",
        "xponential.inversesqrt.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012541,
        "dEQP-GLES3.functional.shaders.operator.ex",
        "ponential.inversesqrt.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012542,
        "dEQP-GLES3.functional.shaders.operator.ex",
        "ponential.inversesqrt.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012543,
        "dEQP-GLES3.functional.shaders.operator.exp",
        "onential.inversesqrt.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012544,
        "dEQP-GLES3.functional.shaders.operator.e",
        "xponential.inversesqrt.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012545,
        "dEQP-GLES3.functional.shaders.operator.ex",
        "ponential.inversesqrt.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012546,
        "dEQP-GLES3.functional.shaders.operator.ex",
        "ponential.inversesqrt.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012547,
        "dEQP-GLES3.functional.shaders.operator.exp",
        "onential.inversesqrt.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012548,
        "dEQP-GLES3.functional.shaders.operator.e",
        "xponential.inversesqrt.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012549,
        "dEQP-GLES3.functional.shaders.operator.ex",
        "ponential.inversesqrt.highp_vec4_fragment");
