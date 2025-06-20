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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000967,
    "KHR-GL42.packed_pixels.pbo_rectangle.depth_component");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000968,
    "KHR-GL42.packed_pixels.pbo_rectangle.depth_stencil");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000969,
    "KHR-GL42.packed_pixels.pbo_rectangle.red");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000970,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000971,
    "KHR-GL42.packed_pixels.pbo_rectangle.r8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000972,
    "KHR-GL42.packed_pixels.pbo_rectangle.r8_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000973,
    "KHR-GL42.packed_pixels.pbo_rectangle.r16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000974,
    "KHR-GL42.packed_pixels.pbo_rectangle.r16_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000975,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000976,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg8_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000977,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000978,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg16_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000979,
    "KHR-GL42.packed_pixels.pbo_rectangle.r3_g3_b2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000980,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000981,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb5");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000982,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000983,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb8_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000984,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb10");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000985,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb12");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000986,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000987,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb16_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000988,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000989,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000990,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb5_a1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000991,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000992,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba8_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000993,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb10_a2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000994,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb10_a2ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000995,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba12");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000996,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000997,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba16_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000998,
    "KHR-GL42.packed_pixels.pbo_rectangle.srgb8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000999,
    "KHR-GL42.packed_pixels.pbo_rectangle.srgb8_alpha8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001000,
    "KHR-GL42.packed_pixels.pbo_rectangle.r16f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001001,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg16f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001002,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb16f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001003,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba16f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001004,
    "KHR-GL42.packed_pixels.pbo_rectangle.r32f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001005,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg32f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001006,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb32f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001007,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba32f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001008,
    "KHR-GL42.packed_pixels.pbo_rectangle.r11f_g11f_b10f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001009,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb9_e5");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001010,
    "KHR-GL42.packed_pixels.pbo_rectangle.r8i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001011,
    "KHR-GL42.packed_pixels.pbo_rectangle.r8ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001012,
    "KHR-GL42.packed_pixels.pbo_rectangle.r16i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001013,
    "KHR-GL42.packed_pixels.pbo_rectangle.r16ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001014,
    "KHR-GL42.packed_pixels.pbo_rectangle.r32i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001015,
    "KHR-GL42.packed_pixels.pbo_rectangle.r32ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001016,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg8i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001017,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg8ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001018,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg16i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001019,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg16ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001020,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg32i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001021,
    "KHR-GL42.packed_pixels.pbo_rectangle.rg32ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001022,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb8i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001023,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb8ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001024,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb16i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001025,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb16ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001026,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb32i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001027,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgb32ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001028,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba8i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001029,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba8ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001030,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba16i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001031,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba16ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001032,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba32i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001033,
    "KHR-GL42.packed_pixels.pbo_rectangle.rgba32ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001034,
    "KHR-GL42.packed_pixels.pbo_rectangle.depth_component16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001035,
    "KHR-GL42.packed_pixels.pbo_rectangle.depth_component24");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001036,
    "KHR-GL42.packed_pixels.pbo_rectangle.depth_component32");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001037,
    "KHR-GL42.packed_pixels.pbo_rectangle.depth_component32f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001038,
    "KHR-GL42.packed_pixels.pbo_rectangle.depth24_stencil8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001039,
    "KHR-GL42.packed_pixels.pbo_rectangle.depth32f_stencil8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001040,
    "KHR-GL42.packed_pixels.pbo_rectangle.compressed_red");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001041,
    "KHR-GL42.packed_pixels.pbo_rectangle.compressed_rg");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001042,
    "KHR-GL42.packed_pixels.pbo_rectangle.compressed_rgb");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001043,
    "KHR-GL42.packed_pixels.pbo_rectangle.compressed_rgba");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001044,
    "KHR-GL42.packed_pixels.pbo_rectangle.compressed_srgb");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001045,
    "KHR-GL42.packed_pixels.pbo_rectangle.compressed_srgb_alpha");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001046,
    "KHR-GL42.packed_pixels.pbo_rectangle.compressed_red_rgtc1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001047,
    "KHR-GL42.packed_pixels.pbo_rectangle.compressed_signed_red_rgtc1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001048,
    "KHR-GL42.packed_pixels.pbo_rectangle.compressed_rg_rgtc2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001049,
    "KHR-GL42.packed_pixels.pbo_rectangle.compressed_signed_rg_rgtc2");
