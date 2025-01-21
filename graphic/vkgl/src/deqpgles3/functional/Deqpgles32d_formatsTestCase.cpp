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
#include "../ActsDeqpgles30024TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023887,
        "dEQP-GLES3.functional.texture.fil",
        "tering.2d.formats.rgba16f_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023888,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.2d.formats.rgba16f_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023889,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgba16f_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023890,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgba16f_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023891,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgba16f_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023892,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgba16f_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023893,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d.formats.r11f_g11f_b10f_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023894,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d.formats.r11f_g11f_b10f_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023895,
        "dEQP-GLES3.functional.texture.filtering.2d.f",
        "ormats.r11f_g11f_b10f_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023896,
        "dEQP-GLES3.functional.texture.filtering.2d.",
        "formats.r11f_g11f_b10f_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023897,
        "dEQP-GLES3.functional.texture.filtering.2d.",
        "formats.r11f_g11f_b10f_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023898,
        "dEQP-GLES3.functional.texture.filtering.2d.",
        "formats.r11f_g11f_b10f_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023899,
        "dEQP-GLES3.functional.texture.fil",
        "tering.2d.formats.rgb9_e5_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023900,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.2d.formats.rgb9_e5_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023901,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgb9_e5_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023902,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgb9_e5_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023903,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgb9_e5_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023904,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgb9_e5_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023905,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.2d.formats.rgba8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023906,
        "dEQP-GLES3.functional.texture.f",
        "iltering.2d.formats.rgba8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023907,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgba8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023908,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgba8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023909,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgba8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023910,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.formats.rgba8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023911,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d.formats.rgba8_snorm_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023912,
        "dEQP-GLES3.functional.texture.filt",
        "ering.2d.formats.rgba8_snorm_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023913,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".formats.rgba8_snorm_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023914,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".formats.rgba8_snorm_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023915,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".formats.rgba8_snorm_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023916,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.formats.rgba8_snorm_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023917,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.2d.formats.rgb565_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023918,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.2d.formats.rgb565_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023919,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgb565_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023920,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgb565_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023921,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgb565_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023922,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgb565_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023923,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.2d.formats.rgba4_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023924,
        "dEQP-GLES3.functional.texture.f",
        "iltering.2d.formats.rgba4_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023925,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgba4_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023926,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgba4_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023927,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgba4_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023928,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.formats.rgba4_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023929,
        "dEQP-GLES3.functional.texture.fil",
        "tering.2d.formats.rgb5_a1_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023930,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.2d.formats.rgb5_a1_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023931,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgb5_a1_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023932,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgb5_a1_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023933,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgb5_a1_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023934,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.rgb5_a1_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023935,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d.formats.srgb8_alpha8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023936,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d.formats.srgb8_alpha8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023937,
        "dEQP-GLES3.functional.texture.filtering.2d.",
        "formats.srgb8_alpha8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023938,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".formats.srgb8_alpha8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023939,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".formats.srgb8_alpha8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023940,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".formats.srgb8_alpha8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023941,
        "dEQP-GLES3.functional.texture.fil",
        "tering.2d.formats.srgb_r8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023942,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.2d.formats.srgb_r8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023943,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.srgb_r8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023944,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.srgb_r8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023945,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.srgb_r8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023946,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.srgb_r8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023947,
        "dEQP-GLES3.functional.texture.fil",
        "tering.2d.formats.srgb_rg8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023948,
        "dEQP-GLES3.functional.texture.fil",
        "tering.2d.formats.srgb_rg8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023949,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.formats.srgb_rg8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023950,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.srgb_rg8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023951,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.srgb_rg8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023952,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.srgb_rg8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023953,
        "dEQP-GLES3.functional.texture.fil",
        "tering.2d.formats.rgb10_a2_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023954,
        "dEQP-GLES3.functional.texture.fil",
        "tering.2d.formats.rgb10_a2_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023955,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.formats.rgb10_a2_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023956,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgb10_a2_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023957,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgb10_a2_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023958,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.rgb10_a2_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023959,
        "dEQP-GLES3.functional.texture.filt",
        "ering.2d.formats.etc1_rgb8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023960,
        "dEQP-GLES3.functional.texture.fil",
        "tering.2d.formats.etc1_rgb8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023961,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.formats.etc1_rgb8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023962,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.formats.etc1_rgb8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023963,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.formats.etc1_rgb8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023964,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.formats.etc1_rgb8_linear_mipmap_linear");
