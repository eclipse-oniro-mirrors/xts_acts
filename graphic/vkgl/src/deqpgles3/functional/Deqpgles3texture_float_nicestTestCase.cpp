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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017570,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.texture.float_nicest.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017571,
        "dEQP-GLES3.functional.shaders.derivate.",
        "dfdx.texture.float_nicest.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017572,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdx.texture.float_nicest.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017573,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.texture.float_nicest.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017574,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdx.texture.float_nicest.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017575,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.texture.float_nicest.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017576,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.texture.float_nicest.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017577,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdx.texture.float_nicest.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017578,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.texture.float_nicest.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017579,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.texture.float_nicest.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017580,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdx.texture.float_nicest.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017581,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.texture.float_nicest.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017751,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.texture.float_nicest.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017752,
        "dEQP-GLES3.functional.shaders.derivate.",
        "dfdy.texture.float_nicest.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017753,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdy.texture.float_nicest.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017754,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.texture.float_nicest.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017755,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdy.texture.float_nicest.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017756,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.texture.float_nicest.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017757,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.texture.float_nicest.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017758,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdy.texture.float_nicest.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017759,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.texture.float_nicest.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017760,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.texture.float_nicest.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017761,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdy.texture.float_nicest.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017762,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.texture.float_nicest.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017955,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.texture.float_nicest.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017956,
        "dEQP-GLES3.functional.shaders.derivate.f",
        "width.texture.float_nicest.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017957,
        "dEQP-GLES3.functional.shaders.derivate.",
        "fwidth.texture.float_nicest.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017958,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.texture.float_nicest.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017959,
        "dEQP-GLES3.functional.shaders.derivate.",
        "fwidth.texture.float_nicest.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017960,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.texture.float_nicest.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017961,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.texture.float_nicest.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017962,
        "dEQP-GLES3.functional.shaders.derivate.",
        "fwidth.texture.float_nicest.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017963,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.texture.float_nicest.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017964,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.texture.float_nicest.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017965,
        "dEQP-GLES3.functional.shaders.derivate.",
        "fwidth.texture.float_nicest.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017966,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.texture.float_nicest.vec4_highp");
