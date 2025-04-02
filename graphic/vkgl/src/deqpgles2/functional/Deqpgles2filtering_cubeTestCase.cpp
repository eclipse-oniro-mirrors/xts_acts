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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010491,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_nearest_clamp_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010492,
        "dEQP-GLES2.functional.texture.filtering.",
        "cube.nearest_nearest_clamp_rgba8888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010493,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.nearest_nearest_clamp_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010494,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_nearest_clamp_rgb888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010495,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_nearest_clamp_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010496,
        "dEQP-GLES2.functional.texture.filtering.",
        "cube.nearest_nearest_clamp_rgba4444_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010497,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.nearest_nearest_clamp_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010498,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.cube.nearest_nearest_clamp_l8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010499,
        "dEQP-GLES2.functional.texture.filtering.",
        "cube.nearest_nearest_repeat_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010500,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_nearest_repeat_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010501,
        "dEQP-GLES2.functional.texture.filtering.",
        "cube.nearest_nearest_repeat_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010502,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.cube.nearest_nearest_repeat_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010503,
        "dEQP-GLES2.functional.texture.filtering.",
        "cube.nearest_nearest_mirror_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010504,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_nearest_mirror_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010505,
        "dEQP-GLES2.functional.texture.filtering.",
        "cube.nearest_nearest_mirror_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010506,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.cube.nearest_nearest_mirror_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010507,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_linear_clamp_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010508,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_linear_clamp_rgba8888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010509,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.nearest_linear_clamp_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010510,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.nearest_linear_clamp_rgb888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010511,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_linear_clamp_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010512,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_linear_clamp_rgba4444_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010513,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.nearest_linear_clamp_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010514,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.nearest_linear_clamp_l8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010515,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_linear_repeat_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010516,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.nearest_linear_repeat_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010517,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_linear_repeat_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010518,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.nearest_linear_repeat_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010519,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_linear_mirror_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010520,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.nearest_linear_mirror_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010521,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.nearest_linear_mirror_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010522,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.nearest_linear_mirror_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010523,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_nearest_clamp_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010524,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_nearest_clamp_rgba8888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010525,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.linear_nearest_clamp_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010526,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.linear_nearest_clamp_rgb888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010527,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_nearest_clamp_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010528,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_nearest_clamp_rgba4444_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010529,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.linear_nearest_clamp_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010530,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.linear_nearest_clamp_l8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010531,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_nearest_repeat_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010532,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.linear_nearest_repeat_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010533,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_nearest_repeat_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010534,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.linear_nearest_repeat_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010535,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_nearest_mirror_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010536,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.linear_nearest_mirror_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010537,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_nearest_mirror_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010538,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.linear_nearest_mirror_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010539,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.linear_linear_clamp_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010540,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_linear_clamp_rgba8888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010541,
        "dEQP-GLES2.functional.texture.filteri",
        "ng.cube.linear_linear_clamp_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010542,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.linear_linear_clamp_rgb888_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010543,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.linear_linear_clamp_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010544,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_linear_clamp_rgba4444_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010545,
        "dEQP-GLES2.functional.texture.filte",
        "ring.cube.linear_linear_clamp_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010546,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.linear_linear_clamp_l8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010547,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_linear_repeat_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010548,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.linear_linear_repeat_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010549,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_linear_repeat_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010550,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.linear_linear_repeat_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010551,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_linear_mirror_rgba8888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010552,
        "dEQP-GLES2.functional.texture.filterin",
        "g.cube.linear_linear_mirror_rgb888_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010553,
        "dEQP-GLES2.functional.texture.filtering",
        ".cube.linear_linear_mirror_rgba4444_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010554,
        "dEQP-GLES2.functional.texture.filter",
        "ing.cube.linear_linear_mirror_l8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010555,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "nearest_mipmap_nearest_nearest_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010556,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "nearest_mipmap_nearest_nearest_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010557,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".nearest_mipmap_nearest_nearest_repeat_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010558,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "nearest_mipmap_nearest_nearest_repeat_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010559,
        "dEQP-GLES2.functional.texture.filtering.cu",
        "be.nearest_mipmap_nearest_nearest_repeat_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010560,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "nearest_mipmap_nearest_nearest_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010561,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".nearest_mipmap_nearest_linear_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010562,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "nearest_mipmap_nearest_linear_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010563,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "nearest_mipmap_nearest_linear_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010564,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".linear_mipmap_nearest_nearest_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010565,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "linear_mipmap_nearest_nearest_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010566,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".linear_mipmap_nearest_nearest_repeat_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010567,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "linear_mipmap_nearest_nearest_repeat_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010568,
        "dEQP-GLES2.functional.texture.filtering.cu",
        "be.linear_mipmap_nearest_nearest_repeat_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010569,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "linear_mipmap_nearest_nearest_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010570,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".linear_mipmap_nearest_linear_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010571,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".linear_mipmap_nearest_linear_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010572,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".linear_mipmap_nearest_linear_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010573,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".nearest_mipmap_linear_nearest_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010574,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "nearest_mipmap_linear_nearest_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010575,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".nearest_mipmap_linear_nearest_repeat_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010576,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "nearest_mipmap_linear_nearest_repeat_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010577,
        "dEQP-GLES2.functional.texture.filtering.cu",
        "be.nearest_mipmap_linear_nearest_repeat_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010578,
        "dEQP-GLES2.functional.texture.filtering.cube.",
        "nearest_mipmap_linear_nearest_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010579,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".nearest_mipmap_linear_linear_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010580,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".nearest_mipmap_linear_linear_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010581,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".nearest_mipmap_linear_linear_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010582,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".linear_mipmap_linear_nearest_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010583,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".linear_mipmap_linear_nearest_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010584,
        "dEQP-GLES2.functional.texture.filtering.cub",
        "e.linear_mipmap_linear_nearest_repeat_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010585,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".linear_mipmap_linear_nearest_repeat_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010586,
        "dEQP-GLES2.functional.texture.filtering.c",
        "ube.linear_mipmap_linear_nearest_repeat_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010587,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".linear_mipmap_linear_nearest_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010588,
        "dEQP-GLES2.functional.texture.filtering.cub",
        "e.linear_mipmap_linear_linear_clamp_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010589,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".linear_mipmap_linear_linear_repeat_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010590,
        "dEQP-GLES2.functional.texture.filtering.cube",
        ".linear_mipmap_linear_linear_mirror_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010591,
        "dEQP-GLES2.functional.texture.filte",
        "ring.cube.nearest_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010592,
        "dEQP-GLES2.functional.texture.filte",
        "ring.cube.nearest_linear_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010593,
        "dEQP-GLES2.functional.texture.filte",
        "ring.cube.linear_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010594,
        "dEQP-GLES2.functional.texture.filt",
        "ering.cube.linear_linear_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010595,
        "dEQP-GLES2.functional.texture.filtering.cub",
        "e.nearest_mipmap_nearest_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010596,
        "dEQP-GLES2.functional.texture.filtering.cu",
        "be.nearest_mipmap_nearest_linear_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010597,
        "dEQP-GLES2.functional.texture.filtering.cu",
        "be.linear_mipmap_nearest_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010598,
        "dEQP-GLES2.functional.texture.filtering.cu",
        "be.linear_mipmap_nearest_linear_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010599,
        "dEQP-GLES2.functional.texture.filtering.cu",
        "be.nearest_mipmap_linear_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010600,
        "dEQP-GLES2.functional.texture.filtering.cu",
        "be.nearest_mipmap_linear_linear_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010601,
        "dEQP-GLES2.functional.texture.filtering.cu",
        "be.linear_mipmap_linear_nearest_clamp_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010602,
        "dEQP-GLES2.functional.texture.filtering.c",
        "ube.linear_mipmap_linear_linear_clamp_etc1");
