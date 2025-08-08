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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013092,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d.rgba8ui.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013093,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        ".rgba8ui.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013094,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d.rgba8ui.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013095,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d.rgba8ui.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013096,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d.rgba8ui.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013097,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d.rgba8ui.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013161,
        "dEQP-GLES31.functional.texture.gather.basic.2d_a",
        "rray.rgba8ui.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013162,
        "dEQP-GLES31.functional.texture.gather.basic.2d_ar",
        "ray.rgba8ui.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013163,
        "dEQP-GLES31.functional.texture.gather.basic.2d_a",
        "rray.rgba8ui.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013164,
        "dEQP-GLES31.functional.texture.gather.basic.2d_",
        "array.rgba8ui.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013165,
        "dEQP-GLES31.functional.texture.gather.basic.2d_",
        "array.rgba8ui.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013166,
        "dEQP-GLES31.functional.texture.gather.basic.2d_",
        "array.rgba8ui.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013242,
        "dEQP-GLES31.functional.texture.gather.basic.cu",
        "be.rgba8ui.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013243,
        "dEQP-GLES31.functional.texture.gather.basic.cub",
        "e.rgba8ui.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013244,
        "dEQP-GLES31.functional.texture.gather.basic.cu",
        "be.rgba8ui.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013245,
        "dEQP-GLES31.functional.texture.gather.basic.c",
        "ube.rgba8ui.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013246,
        "dEQP-GLES31.functional.texture.gather.basic.c",
        "ube.rgba8ui.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013247,
        "dEQP-GLES31.functional.texture.gather.basic.c",
        "ube.rgba8ui.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013370,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d.rgba8ui.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013371,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d.rgba8ui.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013372,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d.rgba8ui.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013373,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d.rgba8ui.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013374,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d.rgba8ui.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013375,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d.rgba8ui.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013439,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_",
        "offset.2d_array.rgba8ui.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013440,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_",
        "offset.2d_array.rgba8ui.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013441,
        "dEQP-GLES31.functional.texture.gather.offset.implementation",
        "_offset.2d_array.rgba8ui.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013442,
        "dEQP-GLES31.functional.texture.gather.offset.implementation",
        "_offset.2d_array.rgba8ui.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013443,
        "dEQP-GLES31.functional.texture.gather.offset.implementation",
        "_offset.2d_array.rgba8ui.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013444,
        "dEQP-GLES31.functional.texture.gather.offset.implementation",
        "_offset.2d_array.rgba8ui.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013568,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d.rgba8ui.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013569,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d.rgba8ui.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013570,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d.rgba8ui.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013571,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d.rgba8ui.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013572,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d.rgba8ui.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013573,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d.rgba8ui.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013637,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementat",
        "ion_offset.2d_array.rgba8ui.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013638,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementat",
        "ion_offset.2d_array.rgba8ui.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013639,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementa",
        "tion_offset.2d_array.rgba8ui.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013640,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementa",
        "tion_offset.2d_array.rgba8ui.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013641,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementa",
        "tion_offset.2d_array.rgba8ui.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013642,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementa",
        "tion_offset.2d_array.rgba8ui.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013766,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d.rgba8ui.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013767,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d.rgba8ui.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013768,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d.rgba8ui.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013769,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d.rgba8ui.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013770,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d.rgba8ui.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013771,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d.rgba8ui.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013835,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation",
        "_offset.2d_array.rgba8ui.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013836,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_",
        "offset.2d_array.rgba8ui.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013837,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation",
        "_offset.2d_array.rgba8ui.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013838,
        "dEQP-GLES31.functional.texture.gather.offsets.implementatio",
        "n_offset.2d_array.rgba8ui.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013839,
        "dEQP-GLES31.functional.texture.gather.offsets.implementatio",
        "n_offset.2d_array.rgba8ui.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013840,
        "dEQP-GLES31.functional.texture.gather.offsets.implementatio",
        "n_offset.2d_array.rgba8ui.texture_swizzle.one_red_green_blue");
