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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012381,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012382,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012383,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012384,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012385,
        "dEQP-GLES31.functional.texture.filtering.cube_a",
        "rray.combinations.nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012386,
        "dEQP-GLES31.functional.texture.filtering.cube_a",
        "rray.combinations.nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012387,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012388,
        "dEQP-GLES31.functional.texture.filtering.cube_a",
        "rray.combinations.nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012389,
        "dEQP-GLES31.functional.texture.filtering.cube_a",
        "rray.combinations.nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012390,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.combinations.nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012391,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012392,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012393,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012394,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012395,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012396,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012397,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012398,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012399,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.combinations.linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012400,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012401,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012402,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012403,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012404,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012405,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012406,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012407,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012408,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.combinations.linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012409,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.combinations.linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012410,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.combinations.linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012411,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.combinations.linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012412,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012413,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012414,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.combinations.linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012415,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012416,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.combinations.linear_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012417,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012418,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012419,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012420,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012421,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012422,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012423,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012424,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012425,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012426,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012427,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012428,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012429,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012430,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012431,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012432,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012433,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012434,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012435,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012436,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012437,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012438,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012439,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.linear_mipmap_nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012440,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.linear_mipmap_nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012441,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012442,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.linear_mipmap_nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012443,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.linear_mipmap_nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012444,
        "dEQP-GLES31.functional.texture.filtering.cube_array.",
        "combinations.linear_mipmap_nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012445,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012446,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012447,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012448,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012449,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012450,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012451,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012452,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012453,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012454,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012455,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012456,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012457,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012458,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012459,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012460,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012461,
        "dEQP-GLES31.functional.texture.filtering.cube_array.co",
        "mbinations.nearest_mipmap_linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012462,
        "dEQP-GLES31.functional.texture.filtering.cube_array.",
        "combinations.nearest_mipmap_linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012463,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012464,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012465,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012466,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012467,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012468,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012469,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012470,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.nearest_mipmap_linear_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012471,
        "dEQP-GLES31.functional.texture.filtering.cube_array.",
        "combinations.linear_mipmap_linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012472,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012473,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012474,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012475,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012476,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012477,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012478,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012479,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012480,
        "dEQP-GLES31.functional.texture.filtering.cube_array.",
        "combinations.linear_mipmap_linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012481,
        "dEQP-GLES31.functional.texture.filtering.cube_array.",
        "combinations.linear_mipmap_linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012482,
        "dEQP-GLES31.functional.texture.filtering.cube_array.",
        "combinations.linear_mipmap_linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012483,
        "dEQP-GLES31.functional.texture.filtering.cube_array.",
        "combinations.linear_mipmap_linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012484,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012485,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012486,
        "dEQP-GLES31.functional.texture.filtering.cube_array.",
        "combinations.linear_mipmap_linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012487,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012488,
        "dEQP-GLES31.functional.texture.filtering.cube_array.c",
        "ombinations.linear_mipmap_linear_linear_mirror_mirror");
