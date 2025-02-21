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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023743,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023744,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023745,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023746,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023747,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023748,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023749,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023750,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023751,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023752,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023753,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023754,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023755,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023756,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023757,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023758,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023759,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023760,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023761,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x8_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023762,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x8_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023763,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023764,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x8_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023765,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023766,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x8_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023767,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023768,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x8_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023769,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023770,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023771,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023772,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023773,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023774,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x8_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023775,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023776,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023777,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023778,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x8_srgb.mirror_mirror_linear_not_divisible");
