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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039963,
        "dEQP-GLES3.functional.primitive_restart",
        ".basic.lines.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039964,
        "dEQP-GLES3.functional.primitive_restart.basi",
        "c.lines.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039965,
        "dEQP-GLES3.functional.primitive_restart.ba",
        "sic.lines.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040026,
        "dEQP-GLES3.functional.primitive_restart.duplic",
        "ate_restarts.lines.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040027,
        "dEQP-GLES3.functional.primitive_restart.duplicate_r",
        "estarts.lines.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040028,
        "dEQP-GLES3.functional.primitive_restart.duplicate",
        "_restarts.lines.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040089,
        "dEQP-GLES3.functional.primitive_restart.en",
        "d_restart.lines.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040090,
        "dEQP-GLES3.functional.primitive_restart.end_res",
        "tart.lines.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040091,
        "dEQP-GLES3.functional.primitive_restart.end_r",
        "estart.lines.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040152,
        "dEQP-GLES3.functional.primitive_restart.end_restart_",
        "duplicate_restarts.lines.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040153,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupli",
        "cate_restarts.lines.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040154,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dup",
        "licate_restarts.lines.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040215,
        "dEQP-GLES3.functional.primitive_restart.beg",
        "in_restart.lines.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040216,
        "dEQP-GLES3.functional.primitive_restart.begin_re",
        "start.lines.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040217,
        "dEQP-GLES3.functional.primitive_restart.begin_",
        "restart.lines.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040278,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        "_duplicate_restarts.lines.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040279,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupl",
        "icate_restarts.lines.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040280,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_du",
        "plicate_restarts.lines.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040341,
        "dEQP-GLES3.functional.primitive_restart.begin_res",
        "tart_end_restart.lines.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040342,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "end_restart.lines.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040343,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t_end_restart.lines.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040404,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_r",
        "estart_duplicate_restarts.lines.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040405,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restar",
        "t_duplicate_restarts.lines.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040406,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_rest",
        "art_duplicate_restarts.lines.unsigned_byte.draw_range_elements");
