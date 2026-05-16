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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039975,
        "dEQP-GLES3.functional.primitive_restart.basi",
        "c.triangle_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039976,
        "dEQP-GLES3.functional.primitive_restart.basic.tri",
        "angle_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039977,
        "dEQP-GLES3.functional.primitive_restart.basic.t",
        "riangle_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040038,
        "dEQP-GLES3.functional.primitive_restart.duplicate_r",
        "estarts.triangle_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040039,
        "dEQP-GLES3.functional.primitive_restart.duplicate_restar",
        "ts.triangle_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040040,
        "dEQP-GLES3.functional.primitive_restart.duplicate_rest",
        "arts.triangle_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040101,
        "dEQP-GLES3.functional.primitive_restart.end_res",
        "tart.triangle_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040102,
        "dEQP-GLES3.functional.primitive_restart.end_restart.",
        "triangle_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040103,
        "dEQP-GLES3.functional.primitive_restart.end_restar",
        "t.triangle_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040164,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupli",
        "cate_restarts.triangle_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040165,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplicate_",
        "restarts.triangle_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040166,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplicat",
        "e_restarts.triangle_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040227,
        "dEQP-GLES3.functional.primitive_restart.begin_re",
        "start.triangle_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040228,
        "dEQP-GLES3.functional.primitive_restart.begin_restart",
        ".triangle_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040229,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt.triangle_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040290,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupl",
        "icate_restarts.triangle_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040291,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplicate",
        "_restarts.triangle_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040292,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplica",
        "te_restarts.triangle_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040353,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "end_restart.triangle_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040354,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_r",
        "estart.triangle_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040355,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end",
        "_restart.triangle_strip.unsigned_short.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040416,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restar",
        "t_duplicate_restarts.triangle_strip.unsigned_short.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040417,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_dup",
        "licate_restarts.triangle_strip.unsigned_short.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040418,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_d",
        "uplicate_restarts.triangle_strip.unsigned_short.draw_range_elements");
