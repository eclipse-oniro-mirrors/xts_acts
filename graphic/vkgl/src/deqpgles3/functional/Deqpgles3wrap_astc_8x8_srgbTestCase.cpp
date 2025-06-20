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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023635,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023636,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x8_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023637,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023638,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023639,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023640,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023641,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023642,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023643,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x8_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023644,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023645,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x8_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023646,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023647,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023648,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023649,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x8_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023650,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023651,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x8_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023652,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023653,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023654,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x8_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023655,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023656,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023657,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023658,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023659,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023660,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023661,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "8_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023662,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023663,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "8_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023664,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023665,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023666,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023667,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "8_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023668,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023669,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "8_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023670,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x8_srgb.mirror_mirror_linear_not_divisible");
