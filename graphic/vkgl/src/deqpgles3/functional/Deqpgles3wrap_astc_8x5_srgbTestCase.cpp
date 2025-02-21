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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023563,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023564,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x5_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023565,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023566,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023567,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023568,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023569,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023570,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023571,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x5_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023572,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023573,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x5_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023574,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023575,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023576,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023577,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x5_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023578,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023579,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x5_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023580,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023581,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023582,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x5_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023583,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023584,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023585,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023586,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023587,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023588,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023589,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "5_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023590,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023591,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "5_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023592,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023593,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023594,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023595,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "5_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023596,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023597,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "5_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023598,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x5_srgb.mirror_mirror_linear_not_divisible");
