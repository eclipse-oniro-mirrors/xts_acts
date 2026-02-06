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
#include "../ActsDeqpgles30024TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023815,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023816,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x10_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023817,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023818,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023819,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023820,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023821,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023822,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023823,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "2x10_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023824,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023825,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "2x10_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023826,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023827,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023828,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023829,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "2x10_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023830,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023831,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "2x10_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023832,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023833,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023834,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "2x10_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023835,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023836,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023837,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023838,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023839,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023840,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023841,
        "dEQP-GLES3.functional.texture.wrap.astc_12x",
        "10_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023842,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023843,
        "dEQP-GLES3.functional.texture.wrap.astc_12x",
        "10_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023844,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023845,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023846,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023847,
        "dEQP-GLES3.functional.texture.wrap.astc_12x",
        "10_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023848,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023849,
        "dEQP-GLES3.functional.texture.wrap.astc_12x",
        "10_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023850,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x10_srgb.mirror_mirror_linear_not_divisible");
