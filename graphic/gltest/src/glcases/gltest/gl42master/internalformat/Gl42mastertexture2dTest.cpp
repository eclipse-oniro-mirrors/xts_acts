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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004482,
    "KHR-GL42.internalformat.texture2d.red_byte_r8_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004483,
    "KHR-GL42.internalformat.texture2d.red_short_r16_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004484,
    "KHR-GL42.internalformat.texture2d.rg_byte_rg8_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004485,
    "KHR-GL42.internalformat.texture2d.rg_short_rg16_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004486,
    "KHR-GL42.internalformat.texture2d.rgb_byte_rgb8_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004487,
    "KHR-GL42.internalformat.texture2d.rgb_short_rgb16_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004488,
    "KHR-GL42.internalformat.texture2d.rgba_byte_rgba8_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004489,
    "KHR-GL42.internalformat.texture2d.rgba_short_rgba16_snorm");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004490,
    "KHR-GL42.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgba");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004491,
    "KHR-GL42.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgb10_a2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004492,
    "KHR-GL42.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgb5_a1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004493,
    "KHR-GL42.internalformat.texture2d.depth_component_unsigned_short_depth_component");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004494,
    "KHR-GL42.internalformat.texture2d.depth_component_unsigned_short_depth_component16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004495,
    "KHR-GL42.internalformat.texture2d.depth_component_unsigned_int_depth_component");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004496,
    "KHR-GL42.internalformat.texture2d.depth_component_unsigned_int_depth_component24");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004497,
    "KHR-GL42.internalformat.texture2d.depth_component_unsigned_int_depth_component32");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004498,
    "KHR-GL42.internalformat.texture2d.depth_component_unsigned_int_depth_component16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004499,
    "KHR-GL42.internalformat.texture2d.rgba_unsigned_byte_rgb9_e5");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004500,
    "KHR-GL42.internalformat.texture2d.rgba_integer_unsigned_int_2_10_10_10_rev_rgb10_a2ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004501,
    "KHR-GL42.internalformat.texture2d.rgba_integer_unsigned_int_rgba32ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004502,
    "KHR-GL42.internalformat.texture2d.rgb_integer_unsigned_int_rgb32ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004503,
    "KHR-GL42.internalformat.texture2d.rgba_integer_unsigned_short_rgba16ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004504,
    "KHR-GL42.internalformat.texture2d.rgb_integer_unsigned_short_rgb16ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004505,
    "KHR-GL42.internalformat.texture2d.rgba_integer_unsigned_byte_rgba8ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004506,
    "KHR-GL42.internalformat.texture2d.rgb_integer_unsigned_byte_rgb8ui");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004507,
    "KHR-GL42.internalformat.texture2d.rgba_integer_int_rgba32i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004508,
    "KHR-GL42.internalformat.texture2d.rgb_integer_int_rgb32i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004509,
    "KHR-GL42.internalformat.texture2d.rgba_integer_short_rgba16i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004510,
    "KHR-GL42.internalformat.texture2d.rgb_integer_short_rgb16i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004511,
    "KHR-GL42.internalformat.texture2d.rgba_integer_byte_rgba8i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004512,
    "KHR-GL42.internalformat.texture2d.rgb_integer_byte_rgb8i");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004513,
    "KHR-GL42.internalformat.texture2d.red_half_float_r16f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004514,
    "KHR-GL42.internalformat.texture2d.rg_half_float_rg16f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004515,
    "KHR-GL42.internalformat.texture2d.rgb_half_float_rgb16f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004516,
    "KHR-GL42.internalformat.texture2d.rgba_half_float_rgba16f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004517,
    "KHR-GL42.internalformat.texture2d.red_float_r32f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004518,
    "KHR-GL42.internalformat.texture2d.rg_float_rg32f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004519,
    "KHR-GL42.internalformat.texture2d.rgb_float_rgb32f");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004520,
    "KHR-GL42.internalformat.texture2d.rgba_float_rgba32f");
