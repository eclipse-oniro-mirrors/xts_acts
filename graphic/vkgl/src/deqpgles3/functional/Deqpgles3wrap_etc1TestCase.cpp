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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022483,
        "dEQP-GLES3.functional.texture.w",
        "rap.etc1.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022484,
        "dEQP-GLES3.functional.texture.w",
        "rap.etc1.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022485,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022486,
        "dEQP-GLES3.functional.texture.w",
        "rap.etc1.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022487,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022488,
        "dEQP-GLES3.functional.texture.w",
        "rap.etc1.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022489,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022490,
        "dEQP-GLES3.functional.texture.w",
        "rap.etc1.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022491,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022492,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022493,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022494,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022495,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022496,
        "dEQP-GLES3.functional.texture.w",
        "rap.etc1.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022497,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022498,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022499,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022500,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022501,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022502,
        "dEQP-GLES3.functional.texture.w",
        "rap.etc1.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022503,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022504,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022505,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022506,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022507,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022508,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022509,
        "dEQP-GLES3.functional.texture.wra",
        "p.etc1.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022510,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022511,
        "dEQP-GLES3.functional.texture.wra",
        "p.etc1.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022512,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022513,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022514,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022515,
        "dEQP-GLES3.functional.texture.wra",
        "p.etc1.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022516,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022517,
        "dEQP-GLES3.functional.texture.wra",
        "p.etc1.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022518,
        "dEQP-GLES3.functional.texture.wr",
        "ap.etc1.mirror_mirror_linear_npot");
