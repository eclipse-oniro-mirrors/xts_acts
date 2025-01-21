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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039936,
        "dEQP-GLES3.functional.primitive_restart.",
        "basic.points.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039937,
        "dEQP-GLES3.functional.primitive_restart.basic",
        ".points.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039938,
        "dEQP-GLES3.functional.primitive_restart.bas",
        "ic.points.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039999,
        "dEQP-GLES3.functional.primitive_restart.duplic",
        "ate_restarts.points.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040000,
        "dEQP-GLES3.functional.primitive_restart.duplicate_r",
        "estarts.points.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040001,
        "dEQP-GLES3.functional.primitive_restart.duplicate",
        "_restarts.points.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040062,
        "dEQP-GLES3.functional.primitive_restart.end",
        "_restart.points.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040063,
        "dEQP-GLES3.functional.primitive_restart.end_rest",
        "art.points.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040064,
        "dEQP-GLES3.functional.primitive_restart.end_re",
        "start.points.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040125,
        "dEQP-GLES3.functional.primitive_restart.end_restart_",
        "duplicate_restarts.points.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040126,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupli",
        "cate_restarts.points.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040127,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dup",
        "licate_restarts.points.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040188,
        "dEQP-GLES3.functional.primitive_restart.begi",
        "n_restart.points.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040189,
        "dEQP-GLES3.functional.primitive_restart.begin_res",
        "tart.points.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040190,
        "dEQP-GLES3.functional.primitive_restart.begin_r",
        "estart.points.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040251,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        "_duplicate_restarts.points.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040252,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupl",
        "icate_restarts.points.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040253,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_du",
        "plicate_restarts.points.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040314,
        "dEQP-GLES3.functional.primitive_restart.begin_rest",
        "art_end_restart.points.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040315,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_e",
        "nd_restart.points.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040316,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        "_end_restart.points.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040377,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_r",
        "estart_duplicate_restarts.points.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040378,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restar",
        "t_duplicate_restarts.points.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040379,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_rest",
        "art_duplicate_restarts.points.unsigned_byte.draw_range_elements");
