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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039981,
        "dEQP-GLES3.functional.primitive_restart.bas",
        "ic.triangle_fan.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039982,
        "dEQP-GLES3.functional.primitive_restart.basic.tr",
        "iangle_fan.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039983,
        "dEQP-GLES3.functional.primitive_restart.basic.",
        "triangle_fan.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040044,
        "dEQP-GLES3.functional.primitive_restart.duplicate",
        "_restarts.triangle_fan.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040045,
        "dEQP-GLES3.functional.primitive_restart.duplicate_rest",
        "arts.triangle_fan.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040046,
        "dEQP-GLES3.functional.primitive_restart.duplicate_re",
        "starts.triangle_fan.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040107,
        "dEQP-GLES3.functional.primitive_restart.end_re",
        "start.triangle_fan.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040108,
        "dEQP-GLES3.functional.primitive_restart.end_restart",
        ".triangle_fan.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040109,
        "dEQP-GLES3.functional.primitive_restart.end_resta",
        "rt.triangle_fan.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040170,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dup",
        "licate_restarts.triangle_fan.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040171,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplicat",
        "e_restarts.triangle_fan.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040172,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplic",
        "ate_restarts.triangle_fan.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040233,
        "dEQP-GLES3.functional.primitive_restart.begin_r",
        "estart.triangle_fan.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040234,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t.triangle_fan.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040235,
        "dEQP-GLES3.functional.primitive_restart.begin_rest",
        "art.triangle_fan.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040296,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_du",
        "plicate_restarts.triangle_fan.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040297,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplica",
        "te_restarts.triangle_fan.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040298,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupli",
        "cate_restarts.triangle_fan.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040359,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        "_end_restart.triangle_fan.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040360,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_",
        "restart.triangle_fan.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040361,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_en",
        "d_restart.triangle_fan.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040422,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_rest",
        "art_duplicate_restarts.triangle_fan.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040423,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_d",
        "uplicate_restarts.triangle_fan.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040424,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart",
        "_duplicate_restarts.triangle_fan.unsigned_byte.draw_range_elements");
