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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039957,
        "dEQP-GLES3.functional.primitive_restart.ba",
        "sic.line_loop.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039958,
        "dEQP-GLES3.functional.primitive_restart.basic.l",
        "ine_loop.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039959,
        "dEQP-GLES3.functional.primitive_restart.basic",
        ".line_loop.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040020,
        "dEQP-GLES3.functional.primitive_restart.duplicat",
        "e_restarts.line_loop.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040021,
        "dEQP-GLES3.functional.primitive_restart.duplicate_res",
        "tarts.line_loop.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040022,
        "dEQP-GLES3.functional.primitive_restart.duplicate_r",
        "estarts.line_loop.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040083,
        "dEQP-GLES3.functional.primitive_restart.end_r",
        "estart.line_loop.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040084,
        "dEQP-GLES3.functional.primitive_restart.end_restar",
        "t.line_loop.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040085,
        "dEQP-GLES3.functional.primitive_restart.end_rest",
        "art.line_loop.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040146,
        "dEQP-GLES3.functional.primitive_restart.end_restart_du",
        "plicate_restarts.line_loop.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040147,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplica",
        "te_restarts.line_loop.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040148,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupli",
        "cate_restarts.line_loop.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040209,
        "dEQP-GLES3.functional.primitive_restart.begin_",
        "restart.line_loop.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040210,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt.line_loop.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040211,
        "dEQP-GLES3.functional.primitive_restart.begin_res",
        "tart.line_loop.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040272,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_d",
        "uplicate_restarts.line_loop.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040273,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplic",
        "ate_restarts.line_loop.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040274,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupl",
        "icate_restarts.line_loop.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040335,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t_end_restart.line_loop.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040336,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end",
        "_restart.line_loop.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040337,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_e",
        "nd_restart.line_loop.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040398,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_res",
        "tart_duplicate_restarts.line_loop.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040399,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_",
        "duplicate_restarts.line_loop.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040400,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restar",
        "t_duplicate_restarts.line_loop.unsigned_short.draw_range_elements");
