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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017509,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.fastest.fbo_msaa4.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017510,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.fastest.fbo_msaa4.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017511,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.fastest.fbo_msaa4.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017512,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.fastest.fbo_msaa4.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017513,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.fastest.fbo_msaa4.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017514,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.fastest.fbo_msaa4.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017515,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.fastest.fbo_msaa4.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017516,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.fastest.fbo_msaa4.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017684,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.fastest.fbo_msaa4.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017685,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.fastest.fbo_msaa4.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017686,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.fastest.fbo_msaa4.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017687,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.fastest.fbo_msaa4.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017688,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.fastest.fbo_msaa4.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017689,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.fastest.fbo_msaa4.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017690,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.fastest.fbo_msaa4.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017691,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.fastest.fbo_msaa4.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017879,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.fastest.fbo_msaa4.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017880,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.fbo_msaa4.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017881,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.fastest.fbo_msaa4.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017882,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.fbo_msaa4.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017883,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.fastest.fbo_msaa4.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017884,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.fbo_msaa4.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017885,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.fastest.fbo_msaa4.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017886,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.fbo_msaa4.vec4_highp");
