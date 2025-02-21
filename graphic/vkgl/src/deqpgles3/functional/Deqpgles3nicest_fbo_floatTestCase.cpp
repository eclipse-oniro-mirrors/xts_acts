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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017537,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.nicest.fbo_float.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017538,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.nicest.fbo_float.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017539,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.nicest.fbo_float.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017540,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.nicest.fbo_float.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017541,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.nicest.fbo_float.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017715,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.nicest.fbo_float.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017716,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.nicest.fbo_float.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017717,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.nicest.fbo_float.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017718,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.nicest.fbo_float.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017719,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.nicest.fbo_float.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017720,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.nicest.fbo_float.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017721,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.nicest.fbo_float.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017722,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.nicest.fbo_float.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017915,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.fbo_float.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017916,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.nicest.fbo_float.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017917,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.nicest.fbo_float.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017918,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.fbo_float.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017919,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.nicest.fbo_float.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017920,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.fbo_float.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017921,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.fbo_float.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017922,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.nicest.fbo_float.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017923,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.fbo_float.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017924,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.fbo_float.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017925,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.nicest.fbo_float.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017926,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.fbo_float.vec4_highp");
