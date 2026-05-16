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

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024327,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d_array.formats.rgba16f_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024328,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.formats.rgba16f_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024329,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgba16f_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024330,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgba16f_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024331,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgba16f_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024332,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgba16f_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024333,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d_array.formats.r11f_g11f_b10f_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024334,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d_array.formats.r11f_g11f_b10f_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024335,
        "dEQP-GLES3.functional.texture.filtering.2d_arra",
        "y.formats.r11f_g11f_b10f_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024336,
        "dEQP-GLES3.functional.texture.filtering.2d_arr",
        "ay.formats.r11f_g11f_b10f_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024337,
        "dEQP-GLES3.functional.texture.filtering.2d_arr",
        "ay.formats.r11f_g11f_b10f_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024338,
        "dEQP-GLES3.functional.texture.filtering.2d_arr",
        "ay.formats.r11f_g11f_b10f_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024339,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d_array.formats.rgb9_e5_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024340,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.formats.rgb9_e5_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024341,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgb9_e5_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024342,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgb9_e5_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024343,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgb9_e5_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024344,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgb9_e5_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024345,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.formats.rgba8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024346,
        "dEQP-GLES3.functional.texture.filt",
        "ering.2d_array.formats.rgba8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024347,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgba8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024348,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgba8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024349,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgba8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024350,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.formats.rgba8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024351,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d_array.formats.rgba8_snorm_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024352,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.2d_array.formats.rgba8_snorm_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024353,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.formats.rgba8_snorm_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024354,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.formats.rgba8_snorm_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024355,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.formats.rgba8_snorm_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024356,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.formats.rgba8_snorm_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024357,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.formats.rgb565_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024358,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.formats.rgb565_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024359,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgb565_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024360,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgb565_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024361,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgb565_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024362,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgb565_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024363,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.formats.rgba4_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024364,
        "dEQP-GLES3.functional.texture.filt",
        "ering.2d_array.formats.rgba4_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024365,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgba4_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024366,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgba4_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024367,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgba4_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024368,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.formats.rgba4_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024369,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d_array.formats.rgb5_a1_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024370,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.formats.rgb5_a1_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024371,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgb5_a1_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024372,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgb5_a1_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024373,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgb5_a1_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024374,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.rgb5_a1_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024375,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d_array.formats.srgb8_alpha8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024376,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d_array.formats.srgb8_alpha8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024377,
        "dEQP-GLES3.functional.texture.filtering.2d_arr",
        "ay.formats.srgb8_alpha8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024378,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.formats.srgb8_alpha8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024379,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.formats.srgb8_alpha8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024380,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.formats.srgb8_alpha8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024381,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d_array.formats.srgb_r8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024382,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.formats.srgb_r8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024383,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.srgb_r8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024384,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.srgb_r8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024385,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.srgb_r8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024386,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.srgb_r8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024387,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d_array.formats.srgb_rg8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024388,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d_array.formats.srgb_rg8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024389,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.formats.srgb_rg8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024390,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.srgb_rg8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024391,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.srgb_rg8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024392,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.srgb_rg8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024393,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d_array.formats.rgb10_a2_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024394,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d_array.formats.rgb10_a2_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024395,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.formats.rgb10_a2_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024396,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgb10_a2_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024397,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgb10_a2_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024398,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.formats.rgb10_a2_linear_mipmap_linear");
