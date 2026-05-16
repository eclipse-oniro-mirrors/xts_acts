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

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024537,
        "dEQP-GLES3.functional.texture.fil",
        "tering.3d.formats.rgba16f_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024538,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.formats.rgba16f_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024539,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgba16f_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024540,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgba16f_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024541,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgba16f_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024542,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgba16f_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024543,
        "dEQP-GLES3.functional.texture.filter",
        "ing.3d.formats.r11f_g11f_b10f_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024544,
        "dEQP-GLES3.functional.texture.filter",
        "ing.3d.formats.r11f_g11f_b10f_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024545,
        "dEQP-GLES3.functional.texture.filtering.3d.f",
        "ormats.r11f_g11f_b10f_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024546,
        "dEQP-GLES3.functional.texture.filtering.3d.",
        "formats.r11f_g11f_b10f_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024547,
        "dEQP-GLES3.functional.texture.filtering.3d.",
        "formats.r11f_g11f_b10f_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024548,
        "dEQP-GLES3.functional.texture.filtering.3d.",
        "formats.r11f_g11f_b10f_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024549,
        "dEQP-GLES3.functional.texture.fil",
        "tering.3d.formats.rgb9_e5_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024550,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.formats.rgb9_e5_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024551,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgb9_e5_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024552,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgb9_e5_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024553,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgb9_e5_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024554,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgb9_e5_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024555,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.formats.rgba8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024556,
        "dEQP-GLES3.functional.texture.f",
        "iltering.3d.formats.rgba8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024557,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgba8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024558,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgba8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024559,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgba8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024560,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.formats.rgba8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024561,
        "dEQP-GLES3.functional.texture.filte",
        "ring.3d.formats.rgba8_snorm_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024562,
        "dEQP-GLES3.functional.texture.filt",
        "ering.3d.formats.rgba8_snorm_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024563,
        "dEQP-GLES3.functional.texture.filtering.3d",
        ".formats.rgba8_snorm_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024564,
        "dEQP-GLES3.functional.texture.filtering.3d",
        ".formats.rgba8_snorm_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024565,
        "dEQP-GLES3.functional.texture.filtering.3d",
        ".formats.rgba8_snorm_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024566,
        "dEQP-GLES3.functional.texture.filtering.3",
        "d.formats.rgba8_snorm_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024567,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.formats.rgb565_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024568,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.formats.rgb565_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024569,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgb565_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024570,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgb565_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024571,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgb565_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024572,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgb565_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024573,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.formats.rgba4_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024574,
        "dEQP-GLES3.functional.texture.f",
        "iltering.3d.formats.rgba4_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024575,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgba4_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024576,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgba4_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024577,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgba4_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024578,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.formats.rgba4_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024579,
        "dEQP-GLES3.functional.texture.fil",
        "tering.3d.formats.rgb5_a1_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024580,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.formats.rgb5_a1_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024581,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgb5_a1_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024582,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgb5_a1_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024583,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgb5_a1_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024584,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.rgb5_a1_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024585,
        "dEQP-GLES3.functional.texture.filte",
        "ring.3d.formats.srgb8_alpha8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024586,
        "dEQP-GLES3.functional.texture.filte",
        "ring.3d.formats.srgb8_alpha8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024587,
        "dEQP-GLES3.functional.texture.filtering.3d.",
        "formats.srgb8_alpha8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024588,
        "dEQP-GLES3.functional.texture.filtering.3d",
        ".formats.srgb8_alpha8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024589,
        "dEQP-GLES3.functional.texture.filtering.3d",
        ".formats.srgb8_alpha8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024590,
        "dEQP-GLES3.functional.texture.filtering.3d",
        ".formats.srgb8_alpha8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024591,
        "dEQP-GLES3.functional.texture.fil",
        "tering.3d.formats.srgb_r8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024592,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.formats.srgb_r8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024593,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.srgb_r8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024594,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.srgb_r8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024595,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.srgb_r8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024596,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.srgb_r8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024597,
        "dEQP-GLES3.functional.texture.fil",
        "tering.3d.formats.srgb_rg8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024598,
        "dEQP-GLES3.functional.texture.fil",
        "tering.3d.formats.srgb_rg8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024599,
        "dEQP-GLES3.functional.texture.filtering.3",
        "d.formats.srgb_rg8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024600,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.srgb_rg8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024601,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.srgb_rg8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024602,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.srgb_rg8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024603,
        "dEQP-GLES3.functional.texture.fil",
        "tering.3d.formats.rgb10_a2_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024604,
        "dEQP-GLES3.functional.texture.fil",
        "tering.3d.formats.rgb10_a2_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024605,
        "dEQP-GLES3.functional.texture.filtering.3",
        "d.formats.rgb10_a2_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024606,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgb10_a2_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024607,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgb10_a2_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024608,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.formats.rgb10_a2_linear_mipmap_linear");
