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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039954,
        "dEQP-GLES3.functional.primitive_restart.b",
        "asic.line_loop.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039955,
        "dEQP-GLES3.functional.primitive_restart.basic.",
        "line_loop.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039956,
        "dEQP-GLES3.functional.primitive_restart.basi",
        "c.line_loop.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040017,
        "dEQP-GLES3.functional.primitive_restart.duplicat",
        "e_restarts.line_loop.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040018,
        "dEQP-GLES3.functional.primitive_restart.duplicate_res",
        "tarts.line_loop.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040019,
        "dEQP-GLES3.functional.primitive_restart.duplicate_r",
        "estarts.line_loop.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040080,
        "dEQP-GLES3.functional.primitive_restart.end_",
        "restart.line_loop.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040081,
        "dEQP-GLES3.functional.primitive_restart.end_resta",
        "rt.line_loop.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040082,
        "dEQP-GLES3.functional.primitive_restart.end_res",
        "tart.line_loop.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040143,
        "dEQP-GLES3.functional.primitive_restart.end_restart_du",
        "plicate_restarts.line_loop.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040144,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplica",
        "te_restarts.line_loop.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040145,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupli",
        "cate_restarts.line_loop.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040206,
        "dEQP-GLES3.functional.primitive_restart.begin",
        "_restart.line_loop.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040207,
        "dEQP-GLES3.functional.primitive_restart.begin_rest",
        "art.line_loop.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040208,
        "dEQP-GLES3.functional.primitive_restart.begin_re",
        "start.line_loop.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040269,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_d",
        "uplicate_restarts.line_loop.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040270,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplic",
        "ate_restarts.line_loop.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040271,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupl",
        "icate_restarts.line_loop.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040332,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt_end_restart.line_loop.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040333,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_en",
        "d_restart.line_loop.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040334,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "end_restart.line_loop.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040395,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_res",
        "tart_duplicate_restarts.line_loop.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040396,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_",
        "duplicate_restarts.line_loop.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040397,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restar",
        "t_duplicate_restarts.line_loop.unsigned_byte.draw_range_elements");
