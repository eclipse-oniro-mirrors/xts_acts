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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007798,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_separate_grid_100x100_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007799,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_separate_grid_200x200_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007800,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_separate_grid_500x500_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007801,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_separate_grid_1000x1000_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007802,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_separate_grid_1200x1200_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007803,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_separate_grid_1500x1500_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007804,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_separate_grid_100x100_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007805,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_separate_grid_200x200_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007806,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_separate_grid_500x500_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007807,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_separate_grid_1000x1000_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007808,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_separate_grid_1200x1200_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007809,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_separate_grid_1500x1500_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007810,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_separate_grid_100x100_drawcount_200");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007811,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_separate_grid_200x200_drawcount_800");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007812,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawarrays_separate_grid_500x500_drawcount_2500");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007813,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.l",
        "arge.drawarrays_separate_grid_1000x1000_drawcount_5000");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007814,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_combined_grid_100x100_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007815,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_combined_grid_200x200_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007816,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_combined_grid_500x500_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007817,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_combined_grid_1000x1000_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007818,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_combined_grid_1200x1200_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007819,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_combined_grid_1500x1500_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007820,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_combined_grid_100x100_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007821,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_combined_grid_200x200_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007822,
        "dEQP-GLES31.functional.draw_indirect.compute_intero",
        "p.large.drawarrays_combined_grid_500x500_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007823,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_combined_grid_1000x1000_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007824,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_combined_grid_1200x1200_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007825,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_combined_grid_1500x1500_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007826,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_combined_grid_100x100_drawcount_200");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007827,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawarrays_combined_grid_200x200_drawcount_800");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007828,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawarrays_combined_grid_500x500_drawcount_2500");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007829,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.l",
        "arge.drawarrays_combined_grid_1000x1000_drawcount_5000");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007830,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_separate_grid_100x100_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007831,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_separate_grid_200x200_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007832,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_separate_grid_500x500_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007833,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_separate_grid_1000x1000_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007834,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_separate_grid_1200x1200_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007835,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_separate_grid_1500x1500_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007836,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_separate_grid_100x100_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007837,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_separate_grid_200x200_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007838,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_separate_grid_500x500_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007839,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_separate_grid_1000x1000_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007840,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_separate_grid_1200x1200_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007841,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_separate_grid_1500x1500_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007842,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_separate_grid_100x100_drawcount_200");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007843,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_separate_grid_200x200_drawcount_800");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007844,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.l",
        "arge.drawelements_separate_grid_500x500_drawcount_2500");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007845,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.la",
        "rge.drawelements_separate_grid_1000x1000_drawcount_5000");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007846,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_combined_grid_100x100_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007847,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_combined_grid_200x200_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007848,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_combined_grid_500x500_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007849,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_combined_grid_1000x1000_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007850,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_combined_grid_1200x1200_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007851,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_combined_grid_1500x1500_drawcount_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007852,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_combined_grid_100x100_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007853,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_combined_grid_200x200_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007854,
        "dEQP-GLES31.functional.draw_indirect.compute_interop",
        ".large.drawelements_combined_grid_500x500_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007855,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_combined_grid_1000x1000_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007856,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_combined_grid_1200x1200_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007857,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_combined_grid_1500x1500_drawcount_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007858,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_combined_grid_100x100_drawcount_200");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007859,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "large.drawelements_combined_grid_200x200_drawcount_800");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007860,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.l",
        "arge.drawelements_combined_grid_500x500_drawcount_2500");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007861,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.la",
        "rge.drawelements_combined_grid_1000x1000_drawcount_5000");
