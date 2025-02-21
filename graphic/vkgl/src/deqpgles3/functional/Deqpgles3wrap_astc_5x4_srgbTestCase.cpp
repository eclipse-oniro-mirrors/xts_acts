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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023419,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023420,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x4_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023421,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023422,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023423,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023424,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023425,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023426,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023427,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "5x4_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023428,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023429,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "5x4_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023430,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023431,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023432,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023433,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "5x4_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023434,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023435,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "5x4_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023436,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023437,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023438,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "5x4_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023439,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023440,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023441,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023442,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023443,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023444,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023445,
        "dEQP-GLES3.functional.texture.wrap.astc_5x",
        "4_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023446,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023447,
        "dEQP-GLES3.functional.texture.wrap.astc_5x",
        "4_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023448,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023449,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023450,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023451,
        "dEQP-GLES3.functional.texture.wrap.astc_5x",
        "4_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023452,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023453,
        "dEQP-GLES3.functional.texture.wrap.astc_5x",
        "4_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023454,
        "dEQP-GLES3.functional.texture.wrap.astc_5",
        "x4_srgb.mirror_mirror_linear_not_divisible");
