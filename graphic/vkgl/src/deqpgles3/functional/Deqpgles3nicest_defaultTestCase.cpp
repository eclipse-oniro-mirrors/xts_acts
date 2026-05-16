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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017522,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdx.nicest.default.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017523,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.nicest.default.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017524,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.nicest.default.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017525,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.nicest.default.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017526,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.nicest.default.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017527,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.nicest.default.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017528,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.nicest.default.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017700,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.dfdy.nicest.default.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017701,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.nicest.default.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017702,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.nicest.default.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017703,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdy.nicest.default.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017704,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.nicest.default.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017705,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdy.nicest.default.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017706,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdy.nicest.default.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017899,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.fwidth.nicest.default.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017900,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.default.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017901,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.default.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017902,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.nicest.default.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017903,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.default.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017904,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.nicest.default.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017905,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.nicest.default.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017906,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.nicest.default.vec4_highp");
