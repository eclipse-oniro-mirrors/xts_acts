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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039951,
        "dEQP-GLES3.functional.primitive_restart.b",
        "asic.line_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039952,
        "dEQP-GLES3.functional.primitive_restart.basic.",
        "line_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039953,
        "dEQP-GLES3.functional.primitive_restart.basi",
        "c.line_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040014,
        "dEQP-GLES3.functional.primitive_restart.duplicat",
        "e_restarts.line_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040015,
        "dEQP-GLES3.functional.primitive_restart.duplicate_res",
        "tarts.line_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040016,
        "dEQP-GLES3.functional.primitive_restart.duplicate_r",
        "estarts.line_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040077,
        "dEQP-GLES3.functional.primitive_restart.end_",
        "restart.line_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040078,
        "dEQP-GLES3.functional.primitive_restart.end_resta",
        "rt.line_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040079,
        "dEQP-GLES3.functional.primitive_restart.end_res",
        "tart.line_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040140,
        "dEQP-GLES3.functional.primitive_restart.end_restart_du",
        "plicate_restarts.line_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040141,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplica",
        "te_restarts.line_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040142,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupli",
        "cate_restarts.line_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040203,
        "dEQP-GLES3.functional.primitive_restart.begin",
        "_restart.line_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040204,
        "dEQP-GLES3.functional.primitive_restart.begin_rest",
        "art.line_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040205,
        "dEQP-GLES3.functional.primitive_restart.begin_re",
        "start.line_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040266,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_d",
        "uplicate_restarts.line_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040267,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplic",
        "ate_restarts.line_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040268,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupl",
        "icate_restarts.line_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040329,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt_end_restart.line_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040330,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_en",
        "d_restart.line_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040331,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "end_restart.line_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040392,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_res",
        "tart_duplicate_restarts.line_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040393,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_",
        "duplicate_restarts.line_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040394,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restar",
        "t_duplicate_restarts.line_strip.unsigned_int.draw_range_elements");
