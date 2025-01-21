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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023239,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023240,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_10x8.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023241,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023242,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023243,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023244,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023245,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023246,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023247,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x8.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023248,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023249,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x8.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023250,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023251,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023252,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023253,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x8.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023254,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023255,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x8.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023256,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x8.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023257,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023258,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x8.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023259,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023260,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023261,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023262,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023263,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023264,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023265,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023266,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023267,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023268,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023269,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023270,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023271,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023272,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023273,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x8.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023274,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x8.mirror_mirror_linear_not_divisible");
