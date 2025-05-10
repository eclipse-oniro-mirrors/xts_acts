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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023059,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x5.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023060,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x5.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023061,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023062,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x5.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023063,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023064,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x5.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023065,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023066,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x5.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023067,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023068,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023069,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023070,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023071,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023072,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_8x5.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023073,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023074,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023075,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023076,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_8x5.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023077,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x5.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023078,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x5.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023079,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023080,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x5.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023081,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023082,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x5.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023083,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023084,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x5.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023085,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023086,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023087,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023088,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023089,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023090,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_8x5.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023091,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023092,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023093,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023094,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_8x5.mirror_mirror_linear_not_divisible");
