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
#include "../ActsDeqpgles30040TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039704,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rgba8_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039705,
        "dEQP-GLES3.functional.pbo",
        ".renderbuffer.rgba8_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039706,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rgba8i_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039707,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rgba8i_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039708,
        "dEQP-GLES3.functional.pbo.re",
        "nderbuffer.rgba8ui_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039709,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rgba8ui_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039710,
        "dEQP-GLES3.functional.pbo.re",
        "nderbuffer.rgba16f_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039711,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rgba16f_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039712,
        "dEQP-GLES3.functional.pbo.re",
        "nderbuffer.rgba16i_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039713,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rgba16i_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039714,
        "dEQP-GLES3.functional.pbo.re",
        "nderbuffer.rgba16ui_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039715,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rgba16ui_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039716,
        "dEQP-GLES3.functional.pbo.re",
        "nderbuffer.rgba32f_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039717,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rgba32f_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039718,
        "dEQP-GLES3.functional.pbo.re",
        "nderbuffer.rgba32i_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039719,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rgba32i_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039720,
        "dEQP-GLES3.functional.pbo.re",
        "nderbuffer.rgba32ui_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039721,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rgba32ui_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039722,
        "dEQP-GLES3.functional.pbo.rend",
        "erbuffer.srgb8_alpha8_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039723,
        "dEQP-GLES3.functional.pbo.ren",
        "derbuffer.srgb8_alpha8_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039724,
        "dEQP-GLES3.functional.pbo.re",
        "nderbuffer.rgb10_a2_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039725,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rgb10_a2_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039726,
        "dEQP-GLES3.functional.pbo.ren",
        "derbuffer.rgb10_a2ui_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039727,
        "dEQP-GLES3.functional.pbo.re",
        "nderbuffer.rgb10_a2ui_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039728,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rgba4_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039729,
        "dEQP-GLES3.functional.pbo",
        ".renderbuffer.rgba4_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039730,
        "dEQP-GLES3.functional.pbo.re",
        "nderbuffer.rgb5_a1_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039731,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rgb5_a1_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039732,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rgb8_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039733,
        "dEQP-GLES3.functional.pbo",
        ".renderbuffer.rgb8_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039734,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rgb565_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039735,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rgb565_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039736,
        "dEQP-GLES3.functional.pbo.rende",
        "rbuffer.r11f_g11f_b10f_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039737,
        "dEQP-GLES3.functional.pbo.rend",
        "erbuffer.r11f_g11f_b10f_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039738,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rg8_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039739,
        "dEQP-GLES3.functional.pb",
        "o.renderbuffer.rg8_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039740,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rg8i_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039741,
        "dEQP-GLES3.functional.pbo",
        ".renderbuffer.rg8i_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039742,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rg8ui_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039743,
        "dEQP-GLES3.functional.pbo",
        ".renderbuffer.rg8ui_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039744,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rg16f_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039745,
        "dEQP-GLES3.functional.pbo",
        ".renderbuffer.rg16f_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039746,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rg16i_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039747,
        "dEQP-GLES3.functional.pbo",
        ".renderbuffer.rg16i_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039748,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rg16ui_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039749,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rg16ui_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039750,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rg32f_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039751,
        "dEQP-GLES3.functional.pbo",
        ".renderbuffer.rg32f_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039752,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rg32i_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039753,
        "dEQP-GLES3.functional.pbo",
        ".renderbuffer.rg32i_clears");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039754,
        "dEQP-GLES3.functional.pbo.r",
        "enderbuffer.rg32ui_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039755,
        "dEQP-GLES3.functional.pbo.",
        "renderbuffer.rg32ui_clears");
