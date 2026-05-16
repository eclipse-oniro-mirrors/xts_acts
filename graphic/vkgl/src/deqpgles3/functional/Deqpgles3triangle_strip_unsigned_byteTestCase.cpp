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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039972,
        "dEQP-GLES3.functional.primitive_restart.basi",
        "c.triangle_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039973,
        "dEQP-GLES3.functional.primitive_restart.basic.tri",
        "angle_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039974,
        "dEQP-GLES3.functional.primitive_restart.basic.t",
        "riangle_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040035,
        "dEQP-GLES3.functional.primitive_restart.duplicate_",
        "restarts.triangle_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040036,
        "dEQP-GLES3.functional.primitive_restart.duplicate_resta",
        "rts.triangle_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040037,
        "dEQP-GLES3.functional.primitive_restart.duplicate_res",
        "tarts.triangle_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040098,
        "dEQP-GLES3.functional.primitive_restart.end_res",
        "tart.triangle_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040099,
        "dEQP-GLES3.functional.primitive_restart.end_restart.",
        "triangle_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040100,
        "dEQP-GLES3.functional.primitive_restart.end_restar",
        "t.triangle_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040161,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupl",
        "icate_restarts.triangle_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040162,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplicate",
        "_restarts.triangle_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040163,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplica",
        "te_restarts.triangle_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040224,
        "dEQP-GLES3.functional.primitive_restart.begin_re",
        "start.triangle_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040225,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        ".triangle_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040226,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt.triangle_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040287,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dup",
        "licate_restarts.triangle_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040288,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplicat",
        "e_restarts.triangle_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040289,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplic",
        "ate_restarts.triangle_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040350,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "end_restart.triangle_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040351,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_r",
        "estart.triangle_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040352,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end",
        "_restart.triangle_strip.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040413,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_resta",
        "rt_duplicate_restarts.triangle_strip.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040414,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_du",
        "plicate_restarts.triangle_strip.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040415,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_",
        "duplicate_restarts.triangle_strip.unsigned_byte.draw_range_elements");
