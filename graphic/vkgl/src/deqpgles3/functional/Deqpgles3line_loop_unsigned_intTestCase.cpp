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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039960,
        "dEQP-GLES3.functional.primitive_restart.b",
        "asic.line_loop.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039961,
        "dEQP-GLES3.functional.primitive_restart.basic.",
        "line_loop.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039962,
        "dEQP-GLES3.functional.primitive_restart.basi",
        "c.line_loop.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040023,
        "dEQP-GLES3.functional.primitive_restart.duplica",
        "te_restarts.line_loop.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040024,
        "dEQP-GLES3.functional.primitive_restart.duplicate_re",
        "starts.line_loop.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040025,
        "dEQP-GLES3.functional.primitive_restart.duplicate_",
        "restarts.line_loop.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040086,
        "dEQP-GLES3.functional.primitive_restart.end_",
        "restart.line_loop.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040087,
        "dEQP-GLES3.functional.primitive_restart.end_resta",
        "rt.line_loop.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040088,
        "dEQP-GLES3.functional.primitive_restart.end_res",
        "tart.line_loop.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040149,
        "dEQP-GLES3.functional.primitive_restart.end_restart_d",
        "uplicate_restarts.line_loop.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040150,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplic",
        "ate_restarts.line_loop.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040151,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupl",
        "icate_restarts.line_loop.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040212,
        "dEQP-GLES3.functional.primitive_restart.begin",
        "_restart.line_loop.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040213,
        "dEQP-GLES3.functional.primitive_restart.begin_rest",
        "art.line_loop.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040214,
        "dEQP-GLES3.functional.primitive_restart.begin_re",
        "start.line_loop.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040275,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "duplicate_restarts.line_loop.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040276,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupli",
        "cate_restarts.line_loop.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040277,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dup",
        "licate_restarts.line_loop.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040338,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt_end_restart.line_loop.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040339,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_en",
        "d_restart.line_loop.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040340,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "end_restart.line_loop.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040401,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_re",
        "start_duplicate_restarts.line_loop.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040402,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart",
        "_duplicate_restarts.line_loop.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040403,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_resta",
        "rt_duplicate_restarts.line_loop.unsigned_int.draw_range_elements");
