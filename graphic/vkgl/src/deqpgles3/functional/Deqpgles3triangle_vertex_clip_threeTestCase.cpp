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
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043639,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_three.clip_neg_x_and_pos_x_and_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043640,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_three.clip_neg_x_and_pos_x_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043641,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043642,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043643,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043644,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043645,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043646,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043647,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043648,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043649,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043650,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043651,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043652,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043653,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043654,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043655,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043656,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043657,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_three.clip_neg_x_and_pos_y_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043658,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043659,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043660,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_neg_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043661,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043662,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043663,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043664,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_and_neg_y_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043665,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043666,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_and_pos_y_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043667,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_and_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043668,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_and_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043669,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043670,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_pos_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043671,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043672,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043673,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_pos_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043674,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043675,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_three.clip_pos_x_and_pos_y_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043676,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_x_and_pos_y_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043677,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_x_and_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043678,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_x_and_neg_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043679,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_x_and_neg_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043680,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_x_and_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043681,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_x_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043682,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_and_neg_y_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043683,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_x_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043684,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_and_pos_y_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043685,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_and_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043686,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_and_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043687,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043688,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_neg_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043689,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043690,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043691,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_neg_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043692,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043693,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043694,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043695,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043696,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043697,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043698,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043699,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043700,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043701,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043702,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043703,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043704,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043705,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043706,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043707,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043708,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043709,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_x_neg_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043710,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043711,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043712,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043713,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_y_and_neg_x_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043714,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043715,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_y_and_pos_x_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043716,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_y_and_pos_x_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043717,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_y_and_neg_x_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043718,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_neg_x_neg_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043719,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043720,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_pos_x_neg_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043721,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043722,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043723,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043724,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_y_and_neg_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043725,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_y_and_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043726,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_y_and_pos_x_pos_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043727,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043728,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_y_and_neg_x_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043729,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043730,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_y_and_pos_x_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043731,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_y_and_pos_x_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043732,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_y_and_neg_x_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043733,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043734,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043735,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043736,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_pos_x_pos_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043737,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043738,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_neg_x_pos_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043739,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043740,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043741,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043742,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043743,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043744,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043745,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043746,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043747,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043748,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043749,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043750,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043751,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043752,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043753,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043754,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043755,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043756,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043757,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043758,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043759,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043760,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_y_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043761,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_y_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043762,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_pos_x_pos_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043763,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043764,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043765,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043766,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043767,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043768,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043769,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043770,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043771,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043772,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043773,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043774,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043775,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043776,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043777,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043778,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043779,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043780,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043781,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_y_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043782,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_y_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043783,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043784,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_neg_x_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043785,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043786,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_neg_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043787,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043788,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043789,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_y_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043790,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_y_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043791,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043792,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043793,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_pos_x_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043794,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_pos_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043795,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043796,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043797,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_y_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043798,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_y_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043799,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043800,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043801,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043802,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043803,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043804,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043805,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043806,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043807,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043808,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043809,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043810,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043811,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043812,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043813,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043814,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_z_and_pos_x_neg_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043815,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043816,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043817,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043818,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043819,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043820,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043821,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043822,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043823,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043824,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043825,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043826,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043827,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043828,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043829,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043830,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043831,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043832,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_z_and_neg_x_neg_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043833,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043834,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043835,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043836,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043837,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_z_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043838,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_z_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043839,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043840,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043841,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043842,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043843,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_z_and_neg_x_neg_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043844,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_z_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043845,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_z_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043846,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043847,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043848,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043849,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043850,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_z_and_pos_x_neg_y_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043851,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043852,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043853,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043854,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043855,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043856,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043857,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043858,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043859,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_neg_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043860,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_neg_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043861,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_neg_z_and_pos_x_pos_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043862,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_neg_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043863,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_neg_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043864,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043865,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043866,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043867,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043868,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043869,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043870,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043871,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043872,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_neg_z_and_neg_x_neg_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043873,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_neg_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043874,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_neg_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043875,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_neg_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043876,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_neg_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043877,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_pos_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043878,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_pos_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043879,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043880,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043881,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_pos_z_and_neg_x_neg_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043882,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_pos_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043883,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_pos_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043884,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043885,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043886,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_pos_z_and_pos_x_pos_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043887,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_pos_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043888,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043889,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043890,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043891,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_pos_x_neg_y_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043892,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043893,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_neg_y_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043894,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_neg_y_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043895,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_neg_y_pos_z_and_neg_x_neg_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043896,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_neg_y_pos_z_and_pos_x_pos_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043897,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_pos_y_pos_z_and_neg_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043898,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_pos_y_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043899,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043900,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043901,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_pos_y_pos_z_and_neg_x_neg_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043902,
        "dEQP-GLES3.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z_and_pos_x_pos_y_neg_z");
