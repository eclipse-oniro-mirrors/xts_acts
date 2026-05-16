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
#include "../ActsKhrgles30003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002976,
        "KHR-GLES3.texture_repeat_mo",
        "de.r8_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002977,
        "KHR-GLES3.texture_repea",
        "t_mode.r8_49x23_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002978,
        "KHR-GLES3.texture_repeat_mod",
        "e.r8_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002979,
        "KHR-GLES3.texture_repeat_mo",
        "de.r8_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002980,
        "KHR-GLES3.texture_repea",
        "t_mode.r8_49x23_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002981,
        "KHR-GLES3.texture_repeat_mod",
        "e.r8_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002982,
        "KHR-GLES3.texture_repeat_mo",
        "de.r8_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002983,
        "KHR-GLES3.texture_repea",
        "t_mode.r8_49x23_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002984,
        "KHR-GLES3.texture_repeat_mod",
        "e.r8_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002985,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb565_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002986,
        "KHR-GLES3.texture_repeat_",
        "mode.rgb565_49x23_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002987,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb565_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002988,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb565_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002989,
        "KHR-GLES3.texture_repeat_",
        "mode.rgb565_49x23_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002990,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb565_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002991,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb565_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002992,
        "KHR-GLES3.texture_repeat_",
        "mode.rgb565_49x23_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002993,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb565_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002994,
        "KHR-GLES3.texture_repeat_mod",
        "e.rgb8_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002995,
        "KHR-GLES3.texture_repeat",
        "_mode.rgb8_49x23_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002996,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb8_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002997,
        "KHR-GLES3.texture_repeat_mod",
        "e.rgb8_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002998,
        "KHR-GLES3.texture_repeat",
        "_mode.rgb8_49x23_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002999,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb8_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003000,
        "KHR-GLES3.texture_repeat_mod",
        "e.rgb8_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003001,
        "KHR-GLES3.texture_repeat",
        "_mode.rgb8_49x23_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003002,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb8_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003003,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb10_a2_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003004,
        "KHR-GLES3.texture_repeat_m",
        "ode.rgb10_a2_49x23_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003005,
        "KHR-GLES3.texture_repeat_mode.r",
        "gb10_a2_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003006,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb10_a2_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003007,
        "KHR-GLES3.texture_repeat_m",
        "ode.rgb10_a2_49x23_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003008,
        "KHR-GLES3.texture_repeat_mode.r",
        "gb10_a2_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003009,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb10_a2_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003010,
        "KHR-GLES3.texture_repeat_m",
        "ode.rgb10_a2_49x23_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003011,
        "KHR-GLES3.texture_repeat_mode.r",
        "gb10_a2_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003012,
        "KHR-GLES3.texture_repeat_mod",
        "e.r32ui_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003013,
        "KHR-GLES3.texture_repeat_",
        "mode.r32ui_49x23_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003014,
        "KHR-GLES3.texture_repeat_mode",
        ".r32ui_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003015,
        "KHR-GLES3.texture_repeat_mod",
        "e.r32ui_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003016,
        "KHR-GLES3.texture_repeat_",
        "mode.r32ui_49x23_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003017,
        "KHR-GLES3.texture_repeat_mode",
        ".r32ui_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003018,
        "KHR-GLES3.texture_repeat_mod",
        "e.r32ui_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003019,
        "KHR-GLES3.texture_repeat_",
        "mode.r32ui_49x23_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003020,
        "KHR-GLES3.texture_repeat_mode",
        ".r32ui_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003021,
        "KHR-GLES3.texture_repeat_mode",
        ".rg32ui_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003022,
        "KHR-GLES3.texture_repeat_",
        "mode.rg32ui_49x23_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003023,
        "KHR-GLES3.texture_repeat_mode.",
        "rg32ui_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003024,
        "KHR-GLES3.texture_repeat_mode",
        ".rg32ui_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003025,
        "KHR-GLES3.texture_repeat_",
        "mode.rg32ui_49x23_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003026,
        "KHR-GLES3.texture_repeat_mode.",
        "rg32ui_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003027,
        "KHR-GLES3.texture_repeat_mode",
        ".rg32ui_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003028,
        "KHR-GLES3.texture_repeat_",
        "mode.rg32ui_49x23_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003029,
        "KHR-GLES3.texture_repeat_mode.",
        "rg32ui_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003030,
        "KHR-GLES3.texture_repeat_mode.",
        "rgba32ui_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003031,
        "KHR-GLES3.texture_repeat_m",
        "ode.rgba32ui_49x23_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003032,
        "KHR-GLES3.texture_repeat_mode.r",
        "gba32ui_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003033,
        "KHR-GLES3.texture_repeat_mode.",
        "rgba32ui_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003034,
        "KHR-GLES3.texture_repeat_m",
        "ode.rgba32ui_49x23_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003035,
        "KHR-GLES3.texture_repeat_mode.r",
        "gba32ui_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003036,
        "KHR-GLES3.texture_repeat_mode.",
        "rgba32ui_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003037,
        "KHR-GLES3.texture_repeat_m",
        "ode.rgba32ui_49x23_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003038,
        "KHR-GLES3.texture_repeat_mode.r",
        "gba32ui_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003039,
        "KHR-GLES3.texture_repeat_mode.dept",
        "h_component16_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003040,
        "KHR-GLES3.texture_repeat_mode.d",
        "epth_component16_49x23_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003041,
        "KHR-GLES3.texture_repeat_mode.depth",
        "_component16_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003042,
        "KHR-GLES3.texture_repeat_mode.dept",
        "h_component16_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003043,
        "KHR-GLES3.texture_repeat_mode.d",
        "epth_component16_49x23_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003044,
        "KHR-GLES3.texture_repeat_mode.depth",
        "_component16_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003045,
        "KHR-GLES3.texture_repeat_mode.dept",
        "h_component16_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003046,
        "KHR-GLES3.texture_repeat_mode.d",
        "epth_component16_49x23_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003047,
        "KHR-GLES3.texture_repeat_mode.depth",
        "_component16_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003048,
        "KHR-GLES3.texture_repeat_mode.dept",
        "h24_stencil8_49x23_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003049,
        "KHR-GLES3.texture_repeat_mode.",
        "depth24_stencil8_49x23_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003050,
        "KHR-GLES3.texture_repeat_mode.depth",
        "24_stencil8_49x23_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003051,
        "KHR-GLES3.texture_repeat_mode.dept",
        "h24_stencil8_49x23_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003052,
        "KHR-GLES3.texture_repeat_mode.",
        "depth24_stencil8_49x23_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003053,
        "KHR-GLES3.texture_repeat_mode.depth",
        "24_stencil8_49x23_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003054,
        "KHR-GLES3.texture_repeat_mode.dept",
        "h24_stencil8_49x23_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003055,
        "KHR-GLES3.texture_repeat_mode.",
        "depth24_stencil8_49x23_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003056,
        "KHR-GLES3.texture_repeat_mode.depth",
        "24_stencil8_49x23_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003057,
        "KHR-GLES3.texture_repeat_mo",
        "de.r8_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003058,
        "KHR-GLES3.texture_repeat",
        "_mode.r8_11x131_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003059,
        "KHR-GLES3.texture_repeat_mod",
        "e.r8_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003060,
        "KHR-GLES3.texture_repeat_mo",
        "de.r8_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003061,
        "KHR-GLES3.texture_repeat",
        "_mode.r8_11x131_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003062,
        "KHR-GLES3.texture_repeat_mod",
        "e.r8_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003063,
        "KHR-GLES3.texture_repeat_mo",
        "de.r8_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003064,
        "KHR-GLES3.texture_repeat",
        "_mode.r8_11x131_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003065,
        "KHR-GLES3.texture_repeat_mod",
        "e.r8_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003066,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb565_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003067,
        "KHR-GLES3.texture_repeat_m",
        "ode.rgb565_11x131_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003068,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb565_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003069,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb565_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003070,
        "KHR-GLES3.texture_repeat_m",
        "ode.rgb565_11x131_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003071,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb565_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003072,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb565_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003073,
        "KHR-GLES3.texture_repeat_m",
        "ode.rgb565_11x131_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003074,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb565_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003075,
        "KHR-GLES3.texture_repeat_mod",
        "e.rgb8_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003076,
        "KHR-GLES3.texture_repeat_",
        "mode.rgb8_11x131_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003077,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb8_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003078,
        "KHR-GLES3.texture_repeat_mod",
        "e.rgb8_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003079,
        "KHR-GLES3.texture_repeat_",
        "mode.rgb8_11x131_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003080,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb8_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003081,
        "KHR-GLES3.texture_repeat_mod",
        "e.rgb8_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003082,
        "KHR-GLES3.texture_repeat_",
        "mode.rgb8_11x131_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003083,
        "KHR-GLES3.texture_repeat_mode",
        ".rgb8_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003084,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb10_a2_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003085,
        "KHR-GLES3.texture_repeat_mo",
        "de.rgb10_a2_11x131_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003086,
        "KHR-GLES3.texture_repeat_mode.r",
        "gb10_a2_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003087,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb10_a2_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003088,
        "KHR-GLES3.texture_repeat_mo",
        "de.rgb10_a2_11x131_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003089,
        "KHR-GLES3.texture_repeat_mode.r",
        "gb10_a2_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003090,
        "KHR-GLES3.texture_repeat_mode.",
        "rgb10_a2_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003091,
        "KHR-GLES3.texture_repeat_mo",
        "de.rgb10_a2_11x131_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003092,
        "KHR-GLES3.texture_repeat_mode.r",
        "gb10_a2_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003093,
        "KHR-GLES3.texture_repeat_mode",
        ".r32ui_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003094,
        "KHR-GLES3.texture_repeat_",
        "mode.r32ui_11x131_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003095,
        "KHR-GLES3.texture_repeat_mode.",
        "r32ui_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003096,
        "KHR-GLES3.texture_repeat_mode",
        ".r32ui_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003097,
        "KHR-GLES3.texture_repeat_",
        "mode.r32ui_11x131_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003098,
        "KHR-GLES3.texture_repeat_mode.",
        "r32ui_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003099,
        "KHR-GLES3.texture_repeat_mode",
        ".r32ui_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003100,
        "KHR-GLES3.texture_repeat_",
        "mode.r32ui_11x131_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003101,
        "KHR-GLES3.texture_repeat_mode.",
        "r32ui_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003102,
        "KHR-GLES3.texture_repeat_mode",
        ".rg32ui_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003103,
        "KHR-GLES3.texture_repeat_m",
        "ode.rg32ui_11x131_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003104,
        "KHR-GLES3.texture_repeat_mode.",
        "rg32ui_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003105,
        "KHR-GLES3.texture_repeat_mode",
        ".rg32ui_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003106,
        "KHR-GLES3.texture_repeat_m",
        "ode.rg32ui_11x131_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003107,
        "KHR-GLES3.texture_repeat_mode.",
        "rg32ui_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003108,
        "KHR-GLES3.texture_repeat_mode",
        ".rg32ui_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003109,
        "KHR-GLES3.texture_repeat_m",
        "ode.rg32ui_11x131_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003110,
        "KHR-GLES3.texture_repeat_mode.",
        "rg32ui_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003111,
        "KHR-GLES3.texture_repeat_mode.",
        "rgba32ui_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003112,
        "KHR-GLES3.texture_repeat_mo",
        "de.rgba32ui_11x131_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003113,
        "KHR-GLES3.texture_repeat_mode.r",
        "gba32ui_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003114,
        "KHR-GLES3.texture_repeat_mode.",
        "rgba32ui_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003115,
        "KHR-GLES3.texture_repeat_mo",
        "de.rgba32ui_11x131_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003116,
        "KHR-GLES3.texture_repeat_mode.r",
        "gba32ui_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003117,
        "KHR-GLES3.texture_repeat_mode.",
        "rgba32ui_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003118,
        "KHR-GLES3.texture_repeat_mo",
        "de.rgba32ui_11x131_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003119,
        "KHR-GLES3.texture_repeat_mode.r",
        "gba32ui_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003120,
        "KHR-GLES3.texture_repeat_mode.depth",
        "_component16_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003121,
        "KHR-GLES3.texture_repeat_mode.d",
        "epth_component16_11x131_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003122,
        "KHR-GLES3.texture_repeat_mode.depth_",
        "component16_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003123,
        "KHR-GLES3.texture_repeat_mode.depth",
        "_component16_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003124,
        "KHR-GLES3.texture_repeat_mode.d",
        "epth_component16_11x131_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003125,
        "KHR-GLES3.texture_repeat_mode.depth_",
        "component16_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003126,
        "KHR-GLES3.texture_repeat_mode.depth",
        "_component16_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003127,
        "KHR-GLES3.texture_repeat_mode.d",
        "epth_component16_11x131_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003128,
        "KHR-GLES3.texture_repeat_mode.depth_",
        "component16_11x131_2_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003129,
        "KHR-GLES3.texture_repeat_mode.dept",
        "h24_stencil8_11x131_0_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003130,
        "KHR-GLES3.texture_repeat_mode.d",
        "epth24_stencil8_11x131_0_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003131,
        "KHR-GLES3.texture_repeat_mode.depth",
        "24_stencil8_11x131_0_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003132,
        "KHR-GLES3.texture_repeat_mode.dept",
        "h24_stencil8_11x131_1_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003133,
        "KHR-GLES3.texture_repeat_mode.d",
        "epth24_stencil8_11x131_1_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003134,
        "KHR-GLES3.texture_repeat_mode.depth",
        "24_stencil8_11x131_1_mirrored_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003135,
        "KHR-GLES3.texture_repeat_mode.dept",
        "h24_stencil8_11x131_2_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003136,
        "KHR-GLES3.texture_repeat_mode.d",
        "epth24_stencil8_11x131_2_repeat");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_003137,
        "KHR-GLES3.texture_repeat_mode.depth",
        "24_stencil8_11x131_2_mirrored_repeat");
