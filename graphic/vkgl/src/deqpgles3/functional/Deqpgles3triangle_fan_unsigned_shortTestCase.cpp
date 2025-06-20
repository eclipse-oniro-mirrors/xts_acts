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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039984,
        "dEQP-GLES3.functional.primitive_restart.bas",
        "ic.triangle_fan.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039985,
        "dEQP-GLES3.functional.primitive_restart.basic.tr",
        "iangle_fan.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039986,
        "dEQP-GLES3.functional.primitive_restart.basic.",
        "triangle_fan.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040047,
        "dEQP-GLES3.functional.primitive_restart.duplicate_",
        "restarts.triangle_fan.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040048,
        "dEQP-GLES3.functional.primitive_restart.duplicate_resta",
        "rts.triangle_fan.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040049,
        "dEQP-GLES3.functional.primitive_restart.duplicate_res",
        "tarts.triangle_fan.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040110,
        "dEQP-GLES3.functional.primitive_restart.end_re",
        "start.triangle_fan.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040111,
        "dEQP-GLES3.functional.primitive_restart.end_restart",
        ".triangle_fan.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040112,
        "dEQP-GLES3.functional.primitive_restart.end_resta",
        "rt.triangle_fan.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040173,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupl",
        "icate_restarts.triangle_fan.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040174,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplicate",
        "_restarts.triangle_fan.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040175,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplica",
        "te_restarts.triangle_fan.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040236,
        "dEQP-GLES3.functional.primitive_restart.begin_r",
        "estart.triangle_fan.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040237,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t.triangle_fan.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040238,
        "dEQP-GLES3.functional.primitive_restart.begin_rest",
        "art.triangle_fan.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040299,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dup",
        "licate_restarts.triangle_fan.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040300,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplicat",
        "e_restarts.triangle_fan.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040301,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplic",
        "ate_restarts.triangle_fan.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040362,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        "_end_restart.triangle_fan.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040363,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_",
        "restart.triangle_fan.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040364,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_en",
        "d_restart.triangle_fan.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040425,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_resta",
        "rt_duplicate_restarts.triangle_fan.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040426,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_du",
        "plicate_restarts.triangle_fan.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040427,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_",
        "duplicate_restarts.triangle_fan.unsigned_short.draw_range_elements");
