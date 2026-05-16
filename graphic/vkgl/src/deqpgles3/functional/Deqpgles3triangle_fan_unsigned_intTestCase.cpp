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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039987,
        "dEQP-GLES3.functional.primitive_restart.ba",
        "sic.triangle_fan.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039988,
        "dEQP-GLES3.functional.primitive_restart.basic.t",
        "riangle_fan.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039989,
        "dEQP-GLES3.functional.primitive_restart.basic",
        ".triangle_fan.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040050,
        "dEQP-GLES3.functional.primitive_restart.duplicate",
        "_restarts.triangle_fan.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040051,
        "dEQP-GLES3.functional.primitive_restart.duplicate_rest",
        "arts.triangle_fan.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040052,
        "dEQP-GLES3.functional.primitive_restart.duplicate_re",
        "starts.triangle_fan.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040113,
        "dEQP-GLES3.functional.primitive_restart.end_r",
        "estart.triangle_fan.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040114,
        "dEQP-GLES3.functional.primitive_restart.end_restar",
        "t.triangle_fan.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040115,
        "dEQP-GLES3.functional.primitive_restart.end_rest",
        "art.triangle_fan.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040176,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dup",
        "licate_restarts.triangle_fan.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040177,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplicat",
        "e_restarts.triangle_fan.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040178,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplic",
        "ate_restarts.triangle_fan.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040239,
        "dEQP-GLES3.functional.primitive_restart.begin_",
        "restart.triangle_fan.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040240,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt.triangle_fan.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040241,
        "dEQP-GLES3.functional.primitive_restart.begin_res",
        "tart.triangle_fan.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040302,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_du",
        "plicate_restarts.triangle_fan.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040303,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplica",
        "te_restarts.triangle_fan.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040304,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupli",
        "cate_restarts.triangle_fan.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040365,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t_end_restart.triangle_fan.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040366,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end",
        "_restart.triangle_fan.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040367,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_e",
        "nd_restart.triangle_fan.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040428,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_rest",
        "art_duplicate_restarts.triangle_fan.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040429,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_d",
        "uplicate_restarts.triangle_fan.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040430,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart",
        "_duplicate_restarts.triangle_fan.unsigned_int.draw_range_elements");
