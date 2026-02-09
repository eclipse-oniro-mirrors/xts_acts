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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022699,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_srgb8.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022700,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_srgb8.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022701,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022702,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_srgb8.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022703,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022704,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_srgb8.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022705,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022706,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_srgb8.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022707,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022708,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022709,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022710,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022711,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022712,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_srgb8.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022713,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022714,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022715,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022716,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022717,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022718,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_srgb8.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022719,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022720,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022721,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022722,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022723,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022724,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022725,
        "dEQP-GLES3.functional.texture.wrap.e",
        "tc2_srgb8.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022726,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022727,
        "dEQP-GLES3.functional.texture.wrap.e",
        "tc2_srgb8.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022728,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022729,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022730,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022731,
        "dEQP-GLES3.functional.texture.wrap.e",
        "tc2_srgb8.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022732,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022733,
        "dEQP-GLES3.functional.texture.wrap.e",
        "tc2_srgb8.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022734,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_srgb8.mirror_mirror_linear_npot");
