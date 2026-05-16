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

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043411,
        "dEQP-GLES3.functional.clipping.triangl",
        "e_vertex.clip_two.clip_neg_x_and_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043412,
        "dEQP-GLES3.functional.clipping.triangl",
        "e_vertex.clip_two.clip_neg_x_and_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043413,
        "dEQP-GLES3.functional.clipping.triangl",
        "e_vertex.clip_two.clip_neg_x_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043414,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043415,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043416,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043417,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043418,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043419,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043420,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043421,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_x_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043422,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043423,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043424,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043425,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043426,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043427,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043428,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043429,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043430,
        "dEQP-GLES3.functional.clipping.triangl",
        "e_vertex.clip_two.clip_pos_x_and_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043431,
        "dEQP-GLES3.functional.clipping.triangl",
        "e_vertex.clip_two.clip_pos_x_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043432,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043433,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043434,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043435,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043436,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043437,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043438,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043439,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_x_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043440,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043441,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043442,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043443,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043444,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043445,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043446,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043447,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043448,
        "dEQP-GLES3.functional.clipping.triangl",
        "e_vertex.clip_two.clip_pos_y_and_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043449,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043450,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043451,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043452,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043453,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043454,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043455,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043456,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_pos_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043457,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043458,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043459,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043460,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043461,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043462,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043463,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043464,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043465,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_neg_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043466,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043467,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043468,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043469,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043470,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043471,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043472,
        "dEQP-GLES3.functional.clipping.triangle_v",
        "ertex.clip_two.clip_neg_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043473,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043474,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043475,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043476,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043477,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043478,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043479,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043480,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043481,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_x_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043482,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043483,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043484,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043485,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043486,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043487,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043488,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043489,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043490,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043491,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043492,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043493,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043494,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043495,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043496,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_pos_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043497,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043498,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043499,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043500,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043501,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043502,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043503,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043504,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043505,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043506,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043507,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043508,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043509,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043510,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_neg_x_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043511,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043512,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043513,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043514,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043515,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043516,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043517,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043518,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043519,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_y_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043520,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_y_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043521,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_y_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043522,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_y_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043523,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_neg_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043524,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_pos_x_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043525,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043526,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043527,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043528,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043529,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043530,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_y_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043531,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_y_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043532,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_y_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043533,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_y_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043534,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_y_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043535,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_z_and_pos_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043536,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043537,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043538,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043539,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043540,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043541,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043542,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043543,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043544,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043545,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043546,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043547,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043548,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_z_and_neg_x_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043549,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043550,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043551,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043552,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043553,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043554,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043555,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043556,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043557,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043558,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043559,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043560,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043561,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043562,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043563,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043564,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_x_pos_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043565,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043566,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043567,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043568,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043569,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043570,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043571,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043572,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_x_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043573,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_z_and_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043574,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_z_and_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043575,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043576,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_x_pos_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043577,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043578,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043579,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043580,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043581,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043582,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043583,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043584,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_x_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043585,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_neg_y_neg_z_and_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043586,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043587,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043588,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043589,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043590,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043591,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043592,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043593,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043594,
        "dEQP-GLES3.functional.clipping.triangle_vert",
        "ex.clip_two.clip_pos_y_neg_z_and_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043595,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043596,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043597,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043598,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043599,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043600,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043601,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043602,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043603,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043604,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043605,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043606,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043607,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043608,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043609,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043610,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_pos_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043611,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_neg_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043612,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043613,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043614,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043615,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043616,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043617,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043618,
        "dEQP-GLES3.functional.clipping.triangle_vertex.",
        "clip_two.clip_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043619,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_pos_z_and_pos_x_neg_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043620,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043621,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043622,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043623,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043624,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_neg_y_pos_z_and_pos_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043625,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_neg_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043626,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_neg_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043627,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_neg_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043628,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_pos_y_pos_z_and_neg_x_pos_y_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043629,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043630,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043631,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_pos_y_pos_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043632,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_pos_y_pos_z_and_neg_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043633,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_pos_y_pos_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043634,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_pos_y_pos_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043635,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_neg_z_and_pos_x_neg_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043636,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_neg_x_neg_y_neg_z_and_neg_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043637,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_neg_y_neg_z_and_pos_x_pos_y_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043638,
        "dEQP-GLES3.functional.clipping.triangle_vertex.cli",
        "p_two.clip_pos_x_pos_y_neg_z_and_neg_x_pos_y_neg_z");
