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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023203,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023204,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_10x6.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023205,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023206,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023207,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023208,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023209,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023210,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023211,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x6.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023212,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023213,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x6.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023214,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023215,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023216,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023217,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x6.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023218,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023219,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x6.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023220,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x6.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023221,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023222,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x6.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023223,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023224,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023225,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023226,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023227,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023228,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023229,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023230,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023231,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023232,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023233,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023234,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023235,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023236,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023237,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x6.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023238,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x6.mirror_mirror_linear_not_divisible");
