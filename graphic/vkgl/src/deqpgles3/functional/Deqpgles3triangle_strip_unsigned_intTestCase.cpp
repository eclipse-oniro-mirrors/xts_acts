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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039978,
        "dEQP-GLES3.functional.primitive_restart.bas",
        "ic.triangle_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039979,
        "dEQP-GLES3.functional.primitive_restart.basic.tr",
        "iangle_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039980,
        "dEQP-GLES3.functional.primitive_restart.basic.",
        "triangle_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040041,
        "dEQP-GLES3.functional.primitive_restart.duplicate_",
        "restarts.triangle_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040042,
        "dEQP-GLES3.functional.primitive_restart.duplicate_resta",
        "rts.triangle_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040043,
        "dEQP-GLES3.functional.primitive_restart.duplicate_res",
        "tarts.triangle_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040104,
        "dEQP-GLES3.functional.primitive_restart.end_re",
        "start.triangle_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040105,
        "dEQP-GLES3.functional.primitive_restart.end_restart",
        ".triangle_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040106,
        "dEQP-GLES3.functional.primitive_restart.end_resta",
        "rt.triangle_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040167,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupl",
        "icate_restarts.triangle_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040168,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplicate",
        "_restarts.triangle_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040169,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplica",
        "te_restarts.triangle_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040230,
        "dEQP-GLES3.functional.primitive_restart.begin_r",
        "estart.triangle_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040231,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t.triangle_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040232,
        "dEQP-GLES3.functional.primitive_restart.begin_rest",
        "art.triangle_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040293,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dup",
        "licate_restarts.triangle_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040294,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplicat",
        "e_restarts.triangle_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040295,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplic",
        "ate_restarts.triangle_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040356,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        "_end_restart.triangle_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040357,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_",
        "restart.triangle_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040358,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_en",
        "d_restart.triangle_strip.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040419,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_resta",
        "rt_duplicate_restarts.triangle_strip.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040420,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_du",
        "plicate_restarts.triangle_strip.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040421,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_",
        "duplicate_restarts.triangle_strip.unsigned_int.draw_range_elements");
