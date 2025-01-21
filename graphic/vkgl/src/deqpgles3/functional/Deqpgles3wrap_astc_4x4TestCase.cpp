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
#include "../ActsDeqpgles30023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022879,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_4x4.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022880,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_4x4.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022881,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022882,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_4x4.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022883,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022884,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_4x4.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022885,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022886,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_4x4.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022887,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022888,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022889,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022890,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022891,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022892,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_4x4.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022893,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022894,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022895,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022896,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_4x4.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022897,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_4x4.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022898,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_4x4.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022899,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022900,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_4x4.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022901,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022902,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_4x4.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022903,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022904,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_4x4.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022905,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022906,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022907,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022908,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022909,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022910,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_4x4.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022911,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022912,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022913,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022914,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4.mirror_mirror_linear_not_divisible");
