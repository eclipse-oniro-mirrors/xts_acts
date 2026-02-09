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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039993,
        "dEQP-GLES3.functional.primitive_restart.ba",
        "sic.triangles.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039994,
        "dEQP-GLES3.functional.primitive_restart.basic.t",
        "riangles.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039995,
        "dEQP-GLES3.functional.primitive_restart.basic",
        ".triangles.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040056,
        "dEQP-GLES3.functional.primitive_restart.duplicat",
        "e_restarts.triangles.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040057,
        "dEQP-GLES3.functional.primitive_restart.duplicate_res",
        "tarts.triangles.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040058,
        "dEQP-GLES3.functional.primitive_restart.duplicate_r",
        "estarts.triangles.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040119,
        "dEQP-GLES3.functional.primitive_restart.end_r",
        "estart.triangles.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040120,
        "dEQP-GLES3.functional.primitive_restart.end_restar",
        "t.triangles.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040121,
        "dEQP-GLES3.functional.primitive_restart.end_rest",
        "art.triangles.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040182,
        "dEQP-GLES3.functional.primitive_restart.end_restart_du",
        "plicate_restarts.triangles.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040183,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplica",
        "te_restarts.triangles.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040184,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupli",
        "cate_restarts.triangles.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040245,
        "dEQP-GLES3.functional.primitive_restart.begin_",
        "restart.triangles.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040246,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt.triangles.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040247,
        "dEQP-GLES3.functional.primitive_restart.begin_res",
        "tart.triangles.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040308,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_d",
        "uplicate_restarts.triangles.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040309,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplic",
        "ate_restarts.triangles.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040310,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupl",
        "icate_restarts.triangles.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040371,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t_end_restart.triangles.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040372,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end",
        "_restart.triangles.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040373,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_e",
        "nd_restart.triangles.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040434,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_res",
        "tart_duplicate_restarts.triangles.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040435,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_",
        "duplicate_restarts.triangles.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040436,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restar",
        "t_duplicate_restarts.triangles.unsigned_short.draw_range_elements");
