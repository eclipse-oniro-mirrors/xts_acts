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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001050,
    "KHR-GL43.packed_pixels.varied_rectangle.depth_component");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001051,
    "KHR-GL43.packed_pixels.varied_rectangle.depth_stencil");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001052,
    "KHR-GL43.packed_pixels.varied_rectangle.red");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001053,
    "KHR-GL43.packed_pixels.varied_rectangle.rg");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001054,
    "KHR-GL43.packed_pixels.varied_rectangle.r8");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001055,
    "KHR-GL43.packed_pixels.varied_rectangle.r8_snorm");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001056,
    "KHR-GL43.packed_pixels.varied_rectangle.r16");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001057,
    "KHR-GL43.packed_pixels.varied_rectangle.r16_snorm");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001058,
    "KHR-GL43.packed_pixels.varied_rectangle.rg8");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001059,
    "KHR-GL43.packed_pixels.varied_rectangle.rg8_snorm");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001060,
    "KHR-GL43.packed_pixels.varied_rectangle.rg16");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001061,
    "KHR-GL43.packed_pixels.varied_rectangle.rg16_snorm");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001062,
    "KHR-GL43.packed_pixels.varied_rectangle.r3_g3_b2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001063,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001064,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb5");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001065,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb8");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001066,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb8_snorm");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001067,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb10");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001068,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb12");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001069,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb16");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001070,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb16_snorm");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001071,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001072,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001073,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb5_a1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001074,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba8");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001075,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba8_snorm");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001076,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb10_a2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001077,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb10_a2ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001078,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba12");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001079,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba16");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001080,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba16_snorm");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001081,
    "KHR-GL43.packed_pixels.varied_rectangle.srgb8");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001082,
    "KHR-GL43.packed_pixels.varied_rectangle.srgb8_alpha8");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001083,
    "KHR-GL43.packed_pixels.varied_rectangle.r16f");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001084,
    "KHR-GL43.packed_pixels.varied_rectangle.rg16f");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001085,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb16f");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001086,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba16f");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001087,
    "KHR-GL43.packed_pixels.varied_rectangle.r32f");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001088,
    "KHR-GL43.packed_pixels.varied_rectangle.rg32f");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001089,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb32f");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001090,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba32f");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001091,
    "KHR-GL43.packed_pixels.varied_rectangle.r11f_g11f_b10f");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001092,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb9_e5");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001093,
    "KHR-GL43.packed_pixels.varied_rectangle.r8i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001094,
    "KHR-GL43.packed_pixels.varied_rectangle.r8ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001095,
    "KHR-GL43.packed_pixels.varied_rectangle.r16i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001096,
    "KHR-GL43.packed_pixels.varied_rectangle.r16ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001097,
    "KHR-GL43.packed_pixels.varied_rectangle.r32i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001098,
    "KHR-GL43.packed_pixels.varied_rectangle.r32ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001099,
    "KHR-GL43.packed_pixels.varied_rectangle.rg8i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001100,
    "KHR-GL43.packed_pixels.varied_rectangle.rg8ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001101,
    "KHR-GL43.packed_pixels.varied_rectangle.rg16i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001102,
    "KHR-GL43.packed_pixels.varied_rectangle.rg16ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001103,
    "KHR-GL43.packed_pixels.varied_rectangle.rg32i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001104,
    "KHR-GL43.packed_pixels.varied_rectangle.rg32ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001105,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb8i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001106,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb8ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001107,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb16i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001108,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb16ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001109,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb32i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001110,
    "KHR-GL43.packed_pixels.varied_rectangle.rgb32ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001111,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba8i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001112,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba8ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001113,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba16i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001114,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba16ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001115,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba32i");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001116,
    "KHR-GL43.packed_pixels.varied_rectangle.rgba32ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001117,
    "KHR-GL43.packed_pixels.varied_rectangle.depth_component16");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001118,
    "KHR-GL43.packed_pixels.varied_rectangle.depth_component24");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001119,
    "KHR-GL43.packed_pixels.varied_rectangle.depth_component32");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001120,
    "KHR-GL43.packed_pixels.varied_rectangle.depth_component32f");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001121,
    "KHR-GL43.packed_pixels.varied_rectangle.depth24_stencil8");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001122,
    "KHR-GL43.packed_pixels.varied_rectangle.depth32f_stencil8");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001123,
    "KHR-GL43.packed_pixels.varied_rectangle.compressed_red");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001124,
    "KHR-GL43.packed_pixels.varied_rectangle.compressed_rg");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001125,
    "KHR-GL43.packed_pixels.varied_rectangle.compressed_rgb");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001126,
    "KHR-GL43.packed_pixels.varied_rectangle.compressed_rgba");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001127,
    "KHR-GL43.packed_pixels.varied_rectangle.compressed_srgb");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001128,
    "KHR-GL43.packed_pixels.varied_rectangle.compressed_srgb_alpha");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001129,
    "KHR-GL43.packed_pixels.varied_rectangle.compressed_red_rgtc1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001130,
    "KHR-GL43.packed_pixels.varied_rectangle.compressed_signed_red_rgtc1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001131,
    "KHR-GL43.packed_pixels.varied_rectangle.compressed_rg_rgtc2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001132,
    "KHR-GL43.packed_pixels.varied_rectangle.compressed_signed_rg_rgtc2");
