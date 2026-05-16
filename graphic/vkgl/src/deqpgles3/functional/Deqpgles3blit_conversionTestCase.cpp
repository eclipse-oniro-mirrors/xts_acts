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
#include "../ActsDeqpgles30033TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032116,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba32i_to_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032117,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba32i_to_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032118,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32i_to_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032119,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32i_to_rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032120,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32i_to_rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032121,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba32i_to_rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032122,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba32i_to_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032123,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba32i_to_r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032124,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba32i_to_r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032125,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgba32ui_to_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032126,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgba32ui_to_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032127,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba32ui_to_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032128,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rgba32ui_to_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032129,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba32ui_to_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032130,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba32ui_to_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032131,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32ui_to_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032132,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32ui_to_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032133,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32ui_to_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032134,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32ui_to_r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032135,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba16i_to_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032136,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba16i_to_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032137,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16i_to_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032138,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16i_to_rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032139,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16i_to_rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032140,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba16i_to_rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032141,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba16i_to_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032142,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba16i_to_r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032143,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba16i_to_r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032144,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgba16ui_to_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032145,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgba16ui_to_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032146,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba16ui_to_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032147,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rgba16ui_to_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032148,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba16ui_to_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032149,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba16ui_to_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032150,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16ui_to_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032151,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16ui_to_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032152,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16ui_to_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032153,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16ui_to_r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032154,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba8_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032155,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgba8_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032156,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032157,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba8_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032158,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032159,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgba8_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032160,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba8_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032161,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgba8_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032162,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.rgba8_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032163,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032164,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032165,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rgba8_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032166,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba8_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032167,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba8_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032168,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgba8_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032169,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgba8_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032170,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8i_to_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032171,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8i_to_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032172,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8i_to_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032173,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba8i_to_rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032174,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba8i_to_rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032175,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba8i_to_rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032176,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba8i_to_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032177,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba8i_to_r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032178,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgba8i_to_r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032179,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba8ui_to_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032180,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba8ui_to_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032181,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba8ui_to_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032182,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgba8ui_to_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032183,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8ui_to_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032184,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8ui_to_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032185,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8ui_to_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032186,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8ui_to_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032187,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba8ui_to_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032188,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba8ui_to_r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032189,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.srgb8_alpha8_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032190,
        "dEQP-GLES3.functional.fbo.blit.conv",
        "ersion.srgb8_alpha8_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032191,
        "dEQP-GLES3.functional.fbo.blit.co",
        "nversion.srgb8_alpha8_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032192,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.srgb8_alpha8_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032193,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.srgb8_alpha8_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032194,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.srgb8_alpha8_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032195,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.srgb8_alpha8_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032196,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.srgb8_alpha8_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032197,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.srgb8_alpha8_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032198,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.srgb8_alpha8_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032199,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.srgb8_alpha8_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032200,
        "dEQP-GLES3.functional.fbo.blit.conve",
        "rsion.srgb8_alpha8_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032201,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.srgb8_alpha8_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032202,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.srgb8_alpha8_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032203,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.srgb8_alpha8_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032204,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.srgb8_alpha8_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032205,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb10_a2_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032206,
        "dEQP-GLES3.functional.fbo.blit.co",
        "nversion.rgb10_a2_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032207,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgb10_a2_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032208,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb10_a2_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032209,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb10_a2_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032210,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb10_a2_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032211,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb10_a2_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032212,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb10_a2_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032213,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb10_a2_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032214,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb10_a2_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032215,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb10_a2_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032216,
        "dEQP-GLES3.functional.fbo.blit.con",
        "version.rgb10_a2_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032217,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb10_a2_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032218,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb10_a2_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032219,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb10_a2_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032220,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb10_a2_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032221,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rgb10_a2ui_to_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032222,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rgb10_a2ui_to_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032223,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgb10_a2ui_to_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032224,
        "dEQP-GLES3.functional.fbo.blit.co",
        "nversion.rgb10_a2ui_to_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032225,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgb10_a2ui_to_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032226,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgb10_a2ui_to_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032227,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb10_a2ui_to_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032228,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb10_a2ui_to_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032229,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb10_a2ui_to_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032230,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb10_a2ui_to_r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032231,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba4_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032232,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgba4_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032233,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba4_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032234,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba4_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032235,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba4_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032236,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgba4_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032237,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba4_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032238,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgba4_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032239,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.rgba4_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032240,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba4_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032241,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba4_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032242,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rgba4_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032243,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba4_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032244,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba4_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032245,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgba4_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032246,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgba4_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032247,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb5_a1_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032248,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rgb5_a1_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032249,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb5_a1_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032250,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb5_a1_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032251,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb5_a1_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032252,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb5_a1_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032253,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb5_a1_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032254,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb5_a1_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032255,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgb5_a1_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032256,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb5_a1_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032257,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb5_a1_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032258,
        "dEQP-GLES3.functional.fbo.blit.co",
        "nversion.rgb5_a1_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032259,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb5_a1_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032260,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb5_a1_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032261,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb5_a1_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032262,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb5_a1_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032263,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgb8_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032264,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rgb8_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032265,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb8_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032266,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgb8_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032267,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb8_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032268,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgb8_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032269,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb8_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032270,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.rgb8_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032271,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.rgb8_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032272,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb8_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032273,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb8_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032274,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rgb8_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032275,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgb8_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032276,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgb8_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032277,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgb8_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032278,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgb8_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032279,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb565_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032280,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rgb565_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032281,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgb565_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032282,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb565_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032283,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb565_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032284,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb565_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032285,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb565_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032286,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgb565_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032287,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgb565_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032288,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb565_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032289,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgb565_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032290,
        "dEQP-GLES3.functional.fbo.blit.co",
        "nversion.rgb565_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032291,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb565_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032292,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb565_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032293,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb565_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032294,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgb565_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032295,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg32i_to_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032296,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg32i_to_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032297,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32i_to_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032298,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32i_to_rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032299,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32i_to_rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032300,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg32i_to_rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032301,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg32i_to_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032302,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg32i_to_r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032303,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg32i_to_r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032304,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rg32ui_to_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032305,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rg32ui_to_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032306,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg32ui_to_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032307,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rg32ui_to_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032308,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg32ui_to_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032309,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg32ui_to_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032310,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32ui_to_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032311,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32ui_to_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032312,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32ui_to_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032313,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32ui_to_r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032314,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg16i_to_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032315,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg16i_to_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032316,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16i_to_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032317,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16i_to_rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032318,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16i_to_rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032319,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg16i_to_rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032320,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg16i_to_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032321,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg16i_to_r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032322,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg16i_to_r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032323,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rg16ui_to_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032324,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rg16ui_to_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032325,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg16ui_to_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032326,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rg16ui_to_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032327,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg16ui_to_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032328,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg16ui_to_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032329,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16ui_to_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032330,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16ui_to_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032331,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16ui_to_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032332,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16ui_to_r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032333,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg8_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032334,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rg8_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032335,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032336,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg8_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032337,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032338,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.rg8_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032339,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg8_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032340,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.rg8_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032341,
        "dEQP-GLES3.functional.fbo",
        ".blit.conversion.rg8_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032342,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032343,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032344,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rg8_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032345,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg8_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032346,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg8_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032347,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.rg8_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032348,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.rg8_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032349,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8i_to_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032350,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8i_to_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032351,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8i_to_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032352,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg8i_to_rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032353,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg8i_to_rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032354,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg8i_to_rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032355,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg8i_to_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032356,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg8i_to_r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032357,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.rg8i_to_r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032358,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg8ui_to_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032359,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg8ui_to_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032360,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg8ui_to_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032361,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rg8ui_to_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032362,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8ui_to_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032363,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8ui_to_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032364,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8ui_to_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032365,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8ui_to_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032366,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg8ui_to_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032367,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg8ui_to_r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032368,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32i_to_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032369,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32i_to_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032370,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32i_to_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032371,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32i_to_rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032372,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32i_to_rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032373,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32i_to_rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032374,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32i_to_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032375,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32i_to_r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032376,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r32i_to_r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032377,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.r32ui_to_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032378,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.r32ui_to_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032379,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.r32ui_to_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032380,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.r32ui_to_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032381,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32ui_to_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032382,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32ui_to_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032383,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32ui_to_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032384,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32ui_to_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032385,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32ui_to_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032386,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32ui_to_r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032387,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16i_to_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032388,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16i_to_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032389,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16i_to_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032390,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16i_to_rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032391,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16i_to_rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032392,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16i_to_rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032393,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16i_to_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032394,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16i_to_r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032395,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r16i_to_r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032396,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.r16ui_to_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032397,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.r16ui_to_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032398,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.r16ui_to_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032399,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.r16ui_to_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032400,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16ui_to_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032401,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16ui_to_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032402,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16ui_to_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032403,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16ui_to_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032404,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16ui_to_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032405,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16ui_to_r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032406,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r8_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032407,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.r8_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032408,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r8_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032409,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r8_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032410,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r8_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032411,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r8_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032412,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r8_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032413,
        "dEQP-GLES3.functional.fbo",
        ".blit.conversion.r8_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032414,
        "dEQP-GLES3.functional.fbo",
        ".blit.conversion.r8_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032415,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r8_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032416,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r8_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032417,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.r8_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032418,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r8_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032419,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r8_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032420,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r8_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032421,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r8_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032422,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r8i_to_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032423,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r8i_to_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032424,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r8i_to_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032425,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r8i_to_rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032426,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r8i_to_rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032427,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r8i_to_rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032428,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r8i_to_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032429,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r8i_to_r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032430,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r8i_to_r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032431,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.r8ui_to_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032432,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.r8ui_to_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032433,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r8ui_to_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032434,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.r8ui_to_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032435,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r8ui_to_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032436,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r8ui_to_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032437,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r8ui_to_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032438,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r8ui_to_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032439,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r8ui_to_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032440,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r8ui_to_r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032441,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32f_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032442,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rgba32f_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032443,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba32f_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032444,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32f_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032445,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba32f_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032446,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba32f_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032447,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32f_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032448,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba32f_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032449,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgba32f_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032450,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba32f_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032451,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba32f_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032452,
        "dEQP-GLES3.functional.fbo.blit.co",
        "nversion.rgba32f_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032453,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32f_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032454,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba32f_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032455,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba32f_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032456,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba32f_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032457,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16f_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032458,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rgba16f_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032459,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba16f_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032460,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16f_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032461,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba16f_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032462,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba16f_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032463,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16f_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032464,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba16f_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032465,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rgba16f_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032466,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba16f_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032467,
        "dEQP-GLES3.functional.fbo.blit",
        ".conversion.rgba16f_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032468,
        "dEQP-GLES3.functional.fbo.blit.co",
        "nversion.rgba16f_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032469,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16f_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032470,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rgba16f_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032471,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba16f_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032472,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rgba16f_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032473,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.r11f_g11f_b10f_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032474,
        "dEQP-GLES3.functional.fbo.blit.conve",
        "rsion.r11f_g11f_b10f_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032475,
        "dEQP-GLES3.functional.fbo.blit.con",
        "version.r11f_g11f_b10f_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032476,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.r11f_g11f_b10f_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032477,
        "dEQP-GLES3.functional.fbo.blit.co",
        "nversion.r11f_g11f_b10f_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032478,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.r11f_g11f_b10f_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032479,
        "dEQP-GLES3.functional.fbo.blit.co",
        "nversion.r11f_g11f_b10f_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032480,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.r11f_g11f_b10f_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032481,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.r11f_g11f_b10f_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032482,
        "dEQP-GLES3.functional.fbo.blit.co",
        "nversion.r11f_g11f_b10f_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032483,
        "dEQP-GLES3.functional.fbo.blit.co",
        "nversion.r11f_g11f_b10f_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032484,
        "dEQP-GLES3.functional.fbo.blit.conver",
        "sion.r11f_g11f_b10f_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032485,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.r11f_g11f_b10f_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032486,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.r11f_g11f_b10f_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032487,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.r11f_g11f_b10f_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032488,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.r11f_g11f_b10f_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032489,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32f_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032490,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rg32f_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032491,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg32f_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032492,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32f_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032493,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg32f_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032494,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg32f_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032495,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32f_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032496,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg32f_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032497,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.rg32f_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032498,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg32f_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032499,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg32f_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032500,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rg32f_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032501,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32f_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032502,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg32f_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032503,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg32f_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032504,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg32f_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032505,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16f_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032506,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.rg16f_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032507,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg16f_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032508,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16f_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032509,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg16f_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032510,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg16f_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032511,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16f_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032512,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg16f_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032513,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.rg16f_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032514,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg16f_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032515,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.rg16f_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032516,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.rg16f_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032517,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16f_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032518,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.rg16f_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032519,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg16f_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032520,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.rg16f_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032521,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32f_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032522,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.r32f_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032523,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.r32f_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032524,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32f_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032525,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32f_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032526,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32f_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032527,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32f_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032528,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r32f_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032529,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r32f_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032530,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32f_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032531,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r32f_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032532,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.r32f_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032533,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32f_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032534,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32f_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032535,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32f_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032536,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r32f_to_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032537,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16f_to_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032538,
        "dEQP-GLES3.functional.fbo.blit.",
        "conversion.r16f_to_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032539,
        "dEQP-GLES3.functional.fbo.bli",
        "t.conversion.r16f_to_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032540,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16f_to_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032541,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16f_to_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032542,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16f_to_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032543,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16f_to_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032544,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r16f_to_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032545,
        "dEQP-GLES3.functional.fbo.",
        "blit.conversion.r16f_to_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032546,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16f_to_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032547,
        "dEQP-GLES3.functional.fbo.bl",
        "it.conversion.r16f_to_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032548,
        "dEQP-GLES3.functional.fbo.blit.c",
        "onversion.r16f_to_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032549,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16f_to_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032550,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16f_to_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032551,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16f_to_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032552,
        "dEQP-GLES3.functional.fbo.b",
        "lit.conversion.r16f_to_r16f");
