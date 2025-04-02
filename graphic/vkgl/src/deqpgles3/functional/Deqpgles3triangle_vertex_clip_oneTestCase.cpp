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

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043385,
        "dEQP-GLES3.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_neg_x");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043386,
        "dEQP-GLES3.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043387,
        "dEQP-GLES3.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043388,
        "dEQP-GLES3.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043389,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043390,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043391,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043392,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043393,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043394,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043395,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043396,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043397,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043398,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043399,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043400,
        "dEQP-GLES3.functional.clipping.trian",
        "gle_vertex.clip_one.clip_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043401,
        "dEQP-GLES3.functional.clipping.triangle",
        "_vertex.clip_one.clip_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043402,
        "dEQP-GLES3.functional.clipping.triangle",
        "_vertex.clip_one.clip_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043403,
        "dEQP-GLES3.functional.clipping.triangle",
        "_vertex.clip_one.clip_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043404,
        "dEQP-GLES3.functional.clipping.triangle",
        "_vertex.clip_one.clip_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043405,
        "dEQP-GLES3.functional.clipping.triangle",
        "_vertex.clip_one.clip_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043406,
        "dEQP-GLES3.functional.clipping.triangle",
        "_vertex.clip_one.clip_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043407,
        "dEQP-GLES3.functional.clipping.triangle",
        "_vertex.clip_one.clip_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043408,
        "dEQP-GLES3.functional.clipping.triangle",
        "_vertex.clip_one.clip_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043409,
        "dEQP-GLES3.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043410,
        "dEQP-GLES3.functional.clipping.tr",
        "iangle_vertex.clip_one.clip_neg_z");
