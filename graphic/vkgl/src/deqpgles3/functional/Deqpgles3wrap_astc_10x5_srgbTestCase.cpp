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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023671,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023672,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023673,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023674,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023675,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023676,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023677,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023678,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023679,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023680,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023681,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023682,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023683,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023684,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023685,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023686,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023687,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023688,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023689,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x5_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023690,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x5_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023691,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023692,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x5_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023693,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023694,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x5_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023695,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023696,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x5_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023697,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023698,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023699,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023700,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023701,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023702,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "0x5_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023703,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023704,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023705,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023706,
        "dEQP-GLES3.functional.texture.wrap.astc_10",
        "x5_srgb.mirror_mirror_linear_not_divisible");
