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
#include "../ActsDeqpgles20016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015811,
        "dEQP-GLES2.functional.clipping.triangl",
        "e_vertex.clip_two.clip_neg_x_and_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015812,
        "dEQP-GLES2.functional.clipping.triangl",
        "e_vertex.clip_two.clip_neg_x_and_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015813,
        "dEQP-GLES2.functional.clipping.triangl",
        "e_vertex.clip_two.clip_neg_x_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015814,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015815,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015816,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015817,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015818,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015819,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015820,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015821,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015822,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015823,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015824,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015825,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015826,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015827,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015828,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015829,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015830,
        "dEQP-GLES2.functional.clipping.triangl",
        "e_vertex.clip_two.clip_pos_x_and_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015831,
        "dEQP-GLES2.functional.clipping.triangl",
        "e_vertex.clip_two.clip_pos_x_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015832,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015833,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015834,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015835,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015836,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015837,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015838,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015839,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015840,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015841,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015842,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015843,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015844,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015845,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015846,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015847,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015848,
        "dEQP-GLES2.functional.clipping.triangl",
        "e_vertex.clip_two.clip_pos_y_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015849,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015850,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015851,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015852,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015853,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015854,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015855,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015856,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015857,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015858,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015859,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015860,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015861,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015862,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015863,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015864,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015865,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015866,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015867,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015868,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015869,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015870,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015871,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015872,
        "dEQP-GLES2.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015873,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015874,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015875,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015876,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015877,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015878,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015879,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015880,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015881,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015882,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015883,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015884,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015885,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015886,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015887,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015888,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015889,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015890,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015891,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015892,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015893,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015894,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015895,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015896,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015897,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015898,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015899,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015900,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015901,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015902,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015903,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015904,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015905,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015906,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015907,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015908,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015909,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015910,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015911,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015912,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015913,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015914,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015915,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015916,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015917,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015918,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015919,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015920,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015921,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015922,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015923,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015924,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015925,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015926,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015927,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015928,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015929,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015930,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015931,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015932,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015933,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015934,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015935,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015936,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015937,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015938,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015939,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015940,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015941,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015942,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015943,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015944,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015945,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015946,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015947,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015948,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015949,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015950,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015951,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015952,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015953,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015954,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015955,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015956,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015957,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015958,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015959,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015960,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015961,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015962,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015963,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015964,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015965,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015966,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015967,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015968,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015969,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015970,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015971,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015972,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015973,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015974,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015975,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015976,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015977,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015978,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015979,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015980,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015981,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015982,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015983,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015984,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015985,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015986,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015987,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015988,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015989,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015990,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015991,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015992,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015993,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015994,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015995,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015996,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015997,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015998,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015999,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016000,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016001,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016002,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016003,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016004,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016005,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016006,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016007,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016008,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016009,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016010,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016011,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016012,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016013,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016014,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016015,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016016,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016017,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016018,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016019,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016020,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016021,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016022,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016023,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016024,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_neg_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016025,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_neg_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016026,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016027,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016028,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_pos_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016029,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016030,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016031,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_pos_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016032,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016033,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016034,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_pos_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016035,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016036,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016037,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_neg_y_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_016038,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_pos_y_neg_z_and_neg_x_pos_y_neg_z");
