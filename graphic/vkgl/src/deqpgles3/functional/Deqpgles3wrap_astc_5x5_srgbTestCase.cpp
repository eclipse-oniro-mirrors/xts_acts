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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023455,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023456,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x5_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023457,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023458,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023459,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023460,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023461,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023462,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023463,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "5x5_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023464,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023465,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "5x5_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023466,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023467,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023468,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023469,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "5x5_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023470,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023471,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "5x5_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023472,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023473,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023474,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "5x5_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023475,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023476,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023477,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023478,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023479,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023480,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023481,
        "dEQP-GLES3.functional.texture.wrap.astc_5x",
        "5_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023482,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023483,
        "dEQP-GLES3.functional.texture.wrap.astc_5x",
        "5_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023484,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023485,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023486,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023487,
        "dEQP-GLES3.functional.texture.wrap.astc_5x",
        "5_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023488,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023489,
        "dEQP-GLES3.functional.texture.wrap.astc_5x",
        "5_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023490,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x5_srgb.mirror_mirror_linear_not_divisible");
