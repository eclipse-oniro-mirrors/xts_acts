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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013072,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d.rgba8.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013073,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d.rgba8.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013074,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d.rgba8.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013075,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".2d.rgba8.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013076,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".2d.rgba8.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013077,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".2d.rgba8.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013141,
        "dEQP-GLES31.functional.texture.gather.basic.2d_",
        "array.rgba8.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013142,
        "dEQP-GLES31.functional.texture.gather.basic.2d_a",
        "rray.rgba8.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013143,
        "dEQP-GLES31.functional.texture.gather.basic.2d_",
        "array.rgba8.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013144,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        "_array.rgba8.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013145,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        "_array.rgba8.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013146,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        "_array.rgba8.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013216,
        "dEQP-GLES31.functional.texture.gather.basic.c",
        "ube.rgba8.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013217,
        "dEQP-GLES31.functional.texture.gather.basic.cu",
        "be.rgba8.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013218,
        "dEQP-GLES31.functional.texture.gather.basic.c",
        "ube.rgba8.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013219,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "cube.rgba8.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013220,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "cube.rgba8.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013221,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "cube.rgba8.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013350,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d.rgba8.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013351,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d.rgba8.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013352,
        "dEQP-GLES31.functional.texture.gather.offset.implementa",
        "tion_offset.2d.rgba8.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013353,
        "dEQP-GLES31.functional.texture.gather.offset.implementa",
        "tion_offset.2d.rgba8.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013354,
        "dEQP-GLES31.functional.texture.gather.offset.implementa",
        "tion_offset.2d.rgba8.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013355,
        "dEQP-GLES31.functional.texture.gather.offset.implementa",
        "tion_offset.2d.rgba8.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013419,
        "dEQP-GLES31.functional.texture.gather.offset.implementation",
        "_offset.2d_array.rgba8.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013420,
        "dEQP-GLES31.functional.texture.gather.offset.implementation",
        "_offset.2d_array.rgba8.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013421,
        "dEQP-GLES31.functional.texture.gather.offset.implementatio",
        "n_offset.2d_array.rgba8.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013422,
        "dEQP-GLES31.functional.texture.gather.offset.implementatio",
        "n_offset.2d_array.rgba8.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013423,
        "dEQP-GLES31.functional.texture.gather.offset.implementatio",
        "n_offset.2d_array.rgba8.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013424,
        "dEQP-GLES31.functional.texture.gather.offset.implementatio",
        "n_offset.2d_array.rgba8.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013548,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d.rgba8.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013549,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d.rgba8.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013550,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implem",
        "entation_offset.2d.rgba8.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013551,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implem",
        "entation_offset.2d.rgba8.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013552,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implem",
        "entation_offset.2d.rgba8.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013553,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implem",
        "entation_offset.2d.rgba8.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013617,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementa",
        "tion_offset.2d_array.rgba8.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013618,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementa",
        "tion_offset.2d_array.rgba8.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013619,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implement",
        "ation_offset.2d_array.rgba8.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013620,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implement",
        "ation_offset.2d_array.rgba8.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013621,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implement",
        "ation_offset.2d_array.rgba8.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013622,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implement",
        "ation_offset.2d_array.rgba8.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013746,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d.rgba8.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013747,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d.rgba8.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013748,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d.rgba8.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013749,
        "dEQP-GLES31.functional.texture.gather.offsets.implement",
        "ation_offset.2d.rgba8.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013750,
        "dEQP-GLES31.functional.texture.gather.offsets.implement",
        "ation_offset.2d.rgba8.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013751,
        "dEQP-GLES31.functional.texture.gather.offsets.implement",
        "ation_offset.2d.rgba8.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013815,
        "dEQP-GLES31.functional.texture.gather.offsets.implementatio",
        "n_offset.2d_array.rgba8.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013816,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation",
        "_offset.2d_array.rgba8.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013817,
        "dEQP-GLES31.functional.texture.gather.offsets.implementatio",
        "n_offset.2d_array.rgba8.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013818,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d_array.rgba8.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013819,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d_array.rgba8.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013820,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d_array.rgba8.texture_swizzle.one_red_green_blue");
