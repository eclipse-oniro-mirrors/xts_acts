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
#include "../Gl45masterBaseFunc.h"
#include "../ActsGl45master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000883,
    "KHR-GL45.packed_pixels.rectangle.initial_values");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000884,
    "KHR-GL45.packed_pixels.rectangle.depth_component");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000885,
    "KHR-GL45.packed_pixels.rectangle.depth_stencil");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000886,
    "KHR-GL45.packed_pixels.rectangle.red");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000887,
    "KHR-GL45.packed_pixels.rectangle.rg");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000888,
    "KHR-GL45.packed_pixels.rectangle.r8");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000889,
    "KHR-GL45.packed_pixels.rectangle.r8_snorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000890,
    "KHR-GL45.packed_pixels.rectangle.r16");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000891,
    "KHR-GL45.packed_pixels.rectangle.r16_snorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000892,
    "KHR-GL45.packed_pixels.rectangle.rg8");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000893,
    "KHR-GL45.packed_pixels.rectangle.rg8_snorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000894,
    "KHR-GL45.packed_pixels.rectangle.rg16");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000895,
    "KHR-GL45.packed_pixels.rectangle.rg16_snorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000896,
    "KHR-GL45.packed_pixels.rectangle.r3_g3_b2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000897,
    "KHR-GL45.packed_pixels.rectangle.rgb4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000898,
    "KHR-GL45.packed_pixels.rectangle.rgb5");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000899,
    "KHR-GL45.packed_pixels.rectangle.rgb8");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000900,
    "KHR-GL45.packed_pixels.rectangle.rgb8_snorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000901,
    "KHR-GL45.packed_pixels.rectangle.rgb10");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000902,
    "KHR-GL45.packed_pixels.rectangle.rgb12");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000903,
    "KHR-GL45.packed_pixels.rectangle.rgb16");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000904,
    "KHR-GL45.packed_pixels.rectangle.rgb16_snorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000905,
    "KHR-GL45.packed_pixels.rectangle.rgba2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000906,
    "KHR-GL45.packed_pixels.rectangle.rgba4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000907,
    "KHR-GL45.packed_pixels.rectangle.rgb5_a1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000908,
    "KHR-GL45.packed_pixels.rectangle.rgba8");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000909,
    "KHR-GL45.packed_pixels.rectangle.rgba8_snorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000910,
    "KHR-GL45.packed_pixels.rectangle.rgb10_a2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000911,
    "KHR-GL45.packed_pixels.rectangle.rgb10_a2ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000912,
    "KHR-GL45.packed_pixels.rectangle.rgba12");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000913,
    "KHR-GL45.packed_pixels.rectangle.rgba16");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000914,
    "KHR-GL45.packed_pixels.rectangle.rgba16_snorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000915,
    "KHR-GL45.packed_pixels.rectangle.srgb8");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000916,
    "KHR-GL45.packed_pixels.rectangle.srgb8_alpha8");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000917,
    "KHR-GL45.packed_pixels.rectangle.r16f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000918,
    "KHR-GL45.packed_pixels.rectangle.rg16f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000919,
    "KHR-GL45.packed_pixels.rectangle.rgb16f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000920,
    "KHR-GL45.packed_pixels.rectangle.rgba16f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000921,
    "KHR-GL45.packed_pixels.rectangle.r32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000922,
    "KHR-GL45.packed_pixels.rectangle.rg32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000923,
    "KHR-GL45.packed_pixels.rectangle.rgb32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000924,
    "KHR-GL45.packed_pixels.rectangle.rgba32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000925,
    "KHR-GL45.packed_pixels.rectangle.r11f_g11f_b10f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000926,
    "KHR-GL45.packed_pixels.rectangle.rgb9_e5");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000927,
    "KHR-GL45.packed_pixels.rectangle.r8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000928,
    "KHR-GL45.packed_pixels.rectangle.r8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000929,
    "KHR-GL45.packed_pixels.rectangle.r16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000930,
    "KHR-GL45.packed_pixels.rectangle.r16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000931,
    "KHR-GL45.packed_pixels.rectangle.r32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000932,
    "KHR-GL45.packed_pixels.rectangle.r32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000933,
    "KHR-GL45.packed_pixels.rectangle.rg8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000934,
    "KHR-GL45.packed_pixels.rectangle.rg8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000935,
    "KHR-GL45.packed_pixels.rectangle.rg16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000936,
    "KHR-GL45.packed_pixels.rectangle.rg16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000937,
    "KHR-GL45.packed_pixels.rectangle.rg32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000938,
    "KHR-GL45.packed_pixels.rectangle.rg32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000939,
    "KHR-GL45.packed_pixels.rectangle.rgb8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000940,
    "KHR-GL45.packed_pixels.rectangle.rgb8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000941,
    "KHR-GL45.packed_pixels.rectangle.rgb16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000942,
    "KHR-GL45.packed_pixels.rectangle.rgb16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000943,
    "KHR-GL45.packed_pixels.rectangle.rgb32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000944,
    "KHR-GL45.packed_pixels.rectangle.rgb32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000945,
    "KHR-GL45.packed_pixels.rectangle.rgba8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000946,
    "KHR-GL45.packed_pixels.rectangle.rgba8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000947,
    "KHR-GL45.packed_pixels.rectangle.rgba16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000948,
    "KHR-GL45.packed_pixels.rectangle.rgba16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000949,
    "KHR-GL45.packed_pixels.rectangle.rgba32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000950,
    "KHR-GL45.packed_pixels.rectangle.rgba32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000951,
    "KHR-GL45.packed_pixels.rectangle.depth_component16");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000952,
    "KHR-GL45.packed_pixels.rectangle.depth_component24");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000953,
    "KHR-GL45.packed_pixels.rectangle.depth_component32");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000954,
    "KHR-GL45.packed_pixels.rectangle.depth_component32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000955,
    "KHR-GL45.packed_pixels.rectangle.depth24_stencil8");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000956,
    "KHR-GL45.packed_pixels.rectangle.depth32f_stencil8");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000957,
    "KHR-GL45.packed_pixels.rectangle.compressed_red");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000958,
    "KHR-GL45.packed_pixels.rectangle.compressed_rg");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000959,
    "KHR-GL45.packed_pixels.rectangle.compressed_rgb");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000960,
    "KHR-GL45.packed_pixels.rectangle.compressed_rgba");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000961,
    "KHR-GL45.packed_pixels.rectangle.compressed_srgb");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000962,
    "KHR-GL45.packed_pixels.rectangle.compressed_srgb_alpha");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000963,
    "KHR-GL45.packed_pixels.rectangle.compressed_red_rgtc1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000964,
    "KHR-GL45.packed_pixels.rectangle.compressed_signed_red_rgtc1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000965,
    "KHR-GL45.packed_pixels.rectangle.compressed_rg_rgtc2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_000966,
    "KHR-GL45.packed_pixels.rectangle.compressed_signed_rg_rgtc2");
