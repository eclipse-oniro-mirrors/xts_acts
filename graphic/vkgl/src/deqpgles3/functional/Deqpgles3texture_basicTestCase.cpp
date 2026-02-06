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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017542,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.texture.basic.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017543,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.texture.basic.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017544,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.texture.basic.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017545,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.texture.basic.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017546,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.texture.basic.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017547,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.texture.basic.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017548,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.texture.basic.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017549,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.texture.basic.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017723,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.texture.basic.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017724,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdy.texture.basic.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017725,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.texture.basic.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017726,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdy.texture.basic.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017727,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.texture.basic.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017728,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdy.texture.basic.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017729,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.texture.basic.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017730,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdy.texture.basic.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017927,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.texture.basic.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017928,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.texture.basic.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017929,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.texture.basic.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017930,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.texture.basic.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017931,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.texture.basic.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017932,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.texture.basic.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017933,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.texture.basic.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017934,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.texture.basic.vec4_highp");
