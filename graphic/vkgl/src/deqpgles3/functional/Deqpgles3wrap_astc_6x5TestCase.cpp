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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022987,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x5.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022988,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x5.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022989,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022990,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x5.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022991,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022992,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x5.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022993,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022994,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x5.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022995,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022996,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022997,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022998,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022999,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023000,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x5.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023001,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023002,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023003,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023004,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x5.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023005,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x5.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023006,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x5.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023007,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023008,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x5.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023009,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023010,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x5.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023011,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023012,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x5.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023013,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023014,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023015,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023016,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023017,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023018,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x5.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023019,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023020,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023021,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_023022,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x5.mirror_mirror_linear_not_divisible");
