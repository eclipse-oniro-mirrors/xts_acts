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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023707,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023708,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023709,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023710,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023711,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023712,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023713,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023714,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023715,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023716,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023717,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023718,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023719,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023720,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023721,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023722,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023723,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023724,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023725,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x6_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023726,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x6_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023727,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023728,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x6_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023729,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023730,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x6_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023731,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023732,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x6_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023733,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023734,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023735,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023736,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023737,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023738,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x6_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023739,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023740,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023741,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023742,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x6_srgb.mirror_mirror_linear_not_divisible");
