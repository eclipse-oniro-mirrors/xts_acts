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

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003772,
        "KHR-GLES3.packed_pixels",
        ".pbo_rectangle.luminance");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003773,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.alpha");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003774,
        "KHR-GLES3.packed_pixels.pb",
        "o_rectangle.luminance_alpha");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003775,
        "KHR-GLES3.packed_pix",
        "els.pbo_rectangle.rgb");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003776,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.rgba");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003777,
        "KHR-GLES3.packed_pix",
        "els.pbo_rectangle.r8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003778,
        "KHR-GLES3.packed_pixels",
        ".pbo_rectangle.r8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003779,
        "KHR-GLES3.packed_pix",
        "els.pbo_rectangle.rg8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003780,
        "KHR-GLES3.packed_pixels",
        ".pbo_rectangle.rg8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003781,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.rgb8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003782,
        "KHR-GLES3.packed_pixels.",
        "pbo_rectangle.rgb8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003783,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgb565");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003784,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.rgba4");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003785,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003786,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.rgba8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003787,
        "KHR-GLES3.packed_pixels.",
        "pbo_rectangle.rgba8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003788,
        "KHR-GLES3.packed_pixels",
        ".pbo_rectangle.rgb10_a2");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003789,
        "KHR-GLES3.packed_pixels.",
        "pbo_rectangle.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003790,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.srgb8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003791,
        "KHR-GLES3.packed_pixels.p",
        "bo_rectangle.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003792,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.r16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003793,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.rg16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003794,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgb16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003795,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgba16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003796,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.r32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003797,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.rg32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003798,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgb32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003799,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgba32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003800,
        "KHR-GLES3.packed_pixels.pb",
        "o_rectangle.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003801,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003802,
        "KHR-GLES3.packed_pix",
        "els.pbo_rectangle.r8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003803,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.r8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003804,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.r16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003805,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.r16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003806,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.r32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003807,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.r32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003808,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.rg8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003809,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.rg8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003810,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.rg16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003811,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rg16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003812,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.rg32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003813,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rg32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003814,
        "KHR-GLES3.packed_pixe",
        "ls.pbo_rectangle.rgb8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003815,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgb8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003816,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgb16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003817,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgb16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003818,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgb32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003819,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgb32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003820,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgba8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003821,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgba8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003822,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgba16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003823,
        "KHR-GLES3.packed_pixels",
        ".pbo_rectangle.rgba16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003824,
        "KHR-GLES3.packed_pixel",
        "s.pbo_rectangle.rgba32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003825,
        "KHR-GLES3.packed_pixels",
        ".pbo_rectangle.rgba32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003826,
        "KHR-GLES3.packed_pixels.pbo",
        "_rectangle.depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003827,
        "KHR-GLES3.packed_pixels.pbo",
        "_rectangle.depth_component24");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003828,
        "KHR-GLES3.packed_pixels.pbo_",
        "rectangle.depth_component32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003829,
        "KHR-GLES3.packed_pixels.pbo",
        "_rectangle.depth24_stencil8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003830,
        "KHR-GLES3.packed_pixels.pbo",
        "_rectangle.depth32f_stencil8");
