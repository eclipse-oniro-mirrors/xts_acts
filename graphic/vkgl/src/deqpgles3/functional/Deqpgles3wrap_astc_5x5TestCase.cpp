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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022951,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x5.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022952,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x5.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022953,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022954,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x5.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022955,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022956,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x5.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022957,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022958,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x5.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022959,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022960,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022961,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022962,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022963,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022964,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x5.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022965,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022966,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022967,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022968,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x5.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022969,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x5.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022970,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x5.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022971,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022972,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x5.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022973,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022974,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x5.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022975,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022976,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x5.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022977,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022978,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022979,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022980,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022981,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022982,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x5.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022983,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022984,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022985,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022986,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x5.mirror_mirror_linear_not_divisible");
