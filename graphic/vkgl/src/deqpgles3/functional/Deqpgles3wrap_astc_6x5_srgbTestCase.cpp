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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023491,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023492,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x5_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023493,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023494,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023495,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023496,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023497,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023498,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023499,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "6x5_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023500,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023501,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "6x5_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023502,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023503,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023504,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023505,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "6x5_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023506,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023507,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "6x5_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023508,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023509,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023510,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "6x5_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023511,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023512,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023513,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023514,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023515,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023516,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023517,
        "dEQP-GLES3.functional.texture.wrap.astc_6x",
        "5_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023518,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023519,
        "dEQP-GLES3.functional.texture.wrap.astc_6x",
        "5_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023520,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023521,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023522,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023523,
        "dEQP-GLES3.functional.texture.wrap.astc_6x",
        "5_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023524,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023525,
        "dEQP-GLES3.functional.texture.wrap.astc_6x",
        "5_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023526,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x5_srgb.mirror_mirror_linear_not_divisible");
