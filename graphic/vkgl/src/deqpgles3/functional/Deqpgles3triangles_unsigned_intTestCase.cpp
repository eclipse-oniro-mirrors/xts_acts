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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039996,
        "dEQP-GLES3.functional.primitive_restart.b",
        "asic.triangles.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039997,
        "dEQP-GLES3.functional.primitive_restart.basic.",
        "triangles.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039998,
        "dEQP-GLES3.functional.primitive_restart.basi",
        "c.triangles.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040059,
        "dEQP-GLES3.functional.primitive_restart.duplica",
        "te_restarts.triangles.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040060,
        "dEQP-GLES3.functional.primitive_restart.duplicate_re",
        "starts.triangles.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040061,
        "dEQP-GLES3.functional.primitive_restart.duplicate_",
        "restarts.triangles.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040122,
        "dEQP-GLES3.functional.primitive_restart.end_",
        "restart.triangles.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040123,
        "dEQP-GLES3.functional.primitive_restart.end_resta",
        "rt.triangles.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040124,
        "dEQP-GLES3.functional.primitive_restart.end_res",
        "tart.triangles.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040185,
        "dEQP-GLES3.functional.primitive_restart.end_restart_d",
        "uplicate_restarts.triangles.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040186,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplic",
        "ate_restarts.triangles.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040187,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupl",
        "icate_restarts.triangles.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040248,
        "dEQP-GLES3.functional.primitive_restart.begin",
        "_restart.triangles.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040249,
        "dEQP-GLES3.functional.primitive_restart.begin_rest",
        "art.triangles.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040250,
        "dEQP-GLES3.functional.primitive_restart.begin_re",
        "start.triangles.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040311,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "duplicate_restarts.triangles.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040312,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupli",
        "cate_restarts.triangles.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040313,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dup",
        "licate_restarts.triangles.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040374,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt_end_restart.triangles.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040375,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_en",
        "d_restart.triangles.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040376,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "end_restart.triangles.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040437,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_re",
        "start_duplicate_restarts.triangles.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040438,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart",
        "_duplicate_restarts.triangles.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040439,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_resta",
        "rt_duplicate_restarts.triangles.unsigned_int.draw_range_elements");
