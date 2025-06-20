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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000031,
    "KHR-GL42.texture_repeat_mode.r8_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000032,
    "KHR-GL42.texture_repeat_mode.r8_49x23_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000033,
    "KHR-GL42.texture_repeat_mode.r8_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000034,
    "KHR-GL42.texture_repeat_mode.r8_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000035,
    "KHR-GL42.texture_repeat_mode.r8_49x23_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000036,
    "KHR-GL42.texture_repeat_mode.r8_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000037,
    "KHR-GL42.texture_repeat_mode.r8_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000038,
    "KHR-GL42.texture_repeat_mode.r8_49x23_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000039,
    "KHR-GL42.texture_repeat_mode.r8_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000040,
    "KHR-GL42.texture_repeat_mode.rgb565_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000041,
    "KHR-GL42.texture_repeat_mode.rgb565_49x23_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000042,
    "KHR-GL42.texture_repeat_mode.rgb565_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000043,
    "KHR-GL42.texture_repeat_mode.rgb565_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000044,
    "KHR-GL42.texture_repeat_mode.rgb565_49x23_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000045,
    "KHR-GL42.texture_repeat_mode.rgb565_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000046,
    "KHR-GL42.texture_repeat_mode.rgb565_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000047,
    "KHR-GL42.texture_repeat_mode.rgb565_49x23_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000048,
    "KHR-GL42.texture_repeat_mode.rgb565_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000049,
    "KHR-GL42.texture_repeat_mode.rgb8_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000050,
    "KHR-GL42.texture_repeat_mode.rgb8_49x23_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000051,
    "KHR-GL42.texture_repeat_mode.rgb8_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000052,
    "KHR-GL42.texture_repeat_mode.rgb8_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000053,
    "KHR-GL42.texture_repeat_mode.rgb8_49x23_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000054,
    "KHR-GL42.texture_repeat_mode.rgb8_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000055,
    "KHR-GL42.texture_repeat_mode.rgb8_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000056,
    "KHR-GL42.texture_repeat_mode.rgb8_49x23_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000057,
    "KHR-GL42.texture_repeat_mode.rgb8_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000058,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000059,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_49x23_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000060,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000061,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000062,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_49x23_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000063,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000064,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000065,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_49x23_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000066,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000067,
    "KHR-GL42.texture_repeat_mode.r32ui_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000068,
    "KHR-GL42.texture_repeat_mode.r32ui_49x23_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000069,
    "KHR-GL42.texture_repeat_mode.r32ui_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000070,
    "KHR-GL42.texture_repeat_mode.r32ui_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000071,
    "KHR-GL42.texture_repeat_mode.r32ui_49x23_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000072,
    "KHR-GL42.texture_repeat_mode.r32ui_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000073,
    "KHR-GL42.texture_repeat_mode.r32ui_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000074,
    "KHR-GL42.texture_repeat_mode.r32ui_49x23_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000075,
    "KHR-GL42.texture_repeat_mode.r32ui_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000076,
    "KHR-GL42.texture_repeat_mode.rg32ui_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000077,
    "KHR-GL42.texture_repeat_mode.rg32ui_49x23_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000078,
    "KHR-GL42.texture_repeat_mode.rg32ui_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000079,
    "KHR-GL42.texture_repeat_mode.rg32ui_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000080,
    "KHR-GL42.texture_repeat_mode.rg32ui_49x23_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000081,
    "KHR-GL42.texture_repeat_mode.rg32ui_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000082,
    "KHR-GL42.texture_repeat_mode.rg32ui_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000083,
    "KHR-GL42.texture_repeat_mode.rg32ui_49x23_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000084,
    "KHR-GL42.texture_repeat_mode.rg32ui_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000085,
    "KHR-GL42.texture_repeat_mode.rgba32ui_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000086,
    "KHR-GL42.texture_repeat_mode.rgba32ui_49x23_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000087,
    "KHR-GL42.texture_repeat_mode.rgba32ui_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000088,
    "KHR-GL42.texture_repeat_mode.rgba32ui_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000089,
    "KHR-GL42.texture_repeat_mode.rgba32ui_49x23_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000090,
    "KHR-GL42.texture_repeat_mode.rgba32ui_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000091,
    "KHR-GL42.texture_repeat_mode.rgba32ui_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000092,
    "KHR-GL42.texture_repeat_mode.rgba32ui_49x23_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000093,
    "KHR-GL42.texture_repeat_mode.rgba32ui_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000094,
    "KHR-GL42.texture_repeat_mode.depth_component16_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000095,
    "KHR-GL42.texture_repeat_mode.depth_component16_49x23_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000096,
    "KHR-GL42.texture_repeat_mode.depth_component16_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000097,
    "KHR-GL42.texture_repeat_mode.depth_component16_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000098,
    "KHR-GL42.texture_repeat_mode.depth_component16_49x23_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000099,
    "KHR-GL42.texture_repeat_mode.depth_component16_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000100,
    "KHR-GL42.texture_repeat_mode.depth_component16_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000101,
    "KHR-GL42.texture_repeat_mode.depth_component16_49x23_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000102,
    "KHR-GL42.texture_repeat_mode.depth_component16_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000103,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000104,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_49x23_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000105,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000106,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000107,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_49x23_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000108,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000109,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000110,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_49x23_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000111,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000112,
    "KHR-GL42.texture_repeat_mode.r8_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000113,
    "KHR-GL42.texture_repeat_mode.r8_11x131_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000114,
    "KHR-GL42.texture_repeat_mode.r8_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000115,
    "KHR-GL42.texture_repeat_mode.r8_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000116,
    "KHR-GL42.texture_repeat_mode.r8_11x131_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000117,
    "KHR-GL42.texture_repeat_mode.r8_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000118,
    "KHR-GL42.texture_repeat_mode.r8_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000119,
    "KHR-GL42.texture_repeat_mode.r8_11x131_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000120,
    "KHR-GL42.texture_repeat_mode.r8_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000121,
    "KHR-GL42.texture_repeat_mode.rgb565_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000122,
    "KHR-GL42.texture_repeat_mode.rgb565_11x131_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000123,
    "KHR-GL42.texture_repeat_mode.rgb565_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000124,
    "KHR-GL42.texture_repeat_mode.rgb565_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000125,
    "KHR-GL42.texture_repeat_mode.rgb565_11x131_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000126,
    "KHR-GL42.texture_repeat_mode.rgb565_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000127,
    "KHR-GL42.texture_repeat_mode.rgb565_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000128,
    "KHR-GL42.texture_repeat_mode.rgb565_11x131_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000129,
    "KHR-GL42.texture_repeat_mode.rgb565_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000130,
    "KHR-GL42.texture_repeat_mode.rgb8_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000131,
    "KHR-GL42.texture_repeat_mode.rgb8_11x131_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000132,
    "KHR-GL42.texture_repeat_mode.rgb8_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000133,
    "KHR-GL42.texture_repeat_mode.rgb8_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000134,
    "KHR-GL42.texture_repeat_mode.rgb8_11x131_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000135,
    "KHR-GL42.texture_repeat_mode.rgb8_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000136,
    "KHR-GL42.texture_repeat_mode.rgb8_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000137,
    "KHR-GL42.texture_repeat_mode.rgb8_11x131_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000138,
    "KHR-GL42.texture_repeat_mode.rgb8_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000139,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000140,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_11x131_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000141,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000142,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000143,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_11x131_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000144,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000145,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000146,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_11x131_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000147,
    "KHR-GL42.texture_repeat_mode.rgb10_a2_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000148,
    "KHR-GL42.texture_repeat_mode.r32ui_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000149,
    "KHR-GL42.texture_repeat_mode.r32ui_11x131_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000150,
    "KHR-GL42.texture_repeat_mode.r32ui_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000151,
    "KHR-GL42.texture_repeat_mode.r32ui_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000152,
    "KHR-GL42.texture_repeat_mode.r32ui_11x131_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000153,
    "KHR-GL42.texture_repeat_mode.r32ui_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000154,
    "KHR-GL42.texture_repeat_mode.r32ui_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000155,
    "KHR-GL42.texture_repeat_mode.r32ui_11x131_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000156,
    "KHR-GL42.texture_repeat_mode.r32ui_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000157,
    "KHR-GL42.texture_repeat_mode.rg32ui_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000158,
    "KHR-GL42.texture_repeat_mode.rg32ui_11x131_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000159,
    "KHR-GL42.texture_repeat_mode.rg32ui_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000160,
    "KHR-GL42.texture_repeat_mode.rg32ui_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000161,
    "KHR-GL42.texture_repeat_mode.rg32ui_11x131_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000162,
    "KHR-GL42.texture_repeat_mode.rg32ui_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000163,
    "KHR-GL42.texture_repeat_mode.rg32ui_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000164,
    "KHR-GL42.texture_repeat_mode.rg32ui_11x131_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000165,
    "KHR-GL42.texture_repeat_mode.rg32ui_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000166,
    "KHR-GL42.texture_repeat_mode.rgba32ui_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000167,
    "KHR-GL42.texture_repeat_mode.rgba32ui_11x131_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000168,
    "KHR-GL42.texture_repeat_mode.rgba32ui_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000169,
    "KHR-GL42.texture_repeat_mode.rgba32ui_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000170,
    "KHR-GL42.texture_repeat_mode.rgba32ui_11x131_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000171,
    "KHR-GL42.texture_repeat_mode.rgba32ui_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000172,
    "KHR-GL42.texture_repeat_mode.rgba32ui_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000173,
    "KHR-GL42.texture_repeat_mode.rgba32ui_11x131_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000174,
    "KHR-GL42.texture_repeat_mode.rgba32ui_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000175,
    "KHR-GL42.texture_repeat_mode.depth_component16_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000176,
    "KHR-GL42.texture_repeat_mode.depth_component16_11x131_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000177,
    "KHR-GL42.texture_repeat_mode.depth_component16_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000178,
    "KHR-GL42.texture_repeat_mode.depth_component16_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000179,
    "KHR-GL42.texture_repeat_mode.depth_component16_11x131_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000180,
    "KHR-GL42.texture_repeat_mode.depth_component16_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000181,
    "KHR-GL42.texture_repeat_mode.depth_component16_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000182,
    "KHR-GL42.texture_repeat_mode.depth_component16_11x131_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000183,
    "KHR-GL42.texture_repeat_mode.depth_component16_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000184,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000185,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_11x131_0_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000186,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000187,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000188,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_11x131_1_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000189,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000190,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000191,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_11x131_2_repeat");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000192,
    "KHR-GL42.texture_repeat_mode.depth24_stencil8_11x131_2_mirrored_repeat");
