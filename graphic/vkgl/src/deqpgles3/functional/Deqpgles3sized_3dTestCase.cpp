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
#include "../ActsDeqpgles30023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022223,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgba32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022224,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgba32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022225,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgba32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022226,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgba32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022227,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgba32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022228,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgba32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022229,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgba16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022230,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgba16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022231,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgba16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022232,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgba16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022233,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgba16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022234,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgba16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022235,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rgba8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022236,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgba8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022237,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgba8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022238,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgba8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022239,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgba8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022240,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgba8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022241,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.3d.srgb8_alpha8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022242,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.3d.srgb8_alpha8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022243,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.srgb_r8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022244,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.srgb_r8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022245,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.srgb_rg8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022246,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.srgb_rg8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022247,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgb10_a2_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022248,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgb10_a2_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022249,
        "dEQP-GLES3.functional.texture.",
        "format.sized.3d.rgb10_a2ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022250,
        "dEQP-GLES3.functional.texture.",
        "format.sized.3d.rgb10_a2ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022251,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rgba4_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022252,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgba4_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022253,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb5_a1_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022254,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgb5_a1_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022255,
        "dEQP-GLES3.functional.texture.",
        "format.sized.3d.rgba8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022256,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.3d.rgba8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022257,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rgb8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022258,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rgb8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022259,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb565_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022260,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb565_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022261,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.3d.r11f_g11f_b10f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022262,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.3d.r11f_g11f_b10f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022263,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022264,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022265,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022266,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022267,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022268,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgb32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022269,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022270,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022271,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022272,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022273,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022274,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgb16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022275,
        "dEQP-GLES3.functional.texture.",
        "format.sized.3d.rgb8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022276,
        "dEQP-GLES3.functional.texture.",
        "format.sized.3d.rgb8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022277,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rgb8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022278,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022279,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022280,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022281,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.srgb8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022282,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.srgb8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022283,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rgb9_e5_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022284,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rgb9_e5_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022285,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rg32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022286,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rg32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022287,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rg32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022288,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rg32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022289,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rg32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022290,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rg32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022291,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rg16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022292,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rg16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022293,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rg16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022294,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rg16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022295,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rg16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022296,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rg16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022297,
        "dEQP-GLES3.functional.text",
        "ure.format.sized.3d.rg8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022298,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rg8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022299,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rg8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022300,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rg8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022301,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.rg8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022302,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.rg8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022303,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.rg8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022304,
        "dEQP-GLES3.functional.texture.",
        "format.sized.3d.rg8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022305,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022306,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022307,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022308,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022309,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022310,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.r32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022311,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022312,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022313,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022314,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022315,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022316,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.3d.r16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022317,
        "dEQP-GLES3.functional.text",
        "ure.format.sized.3d.r8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022318,
        "dEQP-GLES3.functional.text",
        "ure.format.sized.3d.r8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022319,
        "dEQP-GLES3.functional.text",
        "ure.format.sized.3d.r8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022320,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022321,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022322,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.3d.r8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022323,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.r8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022324,
        "dEQP-GLES3.functional.texture",
        ".format.sized.3d.r8_snorm_npot");
