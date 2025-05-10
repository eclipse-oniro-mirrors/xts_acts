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
#include "../ActsDeqpgles30026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025217,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.alpha_all_red");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025218,
        "dEQP-GLES3.functional.texture.swi",
        "zzle.multi_channel.alpha_all_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025219,
        "dEQP-GLES3.functional.texture.swi",
        "zzle.multi_channel.alpha_all_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025220,
        "dEQP-GLES3.functional.texture.swi",
        "zzle.multi_channel.alpha_all_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025221,
        "dEQP-GLES3.functional.texture.swi",
        "zzle.multi_channel.alpha_all_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025222,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.alpha_all_one");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025223,
        "dEQP-GLES3.functional.texture.s",
        "wizzle.multi_channel.alpha_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025224,
        "dEQP-GLES3.functional.texture.s",
        "wizzle.multi_channel.alpha_abgr");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025225,
        "dEQP-GLES3.functional.texture.swizzle",
        ".multi_channel.alpha_one_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025226,
        "dEQP-GLES3.functional.texture.swiz",
        "zle.multi_channel.luminance_all_red");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025227,
        "dEQP-GLES3.functional.texture.swizz",
        "le.multi_channel.luminance_all_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025228,
        "dEQP-GLES3.functional.texture.swizz",
        "le.multi_channel.luminance_all_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025229,
        "dEQP-GLES3.functional.texture.swizz",
        "le.multi_channel.luminance_all_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025230,
        "dEQP-GLES3.functional.texture.swizz",
        "le.multi_channel.luminance_all_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025231,
        "dEQP-GLES3.functional.texture.swiz",
        "zle.multi_channel.luminance_all_one");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025232,
        "dEQP-GLES3.functional.texture.swi",
        "zzle.multi_channel.luminance_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025233,
        "dEQP-GLES3.functional.texture.swi",
        "zzle.multi_channel.luminance_abgr");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025234,
        "dEQP-GLES3.functional.texture.swizzle.m",
        "ulti_channel.luminance_one_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025235,
        "dEQP-GLES3.functional.texture.swizzle",
        ".multi_channel.luminance_alpha_all_red");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025236,
        "dEQP-GLES3.functional.texture.swizzle.",
        "multi_channel.luminance_alpha_all_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025237,
        "dEQP-GLES3.functional.texture.swizzle.",
        "multi_channel.luminance_alpha_all_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025238,
        "dEQP-GLES3.functional.texture.swizzle.",
        "multi_channel.luminance_alpha_all_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025239,
        "dEQP-GLES3.functional.texture.swizzle.",
        "multi_channel.luminance_alpha_all_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025240,
        "dEQP-GLES3.functional.texture.swizzle",
        ".multi_channel.luminance_alpha_all_one");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025241,
        "dEQP-GLES3.functional.texture.swizzl",
        "e.multi_channel.luminance_alpha_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025242,
        "dEQP-GLES3.functional.texture.swizzl",
        "e.multi_channel.luminance_alpha_abgr");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025243,
        "dEQP-GLES3.functional.texture.swizzle.mult",
        "i_channel.luminance_alpha_one_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025244,
        "dEQP-GLES3.functional.texture.s",
        "wizzle.multi_channel.red_all_red");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025245,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.red_all_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025246,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.red_all_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025247,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.red_all_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025248,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.red_all_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025249,
        "dEQP-GLES3.functional.texture.s",
        "wizzle.multi_channel.red_all_one");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025250,
        "dEQP-GLES3.functional.texture.",
        "swizzle.multi_channel.red_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025251,
        "dEQP-GLES3.functional.texture.",
        "swizzle.multi_channel.red_abgr");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025252,
        "dEQP-GLES3.functional.texture.swizzl",
        "e.multi_channel.red_one_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025253,
        "dEQP-GLES3.functional.texture.s",
        "wizzle.multi_channel.rg_all_red");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025254,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.rg_all_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025255,
        "dEQP-GLES3.functional.texture.s",
        "wizzle.multi_channel.rg_all_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025256,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.rg_all_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025257,
        "dEQP-GLES3.functional.texture.s",
        "wizzle.multi_channel.rg_all_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025258,
        "dEQP-GLES3.functional.texture.s",
        "wizzle.multi_channel.rg_all_one");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025259,
        "dEQP-GLES3.functional.texture",
        ".swizzle.multi_channel.rg_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025260,
        "dEQP-GLES3.functional.texture",
        ".swizzle.multi_channel.rg_abgr");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025261,
        "dEQP-GLES3.functional.texture.swizzl",
        "e.multi_channel.rg_one_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025262,
        "dEQP-GLES3.functional.texture.s",
        "wizzle.multi_channel.rgb_all_red");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025263,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.rgb_all_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025264,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.rgb_all_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025265,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.rgb_all_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025266,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.rgb_all_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025267,
        "dEQP-GLES3.functional.texture.s",
        "wizzle.multi_channel.rgb_all_one");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025268,
        "dEQP-GLES3.functional.texture.",
        "swizzle.multi_channel.rgb_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025269,
        "dEQP-GLES3.functional.texture.",
        "swizzle.multi_channel.rgb_abgr");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025270,
        "dEQP-GLES3.functional.texture.swizzl",
        "e.multi_channel.rgb_one_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025271,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.rgba_all_red");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025272,
        "dEQP-GLES3.functional.texture.swi",
        "zzle.multi_channel.rgba_all_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025273,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.rgba_all_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025274,
        "dEQP-GLES3.functional.texture.swi",
        "zzle.multi_channel.rgba_all_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025275,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.rgba_all_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025276,
        "dEQP-GLES3.functional.texture.sw",
        "izzle.multi_channel.rgba_all_one");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025277,
        "dEQP-GLES3.functional.texture.",
        "swizzle.multi_channel.rgba_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025278,
        "dEQP-GLES3.functional.texture.",
        "swizzle.multi_channel.rgba_abgr");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025279,
        "dEQP-GLES3.functional.texture.swizzle",
        ".multi_channel.rgba_one_one_red_green");
