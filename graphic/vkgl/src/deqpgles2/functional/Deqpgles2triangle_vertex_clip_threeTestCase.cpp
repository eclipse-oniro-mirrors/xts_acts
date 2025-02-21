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
#include "../ActsDeqpgles20017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016039,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_three.clip_neg_x_and_pos_x_and_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016040,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_three.clip_neg_x_and_pos_x_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016041,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016042,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016043,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016044,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016045,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016046,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016047,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016048,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_x_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016049,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016050,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016051,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016052,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016053,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016054,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016055,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016056,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016057,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_three.clip_neg_x_and_pos_y_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016058,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_pos_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016059,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_neg_x_and_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016060,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_neg_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016061,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016062,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016063,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016064,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_and_neg_y_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016065,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_x_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016066,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_and_pos_y_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016067,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_and_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016068,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_and_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016069,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016070,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_pos_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016071,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016072,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016073,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_pos_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016074,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016075,
        "dEQP-GLES2.functional.clipping.triangle_vert",
        "ex.clip_three.clip_pos_x_and_pos_y_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016076,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_x_and_pos_y_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016077,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_x_and_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016078,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_x_and_neg_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016079,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_x_and_neg_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016080,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_x_and_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016081,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_x_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016082,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_and_neg_y_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016083,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_x_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016084,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_and_pos_y_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016085,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_and_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016086,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_and_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016087,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016088,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_neg_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016089,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016090,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016091,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_neg_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016092,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016093,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016094,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016095,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016096,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016097,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016098,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016099,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016100,
        "dEQP-GLES2.functional.clipping.triangle_vertex.",
        "clip_three.clip_pos_y_and_neg_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016101,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016102,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016103,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016104,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016105,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016106,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016107,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016108,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016109,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_x_neg_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016110,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016111,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016112,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016113,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_y_and_neg_x_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016114,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_pos_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016115,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_y_and_pos_x_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016116,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_y_and_pos_x_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016117,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_y_and_neg_x_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016118,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_neg_x_neg_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016119,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016120,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_pos_x_neg_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016121,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016122,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016123,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016124,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_y_and_neg_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016125,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_y_and_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016126,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_y_and_pos_x_pos_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016127,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016128,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_y_and_neg_x_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016129,
        "dEQP-GLES2.functional.clipping.triangle_vertex.cli",
        "p_three.clip_neg_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016130,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_y_and_pos_x_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016131,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_y_and_pos_x_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016132,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_y_and_neg_x_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016133,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016134,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016135,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016136,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_pos_x_pos_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016137,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016138,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_and_neg_x_pos_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016139,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016140,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016141,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016142,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016143,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016144,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016145,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016146,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016147,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016148,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016149,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016150,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016151,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016152,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_y_and_pos_x_pos_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016153,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_y_and_pos_x_pos_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016154,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016155,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016156,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016157,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016158,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016159,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_y_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016160,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_y_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016161,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_y_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016162,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_pos_x_pos_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016163,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016164,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016165,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016166,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016167,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016168,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016169,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016170,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016171,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016172,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016173,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_y_and_neg_x_pos_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016174,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_y_and_neg_x_pos_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016175,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016176,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016177,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016178,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016179,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016180,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_y_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016181,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_y_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016182,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_y_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016183,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016184,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_neg_x_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016185,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016186,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_neg_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016187,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016188,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_y_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016189,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_y_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016190,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_y_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016191,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016192,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016193,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_pos_x_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016194,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_pos_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016195,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016196,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_y_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016197,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_y_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016198,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_y_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016199,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016200,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016201,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016202,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016203,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016204,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016205,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016206,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016207,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016208,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016209,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016210,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_x_neg_z_and_pos_x_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016211,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016212,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_neg_z_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016213,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016214,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_z_and_pos_x_neg_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016215,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016216,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016217,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_neg_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016218,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016219,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016220,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016221,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016222,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016223,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016224,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016225,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016226,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016227,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016228,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016229,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_x_neg_z_and_neg_x_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016230,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016231,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_neg_z_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016232,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_z_and_neg_x_neg_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016233,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016234,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016235,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016236,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_neg_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016237,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_z_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016238,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_pos_x_pos_z_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016239,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016240,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016241,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016242,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016243,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_x_pos_z_and_neg_x_neg_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016244,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_z_and_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016245,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_t",
        "hree.clip_neg_x_pos_z_and_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016246,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016247,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016248,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016249,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016250,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_x_pos_z_and_pos_x_neg_y_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016251,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016252,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016253,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016254,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016255,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016256,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016257,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016258,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_neg_y_neg_z_and_pos_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016259,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_neg_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016260,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_neg_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016261,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_neg_z_and_pos_x_pos_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016262,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_neg_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016263,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_neg_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016264,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016265,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016266,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016267,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016268,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016269,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016270,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016271,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_thre",
        "e.clip_pos_y_neg_z_and_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016272,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_neg_z_and_neg_x_neg_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016273,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_neg_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016274,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_neg_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016275,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_neg_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016276,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_neg_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016277,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_pos_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016278,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_pos_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016279,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016280,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016281,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_pos_y_pos_z_and_neg_x_neg_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016282,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_pos_z_and_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016283,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_pos_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016284,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016285,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016286,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.c",
        "lip_neg_y_pos_z_and_pos_x_pos_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016287,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_pos_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016288,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016289,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016290,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016291,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_pos_x_neg_y_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016292,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016293,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_neg_y_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016294,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_neg_y_pos_z_and_pos_x_pos_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016295,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_neg_y_pos_z_and_neg_x_neg_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016296,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_neg_y_pos_z_and_pos_x_pos_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016297,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_pos_y_pos_z_and_neg_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016298,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_pos_y_pos_z_and_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016299,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016300,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016301,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_pos_y_pos_z_and_neg_x_neg_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016302,
        "dEQP-GLES2.functional.clipping.triangle_vertex.clip_three.clip",
        "_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z_and_pos_x_pos_y_neg_z");
