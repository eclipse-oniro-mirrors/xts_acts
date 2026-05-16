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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023131,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x8.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023132,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x8.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023133,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023134,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x8.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023135,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023136,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x8.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023137,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023138,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x8.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023139,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023140,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023141,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023142,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023143,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023144,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x8.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023145,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023146,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023147,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023148,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x8.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023149,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x8.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023150,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x8.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023151,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023152,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x8.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023153,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023154,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x8.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023155,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023156,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x8.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023157,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023158,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023159,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023160,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023161,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023162,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x8.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023163,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023164,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023165,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023166,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x8.mirror_mirror_linear_not_divisible");
