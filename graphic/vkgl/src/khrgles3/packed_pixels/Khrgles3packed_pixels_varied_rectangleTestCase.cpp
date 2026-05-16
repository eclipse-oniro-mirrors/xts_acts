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

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003831,
        "KHR-GLES3.packed_pixels.v",
        "aried_rectangle.luminance");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003832,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.alpha");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003833,
        "KHR-GLES3.packed_pixels.vari",
        "ed_rectangle.luminance_alpha");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003834,
        "KHR-GLES3.packed_pixel",
        "s.varied_rectangle.rgb");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003835,
        "KHR-GLES3.packed_pixel",
        "s.varied_rectangle.rgba");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003836,
        "KHR-GLES3.packed_pixe",
        "ls.varied_rectangle.r8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003837,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.r8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003838,
        "KHR-GLES3.packed_pixel",
        "s.varied_rectangle.rg8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003839,
        "KHR-GLES3.packed_pixels.v",
        "aried_rectangle.rg8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003840,
        "KHR-GLES3.packed_pixel",
        "s.varied_rectangle.rgb8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003841,
        "KHR-GLES3.packed_pixels.v",
        "aried_rectangle.rgb8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003842,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rgb565");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003843,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rgba4");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003844,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003845,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rgba8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003846,
        "KHR-GLES3.packed_pixels.va",
        "ried_rectangle.rgba8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003847,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgb10_a2");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003848,
        "KHR-GLES3.packed_pixels.v",
        "aried_rectangle.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003849,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.srgb8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003850,
        "KHR-GLES3.packed_pixels.va",
        "ried_rectangle.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003851,
        "KHR-GLES3.packed_pixel",
        "s.varied_rectangle.r16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003852,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rg16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003853,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rgb16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003854,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgba16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003855,
        "KHR-GLES3.packed_pixel",
        "s.varied_rectangle.r32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003856,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rg32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003857,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rgb32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003858,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgba32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003859,
        "KHR-GLES3.packed_pixels.var",
        "ied_rectangle.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003860,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003861,
        "KHR-GLES3.packed_pixel",
        "s.varied_rectangle.r8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003862,
        "KHR-GLES3.packed_pixel",
        "s.varied_rectangle.r8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003863,
        "KHR-GLES3.packed_pixel",
        "s.varied_rectangle.r16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003864,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.r16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003865,
        "KHR-GLES3.packed_pixel",
        "s.varied_rectangle.r32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003866,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.r32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003867,
        "KHR-GLES3.packed_pixel",
        "s.varied_rectangle.rg8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003868,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rg8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003869,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rg16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003870,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rg16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003871,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rg32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003872,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rg32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003873,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rgb8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003874,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rgb8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003875,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rgb16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003876,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgb16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003877,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rgb32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003878,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgb32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003879,
        "KHR-GLES3.packed_pixels",
        ".varied_rectangle.rgba8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003880,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgba8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003881,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgba16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003882,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgba16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003883,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgba32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003884,
        "KHR-GLES3.packed_pixels.",
        "varied_rectangle.rgba32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003885,
        "KHR-GLES3.packed_pixels.varie",
        "d_rectangle.depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003886,
        "KHR-GLES3.packed_pixels.varie",
        "d_rectangle.depth_component24");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003887,
        "KHR-GLES3.packed_pixels.varie",
        "d_rectangle.depth_component32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003888,
        "KHR-GLES3.packed_pixels.vari",
        "ed_rectangle.depth24_stencil8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003889,
        "KHR-GLES3.packed_pixels.varie",
        "d_rectangle.depth32f_stencil8");
