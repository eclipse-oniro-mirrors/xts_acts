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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022447,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022448,
        "dEQP-GLES3.functional.texture.w",
        "rap.rgba8.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022449,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022450,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022451,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022452,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022453,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022454,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022455,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022456,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022457,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022458,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022459,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022460,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022461,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022462,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022463,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022464,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022465,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022466,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022467,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022468,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022469,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022470,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022471,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022472,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022473,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022474,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022475,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022476,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022477,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022478,
        "dEQP-GLES3.functional.texture.wr",
        "ap.rgba8.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022479,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022480,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022481,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022482,
        "dEQP-GLES3.functional.texture.wra",
        "p.rgba8.mirror_mirror_linear_npot");
