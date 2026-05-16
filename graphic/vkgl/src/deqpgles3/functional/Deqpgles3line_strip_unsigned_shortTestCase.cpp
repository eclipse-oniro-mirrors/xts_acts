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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039948,
        "dEQP-GLES3.functional.primitive_restart.ba",
        "sic.line_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039949,
        "dEQP-GLES3.functional.primitive_restart.basic.l",
        "ine_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039950,
        "dEQP-GLES3.functional.primitive_restart.basic",
        ".line_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040011,
        "dEQP-GLES3.functional.primitive_restart.duplicate",
        "_restarts.line_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040012,
        "dEQP-GLES3.functional.primitive_restart.duplicate_rest",
        "arts.line_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040013,
        "dEQP-GLES3.functional.primitive_restart.duplicate_re",
        "starts.line_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040074,
        "dEQP-GLES3.functional.primitive_restart.end_r",
        "estart.line_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040075,
        "dEQP-GLES3.functional.primitive_restart.end_restar",
        "t.line_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040076,
        "dEQP-GLES3.functional.primitive_restart.end_rest",
        "art.line_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040137,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dup",
        "licate_restarts.line_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040138,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplicat",
        "e_restarts.line_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040139,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplic",
        "ate_restarts.line_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040200,
        "dEQP-GLES3.functional.primitive_restart.begin_",
        "restart.line_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040201,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt.line_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040202,
        "dEQP-GLES3.functional.primitive_restart.begin_res",
        "tart.line_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040263,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_du",
        "plicate_restarts.line_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040264,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplica",
        "te_restarts.line_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040265,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupli",
        "cate_restarts.line_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040326,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t_end_restart.line_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040327,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end",
        "_restart.line_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040328,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_e",
        "nd_restart.line_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040389,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_rest",
        "art_duplicate_restarts.line_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040390,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_d",
        "uplicate_restarts.line_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040391,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart",
        "_duplicate_restarts.line_strip.unsigned_short.draw_range_elements");
