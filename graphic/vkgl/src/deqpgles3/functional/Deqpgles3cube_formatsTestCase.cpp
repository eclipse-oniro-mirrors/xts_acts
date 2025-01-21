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
#include "../ActsDeqpgles30025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024109,
        "dEQP-GLES3.functional.texture.filt",
        "ering.cube.formats.rgba16f_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024110,
        "dEQP-GLES3.functional.texture.fil",
        "tering.cube.formats.rgba16f_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024111,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgba16f_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024112,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgba16f_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024113,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgba16f_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024114,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgba16f_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024115,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.cube.formats.r11f_g11f_b10f_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024116,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.cube.formats.r11f_g11f_b10f_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024117,
        "dEQP-GLES3.functional.texture.filtering.cube.",
        "formats.r11f_g11f_b10f_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024118,
        "dEQP-GLES3.functional.texture.filtering.cube",
        ".formats.r11f_g11f_b10f_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024119,
        "dEQP-GLES3.functional.texture.filtering.cube",
        ".formats.r11f_g11f_b10f_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024120,
        "dEQP-GLES3.functional.texture.filtering.cube",
        ".formats.r11f_g11f_b10f_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024121,
        "dEQP-GLES3.functional.texture.filt",
        "ering.cube.formats.rgb9_e5_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024122,
        "dEQP-GLES3.functional.texture.fil",
        "tering.cube.formats.rgb9_e5_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024123,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgb9_e5_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024124,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgb9_e5_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024125,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgb9_e5_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024126,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgb9_e5_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024127,
        "dEQP-GLES3.functional.texture.fil",
        "tering.cube.formats.rgba8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024128,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.cube.formats.rgba8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024129,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgba8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024130,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgba8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024131,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgba8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024132,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.formats.rgba8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024133,
        "dEQP-GLES3.functional.texture.filter",
        "ing.cube.formats.rgba8_snorm_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024134,
        "dEQP-GLES3.functional.texture.filte",
        "ring.cube.formats.rgba8_snorm_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024135,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.formats.rgba8_snorm_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024136,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.formats.rgba8_snorm_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024137,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.formats.rgba8_snorm_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024138,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.formats.rgba8_snorm_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024139,
        "dEQP-GLES3.functional.texture.fil",
        "tering.cube.formats.rgb565_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024140,
        "dEQP-GLES3.functional.texture.fil",
        "tering.cube.formats.rgb565_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024141,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgb565_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024142,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgb565_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024143,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgb565_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024144,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgb565_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024145,
        "dEQP-GLES3.functional.texture.fil",
        "tering.cube.formats.rgba4_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024146,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.cube.formats.rgba4_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024147,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgba4_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024148,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgba4_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024149,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgba4_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024150,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.formats.rgba4_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024151,
        "dEQP-GLES3.functional.texture.filt",
        "ering.cube.formats.rgb5_a1_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024152,
        "dEQP-GLES3.functional.texture.fil",
        "tering.cube.formats.rgb5_a1_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024153,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgb5_a1_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024154,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgb5_a1_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024155,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgb5_a1_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024156,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.rgb5_a1_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024157,
        "dEQP-GLES3.functional.texture.filter",
        "ing.cube.formats.srgb8_alpha8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024158,
        "dEQP-GLES3.functional.texture.filter",
        "ing.cube.formats.srgb8_alpha8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024159,
        "dEQP-GLES3.functional.texture.filtering.cube",
        ".formats.srgb8_alpha8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024160,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.formats.srgb8_alpha8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024161,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.formats.srgb8_alpha8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024162,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.formats.srgb8_alpha8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024163,
        "dEQP-GLES3.functional.texture.filt",
        "ering.cube.formats.srgb_r8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024164,
        "dEQP-GLES3.functional.texture.fil",
        "tering.cube.formats.srgb_r8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024165,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.srgb_r8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024166,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.srgb_r8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024167,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.srgb_r8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024168,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.srgb_r8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024169,
        "dEQP-GLES3.functional.texture.filt",
        "ering.cube.formats.srgb_rg8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024170,
        "dEQP-GLES3.functional.texture.filt",
        "ering.cube.formats.srgb_rg8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024171,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.formats.srgb_rg8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024172,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.srgb_rg8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024173,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.srgb_rg8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024174,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.srgb_rg8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024175,
        "dEQP-GLES3.functional.texture.filt",
        "ering.cube.formats.rgb10_a2_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024176,
        "dEQP-GLES3.functional.texture.filt",
        "ering.cube.formats.rgb10_a2_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024177,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.formats.rgb10_a2_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024178,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgb10_a2_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024179,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgb10_a2_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024180,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.rgb10_a2_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024181,
        "dEQP-GLES3.functional.texture.filte",
        "ring.cube.formats.etc1_rgb8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024182,
        "dEQP-GLES3.functional.texture.filt",
        "ering.cube.formats.etc1_rgb8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024183,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.formats.etc1_rgb8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024184,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.formats.etc1_rgb8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024185,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.formats.etc1_rgb8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024186,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.formats.etc1_rgb8_linear_mipmap_linear");
