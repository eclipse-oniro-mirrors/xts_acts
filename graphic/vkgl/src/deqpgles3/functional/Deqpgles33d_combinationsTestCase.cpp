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
#include "../ActsDeqpgles30025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024639,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.nearest_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024640,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024641,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024642,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024643,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024644,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024645,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024646,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024647,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024648,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024649,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024650,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024651,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024652,
        "dEQP-GLES3.functional.texture.filtering.3d.com",
        "binations.nearest_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024653,
        "dEQP-GLES3.functional.texture.filtering.3d.com",
        "binations.nearest_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024654,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024655,
        "dEQP-GLES3.functional.texture.filtering.3d.com",
        "binations.nearest_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024656,
        "dEQP-GLES3.functional.texture.filtering.3d.com",
        "binations.nearest_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024657,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024658,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024659,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024660,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024661,
        "dEQP-GLES3.functional.texture.filtering.3d.com",
        "binations.nearest_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024662,
        "dEQP-GLES3.functional.texture.filtering.3d.com",
        "binations.nearest_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024663,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024664,
        "dEQP-GLES3.functional.texture.filtering.3d.com",
        "binations.nearest_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024665,
        "dEQP-GLES3.functional.texture.filtering.3d.com",
        "binations.nearest_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024666,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.nearest_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024667,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.nearest_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024668,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.nearest_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024669,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.nearest_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024670,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024671,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024672,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.nearest_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024673,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024674,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024675,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.nearest_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024676,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024677,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024678,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024679,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024680,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024681,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024682,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024683,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024684,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.nearest_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024685,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024686,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024687,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024688,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024689,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024690,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024691,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024692,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.nearest_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024693,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024694,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024695,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024696,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024697,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024698,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024699,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024700,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024701,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024702,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024703,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024704,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024705,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024706,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024707,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024708,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024709,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024710,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024711,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024712,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024713,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024714,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024715,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024716,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024717,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024718,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024719,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024720,
        "dEQP-GLES3.functional.texture.filtering.3d.",
        "combinations.linear_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024721,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024722,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024723,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024724,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024725,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024726,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024727,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024728,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024729,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024730,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024731,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024732,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024733,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024734,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024735,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024736,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024737,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024738,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024739,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024740,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024741,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024742,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024743,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024744,
        "dEQP-GLES3.functional.texture.filtering.3d.c",
        "ombinations.linear_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024745,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024746,
        "dEQP-GLES3.functional.texture.filtering.3d.co",
        "mbinations.linear_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024747,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024748,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024749,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024750,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024751,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024752,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024753,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024754,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024755,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024756,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024757,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024758,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024759,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024760,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024761,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024762,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024763,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024764,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024765,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024766,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024767,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024768,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024769,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024770,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024771,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024772,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024773,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024774,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.nearest_mipmap_nearest_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024775,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024776,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024777,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024778,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024779,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024780,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024781,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024782,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024783,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024784,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024785,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024786,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024787,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024788,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024789,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024790,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024791,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024792,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024793,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024794,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024795,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024796,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024797,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024798,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_nearest_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024799,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024800,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_nearest_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024801,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_nearest_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024802,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024803,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024804,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024805,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024806,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024807,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024808,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024809,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024810,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_repeat_clamp_clamp");
