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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010355,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_nearest_clamp_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010356,
        "dEQP-GLES2.functional.texture.filtering",
        ".2d.nearest_nearest_clamp_rgba8888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010357,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.nearest_nearest_clamp_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010358,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_nearest_clamp_rgb888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010359,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_nearest_clamp_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010360,
        "dEQP-GLES2.functional.texture.filtering",
        ".2d.nearest_nearest_clamp_rgba4444_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010361,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.nearest_nearest_clamp_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010362,
        "dEQP-GLES2.functional.texture.filter",
        "ing.2d.nearest_nearest_clamp_l8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010363,
        "dEQP-GLES2.functional.texture.filtering",
        ".2d.nearest_nearest_repeat_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010364,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_nearest_repeat_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010365,
        "dEQP-GLES2.functional.texture.filtering",
        ".2d.nearest_nearest_repeat_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010366,
        "dEQP-GLES2.functional.texture.filter",
        "ing.2d.nearest_nearest_repeat_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010367,
        "dEQP-GLES2.functional.texture.filtering",
        ".2d.nearest_nearest_mirror_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010368,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_nearest_mirror_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010369,
        "dEQP-GLES2.functional.texture.filtering",
        ".2d.nearest_nearest_mirror_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010370,
        "dEQP-GLES2.functional.texture.filter",
        "ing.2d.nearest_nearest_mirror_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010371,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_linear_clamp_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010372,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_linear_clamp_rgba8888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010373,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.nearest_linear_clamp_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010374,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.nearest_linear_clamp_rgb888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010375,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_linear_clamp_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010376,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_linear_clamp_rgba4444_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010377,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.nearest_linear_clamp_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010378,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.nearest_linear_clamp_l8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010379,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_linear_repeat_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010380,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.nearest_linear_repeat_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010381,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_linear_repeat_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010382,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.nearest_linear_repeat_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010383,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_linear_mirror_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010384,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.nearest_linear_mirror_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010385,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.nearest_linear_mirror_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010386,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.nearest_linear_mirror_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010387,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_nearest_clamp_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010388,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_nearest_clamp_rgba8888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010389,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.linear_nearest_clamp_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010390,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.linear_nearest_clamp_rgb888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010391,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_nearest_clamp_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010392,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_nearest_clamp_rgba4444_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010393,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.linear_nearest_clamp_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010394,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.linear_nearest_clamp_l8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010395,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_nearest_repeat_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010396,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.linear_nearest_repeat_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010397,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_nearest_repeat_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010398,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.linear_nearest_repeat_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010399,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_nearest_mirror_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010400,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.linear_nearest_mirror_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010401,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_nearest_mirror_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010402,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.linear_nearest_mirror_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010403,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.linear_linear_clamp_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010404,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_linear_clamp_rgba8888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010405,
        "dEQP-GLES2.functional.texture.filter",
        "ing.2d.linear_linear_clamp_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010406,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.linear_linear_clamp_rgb888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010407,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.linear_linear_clamp_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010408,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_linear_clamp_rgba4444_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010409,
        "dEQP-GLES2.functional.texture.filt",
        "ering.2d.linear_linear_clamp_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010410,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.linear_linear_clamp_l8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010411,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_linear_repeat_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010412,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.linear_linear_repeat_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010413,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_linear_repeat_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010414,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.linear_linear_repeat_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010415,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_linear_mirror_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010416,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.2d.linear_linear_mirror_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010417,
        "dEQP-GLES2.functional.texture.filterin",
        "g.2d.linear_linear_mirror_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010418,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.linear_linear_mirror_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010419,
        "dEQP-GLES2.functional.texture.filtering.2d.n",
        "earest_mipmap_nearest_nearest_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010420,
        "dEQP-GLES2.functional.texture.filtering.2d.n",
        "earest_mipmap_nearest_nearest_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010421,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "nearest_mipmap_nearest_nearest_repeat_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010422,
        "dEQP-GLES2.functional.texture.filtering.2d.n",
        "earest_mipmap_nearest_nearest_repeat_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010423,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.nearest_mipmap_nearest_nearest_repeat_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010424,
        "dEQP-GLES2.functional.texture.filtering.2d.n",
        "earest_mipmap_nearest_nearest_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010425,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "nearest_mipmap_nearest_linear_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010426,
        "dEQP-GLES2.functional.texture.filtering.2d.n",
        "earest_mipmap_nearest_linear_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010427,
        "dEQP-GLES2.functional.texture.filtering.2d.n",
        "earest_mipmap_nearest_linear_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010428,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "linear_mipmap_nearest_nearest_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010429,
        "dEQP-GLES2.functional.texture.filtering.2d.l",
        "inear_mipmap_nearest_nearest_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010430,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "linear_mipmap_nearest_nearest_repeat_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010431,
        "dEQP-GLES2.functional.texture.filtering.2d.l",
        "inear_mipmap_nearest_nearest_repeat_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010432,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.linear_mipmap_nearest_nearest_repeat_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010433,
        "dEQP-GLES2.functional.texture.filtering.2d.l",
        "inear_mipmap_nearest_nearest_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010434,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "linear_mipmap_nearest_linear_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010435,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "linear_mipmap_nearest_linear_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010436,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "linear_mipmap_nearest_linear_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010437,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "nearest_mipmap_linear_nearest_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010438,
        "dEQP-GLES2.functional.texture.filtering.2d.n",
        "earest_mipmap_linear_nearest_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010439,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "nearest_mipmap_linear_nearest_repeat_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010440,
        "dEQP-GLES2.functional.texture.filtering.2d.n",
        "earest_mipmap_linear_nearest_repeat_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010441,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.nearest_mipmap_linear_nearest_repeat_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010442,
        "dEQP-GLES2.functional.texture.filtering.2d.n",
        "earest_mipmap_linear_nearest_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010443,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "nearest_mipmap_linear_linear_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010444,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "nearest_mipmap_linear_linear_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010445,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "nearest_mipmap_linear_linear_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010446,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "linear_mipmap_linear_nearest_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010447,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "linear_mipmap_linear_nearest_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010448,
        "dEQP-GLES2.functional.texture.filtering.2d",
        ".linear_mipmap_linear_nearest_repeat_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010449,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "linear_mipmap_linear_nearest_repeat_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010450,
        "dEQP-GLES2.functional.texture.filtering.",
        "2d.linear_mipmap_linear_nearest_repeat_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010451,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "linear_mipmap_linear_nearest_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010452,
        "dEQP-GLES2.functional.texture.filtering.2d",
        ".linear_mipmap_linear_linear_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010453,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "linear_mipmap_linear_linear_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010454,
        "dEQP-GLES2.functional.texture.filtering.2d.",
        "linear_mipmap_linear_linear_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010455,
        "dEQP-GLES2.functional.texture.filt",
        "ering.2d.nearest_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010456,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.nearest_nearest_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010457,
        "dEQP-GLES2.functional.texture.filte",
        "ring.2d.nearest_nearest_mirror_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010458,
        "dEQP-GLES2.functional.texture.filt",
        "ering.2d.nearest_linear_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010459,
        "dEQP-GLES2.functional.texture.filt",
        "ering.2d.nearest_linear_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010460,
        "dEQP-GLES2.functional.texture.filt",
        "ering.2d.nearest_linear_mirror_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010461,
        "dEQP-GLES2.functional.texture.filt",
        "ering.2d.linear_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010462,
        "dEQP-GLES2.functional.texture.filt",
        "ering.2d.linear_nearest_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010463,
        "dEQP-GLES2.functional.texture.filt",
        "ering.2d.linear_nearest_mirror_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010464,
        "dEQP-GLES2.functional.texture.fil",
        "tering.2d.linear_linear_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010465,
        "dEQP-GLES2.functional.texture.filt",
        "ering.2d.linear_linear_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010466,
        "dEQP-GLES2.functional.texture.filt",
        "ering.2d.linear_linear_mirror_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010467,
        "dEQP-GLES2.functional.texture.filtering.2d",
        ".nearest_mipmap_nearest_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010468,
        "dEQP-GLES2.functional.texture.filtering.2d",
        ".nearest_mipmap_nearest_nearest_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010469,
        "dEQP-GLES2.functional.texture.filtering.2d",
        ".nearest_mipmap_nearest_nearest_mirror_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010470,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.nearest_mipmap_nearest_linear_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010471,
        "dEQP-GLES2.functional.texture.filtering.2d",
        ".nearest_mipmap_nearest_linear_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010472,
        "dEQP-GLES2.functional.texture.filtering.2d",
        ".nearest_mipmap_nearest_linear_mirror_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010473,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.linear_mipmap_nearest_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010474,
        "dEQP-GLES2.functional.texture.filtering.2d",
        ".linear_mipmap_nearest_nearest_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010475,
        "dEQP-GLES2.functional.texture.filtering.2d",
        ".linear_mipmap_nearest_nearest_mirror_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010476,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.linear_mipmap_nearest_linear_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010477,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.linear_mipmap_nearest_linear_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010478,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.linear_mipmap_nearest_linear_mirror_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010479,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.nearest_mipmap_linear_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010480,
        "dEQP-GLES2.functional.texture.filtering.2d",
        ".nearest_mipmap_linear_nearest_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010481,
        "dEQP-GLES2.functional.texture.filtering.2d",
        ".nearest_mipmap_linear_nearest_mirror_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010482,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.nearest_mipmap_linear_linear_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010483,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.nearest_mipmap_linear_linear_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010484,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.nearest_mipmap_linear_linear_mirror_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010485,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.linear_mipmap_linear_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010486,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.linear_mipmap_linear_nearest_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010487,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.linear_mipmap_linear_nearest_mirror_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010488,
        "dEQP-GLES2.functional.texture.filtering.",
        "2d.linear_mipmap_linear_linear_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010489,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.linear_mipmap_linear_linear_repeat_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010490,
        "dEQP-GLES2.functional.texture.filtering.2",
        "d.linear_mipmap_linear_linear_mirror_etc1");
