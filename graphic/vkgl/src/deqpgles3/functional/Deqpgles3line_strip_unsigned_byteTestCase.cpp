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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039945,
        "dEQP-GLES3.functional.primitive_restart.ba",
        "sic.line_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039946,
        "dEQP-GLES3.functional.primitive_restart.basic.l",
        "ine_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039947,
        "dEQP-GLES3.functional.primitive_restart.basic",
        ".line_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040008,
        "dEQP-GLES3.functional.primitive_restart.duplicat",
        "e_restarts.line_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040009,
        "dEQP-GLES3.functional.primitive_restart.duplicate_res",
        "tarts.line_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040010,
        "dEQP-GLES3.functional.primitive_restart.duplicate_r",
        "estarts.line_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040071,
        "dEQP-GLES3.functional.primitive_restart.end_r",
        "estart.line_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040072,
        "dEQP-GLES3.functional.primitive_restart.end_restar",
        "t.line_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040073,
        "dEQP-GLES3.functional.primitive_restart.end_rest",
        "art.line_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040134,
        "dEQP-GLES3.functional.primitive_restart.end_restart_du",
        "plicate_restarts.line_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040135,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplica",
        "te_restarts.line_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040136,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupli",
        "cate_restarts.line_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040197,
        "dEQP-GLES3.functional.primitive_restart.begin_",
        "restart.line_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040198,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt.line_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040199,
        "dEQP-GLES3.functional.primitive_restart.begin_res",
        "tart.line_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040260,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_d",
        "uplicate_restarts.line_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040261,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplic",
        "ate_restarts.line_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040262,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupl",
        "icate_restarts.line_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040323,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t_end_restart.line_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040324,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end",
        "_restart.line_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040325,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_e",
        "nd_restart.line_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040386,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_res",
        "tart_duplicate_restarts.line_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040387,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_",
        "duplicate_restarts.line_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040388,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restar",
        "t_duplicate_restarts.line_strip.unsigned_byte.draw_range_elements");
