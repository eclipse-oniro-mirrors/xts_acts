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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023095,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x6.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023096,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x6.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023097,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023098,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x6.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023099,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023100,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x6.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023101,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023102,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x6.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023103,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023104,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023105,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023106,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023107,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023108,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x6.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023109,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023110,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023111,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023112,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x6.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023113,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x6.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023114,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x6.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023115,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023116,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x6.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023117,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023118,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x6.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023119,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023120,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x6.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023121,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023122,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023123,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023124,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023125,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023126,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x6.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023127,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023128,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023129,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023130,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x6.mirror_mirror_linear_not_divisible");