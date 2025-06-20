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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022663,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022664,
        "dEQP-GLES3.functional.texture.wra",
        "p.etc2_rgb8.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022665,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022666,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022667,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022668,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022669,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022670,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022671,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022672,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022673,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022674,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022675,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022676,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022677,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022678,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022679,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022680,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022681,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022682,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022683,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022684,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022685,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022686,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022687,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022688,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022689,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022690,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022691,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022692,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022693,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022694,
        "dEQP-GLES3.functional.texture.wrap",
        ".etc2_rgb8.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022695,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022696,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022697,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022698,
        "dEQP-GLES3.functional.texture.wrap.",
        "etc2_rgb8.mirror_mirror_linear_npot");
