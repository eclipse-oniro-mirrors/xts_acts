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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017558,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdx.texture.float_fastest.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017559,
        "dEQP-GLES3.functional.shaders.derivate.",
        "dfdx.texture.float_fastest.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017560,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdx.texture.float_fastest.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017561,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.texture.float_fastest.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017562,
        "dEQP-GLES3.functional.shaders.derivate.",
        "dfdx.texture.float_fastest.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017563,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdx.texture.float_fastest.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017564,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.texture.float_fastest.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017565,
        "dEQP-GLES3.functional.shaders.derivate.",
        "dfdx.texture.float_fastest.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017566,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdx.texture.float_fastest.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017567,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdx.texture.float_fastest.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017568,
        "dEQP-GLES3.functional.shaders.derivate.",
        "dfdx.texture.float_fastest.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017569,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdx.texture.float_fastest.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017739,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdy.texture.float_fastest.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017740,
        "dEQP-GLES3.functional.shaders.derivate.",
        "dfdy.texture.float_fastest.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017741,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdy.texture.float_fastest.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017742,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.texture.float_fastest.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017743,
        "dEQP-GLES3.functional.shaders.derivate.",
        "dfdy.texture.float_fastest.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017744,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdy.texture.float_fastest.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017745,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.texture.float_fastest.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017746,
        "dEQP-GLES3.functional.shaders.derivate.",
        "dfdy.texture.float_fastest.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017747,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdy.texture.float_fastest.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017748,
        "dEQP-GLES3.functional.shaders.derivat",
        "e.dfdy.texture.float_fastest.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017749,
        "dEQP-GLES3.functional.shaders.derivate.",
        "dfdy.texture.float_fastest.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017750,
        "dEQP-GLES3.functional.shaders.derivate",
        ".dfdy.texture.float_fastest.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017943,
        "dEQP-GLES3.functional.shaders.derivate.",
        "fwidth.texture.float_fastest.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017944,
        "dEQP-GLES3.functional.shaders.derivate.f",
        "width.texture.float_fastest.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017945,
        "dEQP-GLES3.functional.shaders.derivate.",
        "fwidth.texture.float_fastest.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017946,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.texture.float_fastest.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017947,
        "dEQP-GLES3.functional.shaders.derivate.f",
        "width.texture.float_fastest.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017948,
        "dEQP-GLES3.functional.shaders.derivate.",
        "fwidth.texture.float_fastest.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017949,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.texture.float_fastest.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017950,
        "dEQP-GLES3.functional.shaders.derivate.f",
        "width.texture.float_fastest.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017951,
        "dEQP-GLES3.functional.shaders.derivate.",
        "fwidth.texture.float_fastest.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017952,
        "dEQP-GLES3.functional.shaders.derivate",
        ".fwidth.texture.float_fastest.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017953,
        "dEQP-GLES3.functional.shaders.derivate.f",
        "width.texture.float_fastest.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017954,
        "dEQP-GLES3.functional.shaders.derivate.",
        "fwidth.texture.float_fastest.vec4_highp");
