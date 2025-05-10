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
#include "../ActsDeqpgles30018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017529,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.nicest.fbo_msaa4.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017530,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.nicest.fbo_msaa4.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017531,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.nicest.fbo_msaa4.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017532,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.nicest.fbo_msaa4.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017533,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.nicest.fbo_msaa4.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017534,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.nicest.fbo_msaa4.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017535,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.nicest.fbo_msaa4.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017536,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.nicest.fbo_msaa4.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017707,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.nicest.fbo_msaa4.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017708,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.nicest.fbo_msaa4.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017709,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.nicest.fbo_msaa4.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017710,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.nicest.fbo_msaa4.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017711,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.nicest.fbo_msaa4.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017712,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.nicest.fbo_msaa4.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017713,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.nicest.fbo_msaa4.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017714,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.nicest.fbo_msaa4.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017907,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.nicest.fbo_msaa4.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017908,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.nicest.fbo_msaa4.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017909,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.nicest.fbo_msaa4.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017910,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.fbo_msaa4.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017911,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.nicest.fbo_msaa4.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017912,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.fbo_msaa4.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017913,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.nicest.fbo_msaa4.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017914,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.fbo_msaa4.vec4_highp");
