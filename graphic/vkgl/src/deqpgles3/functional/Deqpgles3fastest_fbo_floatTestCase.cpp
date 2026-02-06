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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017517,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.fastest.fbo_float.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017518,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.fastest.fbo_float.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017519,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.fastest.fbo_float.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017520,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.fastest.fbo_float.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017521,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.fastest.fbo_float.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017692,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.fastest.fbo_float.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017693,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.fastest.fbo_float.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017694,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.fastest.fbo_float.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017695,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.fastest.fbo_float.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017696,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.fastest.fbo_float.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017697,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.fastest.fbo_float.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017698,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.fastest.fbo_float.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017699,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.fastest.fbo_float.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017887,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.fbo_float.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017888,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.fastest.fbo_float.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017889,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.fbo_float.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017890,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.fastest.fbo_float.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017891,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.fastest.fbo_float.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017892,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.fbo_float.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017893,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.fastest.fbo_float.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017894,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.fastest.fbo_float.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017895,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.fbo_float.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017896,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.fastest.fbo_float.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017897,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.fastest.fbo_float.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017898,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.fbo_float.vec4_highp");
