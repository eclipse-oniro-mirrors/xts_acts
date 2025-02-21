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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039942,
        "dEQP-GLES3.functional.primitive_restart",
        ".basic.points.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039943,
        "dEQP-GLES3.functional.primitive_restart.basi",
        "c.points.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039944,
        "dEQP-GLES3.functional.primitive_restart.ba",
        "sic.points.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040005,
        "dEQP-GLES3.functional.primitive_restart.duplic",
        "ate_restarts.points.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040006,
        "dEQP-GLES3.functional.primitive_restart.duplicate_r",
        "estarts.points.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040007,
        "dEQP-GLES3.functional.primitive_restart.duplicate",
        "_restarts.points.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040068,
        "dEQP-GLES3.functional.primitive_restart.en",
        "d_restart.points.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040069,
        "dEQP-GLES3.functional.primitive_restart.end_res",
        "tart.points.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040070,
        "dEQP-GLES3.functional.primitive_restart.end_r",
        "estart.points.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040131,
        "dEQP-GLES3.functional.primitive_restart.end_restart_",
        "duplicate_restarts.points.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040132,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupli",
        "cate_restarts.points.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040133,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dup",
        "licate_restarts.points.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040194,
        "dEQP-GLES3.functional.primitive_restart.beg",
        "in_restart.points.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040195,
        "dEQP-GLES3.functional.primitive_restart.begin_re",
        "start.points.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040196,
        "dEQP-GLES3.functional.primitive_restart.begin_",
        "restart.points.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040257,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        "_duplicate_restarts.points.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040258,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupl",
        "icate_restarts.points.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040259,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_du",
        "plicate_restarts.points.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040320,
        "dEQP-GLES3.functional.primitive_restart.begin_res",
        "tart_end_restart.points.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040321,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "end_restart.points.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040322,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t_end_restart.points.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040383,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_r",
        "estart_duplicate_restarts.points.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040384,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restar",
        "t_duplicate_restarts.points.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040385,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_rest",
        "art_duplicate_restarts.points.unsigned_int.draw_range_elements");
