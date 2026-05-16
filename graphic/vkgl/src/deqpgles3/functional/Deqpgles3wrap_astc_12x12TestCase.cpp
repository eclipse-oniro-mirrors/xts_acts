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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023347,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x12.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023348,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x12.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023349,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023350,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x12.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023351,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023352,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x12.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023353,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023354,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x12.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023355,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023356,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023357,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023358,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023359,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023360,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x12.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023361,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023362,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023363,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023364,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x12.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023365,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x12.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023366,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x12.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023367,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023368,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x12.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023369,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023370,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x12.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023371,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023372,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x12.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023373,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023374,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023375,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023376,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023377,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023378,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x12.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023379,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023380,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023381,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023382,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12.mirror_mirror_linear_not_divisible");
