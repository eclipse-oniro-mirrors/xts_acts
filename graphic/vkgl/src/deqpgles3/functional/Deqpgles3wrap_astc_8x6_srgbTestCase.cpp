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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023599,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023600,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x6_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023601,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023602,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023603,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023604,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023605,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023606,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023607,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x6_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023608,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023609,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x6_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023610,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023611,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023612,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023613,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x6_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023614,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023615,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x6_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023616,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023617,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023618,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "8x6_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023619,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023620,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023621,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023622,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023623,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023624,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023625,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "6_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023626,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023627,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "6_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023628,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023629,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023630,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023631,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "6_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023632,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023633,
        "dEQP-GLES3.functional.texture.wrap.astc_8x",
        "6_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023634,
        "dEQP-GLES3.functional.texture.wrap.astc_8",
        "x6_srgb.mirror_mirror_linear_not_divisible");
