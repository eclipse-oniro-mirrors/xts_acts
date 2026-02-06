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
#include "../ActsDeqpgles30040TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039939,
        "dEQP-GLES3.functional.primitive_restart.",
        "basic.points.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039940,
        "dEQP-GLES3.functional.primitive_restart.basic",
        ".points.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039941,
        "dEQP-GLES3.functional.primitive_restart.bas",
        "ic.points.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040002,
        "dEQP-GLES3.functional.primitive_restart.duplica",
        "te_restarts.points.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040003,
        "dEQP-GLES3.functional.primitive_restart.duplicate_re",
        "starts.points.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040004,
        "dEQP-GLES3.functional.primitive_restart.duplicate_",
        "restarts.points.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040065,
        "dEQP-GLES3.functional.primitive_restart.end",
        "_restart.points.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040066,
        "dEQP-GLES3.functional.primitive_restart.end_rest",
        "art.points.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040067,
        "dEQP-GLES3.functional.primitive_restart.end_re",
        "start.points.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040128,
        "dEQP-GLES3.functional.primitive_restart.end_restart_d",
        "uplicate_restarts.points.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040129,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplic",
        "ate_restarts.points.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040130,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupl",
        "icate_restarts.points.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040191,
        "dEQP-GLES3.functional.primitive_restart.begi",
        "n_restart.points.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040192,
        "dEQP-GLES3.functional.primitive_restart.begin_res",
        "tart.points.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040193,
        "dEQP-GLES3.functional.primitive_restart.begin_r",
        "estart.points.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040254,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "duplicate_restarts.points.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040255,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupli",
        "cate_restarts.points.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040256,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dup",
        "licate_restarts.points.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040317,
        "dEQP-GLES3.functional.primitive_restart.begin_rest",
        "art_end_restart.points.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040318,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_e",
        "nd_restart.points.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040319,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        "_end_restart.points.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040380,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_re",
        "start_duplicate_restarts.points.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040381,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart",
        "_duplicate_restarts.points.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040382,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_resta",
        "rt_duplicate_restarts.points.unsigned_short.draw_range_elements");
