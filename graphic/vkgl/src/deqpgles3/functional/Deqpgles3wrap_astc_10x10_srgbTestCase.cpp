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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023779,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023780,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x10_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023781,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023782,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023783,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023784,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023785,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023786,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023787,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x10_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023788,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023789,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x10_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023790,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023791,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023792,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023793,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x10_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023794,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023795,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x10_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023796,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023797,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023798,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x10_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023799,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023800,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023801,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023802,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023803,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023804,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023805,
        "dEQP-GLES3.functional.texture.wrap.astc_10x",
        "10_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023806,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023807,
        "dEQP-GLES3.functional.texture.wrap.astc_10x",
        "10_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023808,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023809,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023810,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023811,
        "dEQP-GLES3.functional.texture.wrap.astc_10x",
        "10_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023812,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023813,
        "dEQP-GLES3.functional.texture.wrap.astc_10x",
        "10_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023814,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x10_srgb.mirror_mirror_linear_not_divisible");
