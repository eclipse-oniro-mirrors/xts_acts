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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039966,
        "dEQP-GLES3.functional.primitive_restart.",
        "basic.lines.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039967,
        "dEQP-GLES3.functional.primitive_restart.basic",
        ".lines.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039968,
        "dEQP-GLES3.functional.primitive_restart.bas",
        "ic.lines.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040029,
        "dEQP-GLES3.functional.primitive_restart.duplic",
        "ate_restarts.lines.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040030,
        "dEQP-GLES3.functional.primitive_restart.duplicate_r",
        "estarts.lines.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040031,
        "dEQP-GLES3.functional.primitive_restart.duplicate",
        "_restarts.lines.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040092,
        "dEQP-GLES3.functional.primitive_restart.end",
        "_restart.lines.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040093,
        "dEQP-GLES3.functional.primitive_restart.end_rest",
        "art.lines.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040094,
        "dEQP-GLES3.functional.primitive_restart.end_re",
        "start.lines.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040155,
        "dEQP-GLES3.functional.primitive_restart.end_restart_",
        "duplicate_restarts.lines.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040156,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupli",
        "cate_restarts.lines.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040157,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dup",
        "licate_restarts.lines.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040218,
        "dEQP-GLES3.functional.primitive_restart.begi",
        "n_restart.lines.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040219,
        "dEQP-GLES3.functional.primitive_restart.begin_res",
        "tart.lines.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040220,
        "dEQP-GLES3.functional.primitive_restart.begin_r",
        "estart.lines.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040281,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        "_duplicate_restarts.lines.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040282,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupl",
        "icate_restarts.lines.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040283,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_du",
        "plicate_restarts.lines.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040344,
        "dEQP-GLES3.functional.primitive_restart.begin_rest",
        "art_end_restart.lines.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040345,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_e",
        "nd_restart.lines.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040346,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        "_end_restart.lines.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040407,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_r",
        "estart_duplicate_restarts.lines.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040408,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restar",
        "t_duplicate_restarts.lines.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040409,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_rest",
        "art_duplicate_restarts.lines.unsigned_short.draw_range_elements");
