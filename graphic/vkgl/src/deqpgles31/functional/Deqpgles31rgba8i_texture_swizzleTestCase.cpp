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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013107,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d.rgba8i.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013108,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d.rgba8i.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013109,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d.rgba8i.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013110,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d.rgba8i.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013111,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d.rgba8i.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013112,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d.rgba8i.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013176,
        "dEQP-GLES31.functional.texture.gather.basic.2d_a",
        "rray.rgba8i.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013177,
        "dEQP-GLES31.functional.texture.gather.basic.2d_a",
        "rray.rgba8i.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013178,
        "dEQP-GLES31.functional.texture.gather.basic.2d_",
        "array.rgba8i.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013179,
        "dEQP-GLES31.functional.texture.gather.basic.2d_",
        "array.rgba8i.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013180,
        "dEQP-GLES31.functional.texture.gather.basic.2d_",
        "array.rgba8i.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013181,
        "dEQP-GLES31.functional.texture.gather.basic.2d_",
        "array.rgba8i.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013263,
        "dEQP-GLES31.functional.texture.gather.basic.cu",
        "be.rgba8i.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013264,
        "dEQP-GLES31.functional.texture.gather.basic.cu",
        "be.rgba8i.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013265,
        "dEQP-GLES31.functional.texture.gather.basic.c",
        "ube.rgba8i.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013266,
        "dEQP-GLES31.functional.texture.gather.basic.c",
        "ube.rgba8i.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013267,
        "dEQP-GLES31.functional.texture.gather.basic.c",
        "ube.rgba8i.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013268,
        "dEQP-GLES31.functional.texture.gather.basic.c",
        "ube.rgba8i.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013385,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d.rgba8i.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013386,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d.rgba8i.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013387,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d.rgba8i.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013388,
        "dEQP-GLES31.functional.texture.gather.offset.implementa",
        "tion_offset.2d.rgba8i.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013389,
        "dEQP-GLES31.functional.texture.gather.offset.implementa",
        "tion_offset.2d.rgba8i.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013390,
        "dEQP-GLES31.functional.texture.gather.offset.implementa",
        "tion_offset.2d.rgba8i.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013454,
        "dEQP-GLES31.functional.texture.gather.offset.implementation",
        "_offset.2d_array.rgba8i.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013455,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_",
        "offset.2d_array.rgba8i.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013456,
        "dEQP-GLES31.functional.texture.gather.offset.implementation",
        "_offset.2d_array.rgba8i.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013457,
        "dEQP-GLES31.functional.texture.gather.offset.implementatio",
        "n_offset.2d_array.rgba8i.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013458,
        "dEQP-GLES31.functional.texture.gather.offset.implementatio",
        "n_offset.2d_array.rgba8i.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013459,
        "dEQP-GLES31.functional.texture.gather.offset.implementatio",
        "n_offset.2d_array.rgba8i.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013583,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d.rgba8i.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013584,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d.rgba8i.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013585,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d.rgba8i.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013586,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implem",
        "entation_offset.2d.rgba8i.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013587,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implem",
        "entation_offset.2d.rgba8i.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013588,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implem",
        "entation_offset.2d.rgba8i.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013652,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementa",
        "tion_offset.2d_array.rgba8i.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013653,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementat",
        "ion_offset.2d_array.rgba8i.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013654,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementa",
        "tion_offset.2d_array.rgba8i.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013655,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implement",
        "ation_offset.2d_array.rgba8i.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013656,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implement",
        "ation_offset.2d_array.rgba8i.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013657,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implement",
        "ation_offset.2d_array.rgba8i.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013781,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d.rgba8i.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013782,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d.rgba8i.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013783,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d.rgba8i.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013784,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d.rgba8i.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013785,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d.rgba8i.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013786,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d.rgba8i.texture_swizzle.one_red_green_blue");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013850,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation",
        "_offset.2d_array.rgba8i.texture_swizzle.red_green_blue_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013851,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation",
        "_offset.2d_array.rgba8i.texture_swizzle.green_blue_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013852,
        "dEQP-GLES31.functional.texture.gather.offsets.implementatio",
        "n_offset.2d_array.rgba8i.texture_swizzle.blue_alpha_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013853,
        "dEQP-GLES31.functional.texture.gather.offsets.implementatio",
        "n_offset.2d_array.rgba8i.texture_swizzle.alpha_zero_one_red");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013854,
        "dEQP-GLES31.functional.texture.gather.offsets.implementatio",
        "n_offset.2d_array.rgba8i.texture_swizzle.zero_one_red_green");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013855,
        "dEQP-GLES31.functional.texture.gather.offsets.implementatio",
        "n_offset.2d_array.rgba8i.texture_swizzle.one_red_green_blue");
