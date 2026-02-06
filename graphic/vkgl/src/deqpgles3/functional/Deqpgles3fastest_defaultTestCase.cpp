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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017502,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.fastest.default.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017503,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.fastest.default.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017504,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.fastest.default.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017505,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.fastest.default.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017506,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.fastest.default.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017507,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.fastest.default.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017508,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.fastest.default.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017677,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.fastest.default.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017678,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.fastest.default.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017679,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.fastest.default.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017680,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.fastest.default.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017681,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.fastest.default.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017682,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.fastest.default.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017683,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.fastest.default.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017871,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.default.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017872,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.fastest.default.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017873,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.default.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017874,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.fastest.default.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017875,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.default.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017876,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.fastest.default.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017877,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.fastest.default.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017878,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.fastest.default.vec4_highp");
