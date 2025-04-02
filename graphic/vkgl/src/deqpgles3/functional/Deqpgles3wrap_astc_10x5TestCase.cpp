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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023167,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023168,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_10x5.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023169,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023170,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023171,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023172,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023173,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023174,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023175,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x5.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023176,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023177,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x5.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023178,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023179,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023180,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023181,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x5.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023182,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023183,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x5.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023184,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x5.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023185,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023186,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x5.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023187,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023188,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023189,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023190,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023191,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023192,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023193,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023194,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023195,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023196,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023197,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023198,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023199,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023200,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023201,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x5.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023202,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x5.mirror_mirror_linear_not_divisible");
