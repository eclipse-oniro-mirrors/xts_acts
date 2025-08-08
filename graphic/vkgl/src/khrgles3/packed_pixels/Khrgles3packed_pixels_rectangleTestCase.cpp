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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003712,
        "KHR-GLES3.packed_pixels.",
        "rectangle.initial_values");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003713,
        "KHR-GLES3.packed_pixe",
        "ls.rectangle.luminance");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003714,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.alpha");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003715,
        "KHR-GLES3.packed_pixels.",
        "rectangle.luminance_alpha");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003716,
        "KHR-GLES3.packed_p",
        "ixels.rectangle.rgb");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003717,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.rgba");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003718,
        "KHR-GLES3.packed_p",
        "ixels.rectangle.r8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003719,
        "KHR-GLES3.packed_pixe",
        "ls.rectangle.r8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003720,
        "KHR-GLES3.packed_p",
        "ixels.rectangle.rg8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003721,
        "KHR-GLES3.packed_pixe",
        "ls.rectangle.rg8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003722,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.rgb8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003723,
        "KHR-GLES3.packed_pixel",
        "s.rectangle.rgb8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003724,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgb565");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003725,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.rgba4");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003726,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003727,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.rgba8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003728,
        "KHR-GLES3.packed_pixel",
        "s.rectangle.rgba8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003729,
        "KHR-GLES3.packed_pixe",
        "ls.rectangle.rgb10_a2");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003730,
        "KHR-GLES3.packed_pixel",
        "s.rectangle.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003731,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.srgb8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003732,
        "KHR-GLES3.packed_pixels",
        ".rectangle.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003733,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.r16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003734,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.rg16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003735,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgb16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003736,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgba16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003737,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.r32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003738,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.rg32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003739,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgb32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003740,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgba32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003741,
        "KHR-GLES3.packed_pixels.",
        "rectangle.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003742,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003743,
        "KHR-GLES3.packed_p",
        "ixels.rectangle.r8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003744,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.r8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003745,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.r16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003746,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.r16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003747,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.r32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003748,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.r32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003749,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.rg8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003750,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.rg8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003751,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.rg16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003752,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rg16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003753,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.rg32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003754,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rg32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003755,
        "KHR-GLES3.packed_pi",
        "xels.rectangle.rgb8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003756,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgb8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003757,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgb16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003758,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgb16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003759,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgb32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003760,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgb32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003761,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgba8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003762,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgba8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003763,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgba16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003764,
        "KHR-GLES3.packed_pixe",
        "ls.rectangle.rgba16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003765,
        "KHR-GLES3.packed_pix",
        "els.rectangle.rgba32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003766,
        "KHR-GLES3.packed_pixe",
        "ls.rectangle.rgba32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003767,
        "KHR-GLES3.packed_pixels.r",
        "ectangle.depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003768,
        "KHR-GLES3.packed_pixels.r",
        "ectangle.depth_component24");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003769,
        "KHR-GLES3.packed_pixels.re",
        "ctangle.depth_component32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003770,
        "KHR-GLES3.packed_pixels.r",
        "ectangle.depth24_stencil8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003771,
        "KHR-GLES3.packed_pixels.r",
        "ectangle.depth32f_stencil8");
