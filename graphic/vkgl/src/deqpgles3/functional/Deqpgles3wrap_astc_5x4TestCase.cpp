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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022915,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x4.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022916,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x4.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022917,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022918,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x4.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022919,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022920,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x4.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022921,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022922,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x4.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022923,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022924,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022925,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022926,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022927,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022928,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_5x4.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022929,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022930,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022931,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022932,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_5x4.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022933,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x4.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022934,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x4.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022935,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022936,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x4.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022937,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022938,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x4.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022939,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022940,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x4.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022941,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022942,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022943,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022944,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022945,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022946,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_5x4.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022947,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022948,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022949,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022950,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_5x4.mirror_mirror_linear_not_divisible");
