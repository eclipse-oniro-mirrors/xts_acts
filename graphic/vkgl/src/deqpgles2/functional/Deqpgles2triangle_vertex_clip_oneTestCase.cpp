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

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015785,
        "dEQP-GLES2.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_neg_x");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015786,
        "dEQP-GLES2.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015787,
        "dEQP-GLES2.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015788,
        "dEQP-GLES2.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015789,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015790,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015791,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015792,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015793,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015794,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015795,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015796,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015797,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015798,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015799,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015800,
        "dEQP-GLES2.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015801,
        "dEQP-GLES2.functional.clipping.triangle",
        "_vertex.clip_one.clip_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015802,
        "dEQP-GLES2.functional.clipping.triangle",
        "_vertex.clip_one.clip_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015803,
        "dEQP-GLES2.functional.clipping.triangle",
        "_vertex.clip_one.clip_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015804,
        "dEQP-GLES2.functional.clipping.triangle",
        "_vertex.clip_one.clip_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015805,
        "dEQP-GLES2.functional.clipping.triangle",
        "_vertex.clip_one.clip_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015806,
        "dEQP-GLES2.functional.clipping.triangle",
        "_vertex.clip_one.clip_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015807,
        "dEQP-GLES2.functional.clipping.triangle",
        "_vertex.clip_one.clip_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015808,
        "dEQP-GLES2.functional.clipping.triangle",
        "_vertex.clip_one.clip_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015809,
        "dEQP-GLES2.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015810,
        "dEQP-GLES2.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_neg_z");
