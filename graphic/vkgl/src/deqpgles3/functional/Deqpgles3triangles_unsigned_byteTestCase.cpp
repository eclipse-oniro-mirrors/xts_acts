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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039990,
        "dEQP-GLES3.functional.primitive_restart.b",
        "asic.triangles.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039991,
        "dEQP-GLES3.functional.primitive_restart.basic.",
        "triangles.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039992,
        "dEQP-GLES3.functional.primitive_restart.basi",
        "c.triangles.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040053,
        "dEQP-GLES3.functional.primitive_restart.duplicat",
        "e_restarts.triangles.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040054,
        "dEQP-GLES3.functional.primitive_restart.duplicate_res",
        "tarts.triangles.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040055,
        "dEQP-GLES3.functional.primitive_restart.duplicate_r",
        "estarts.triangles.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040116,
        "dEQP-GLES3.functional.primitive_restart.end_",
        "restart.triangles.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040117,
        "dEQP-GLES3.functional.primitive_restart.end_resta",
        "rt.triangles.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040118,
        "dEQP-GLES3.functional.primitive_restart.end_res",
        "tart.triangles.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040179,
        "dEQP-GLES3.functional.primitive_restart.end_restart_du",
        "plicate_restarts.triangles.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040180,
        "dEQP-GLES3.functional.primitive_restart.end_restart_duplica",
        "te_restarts.triangles.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040181,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupli",
        "cate_restarts.triangles.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040242,
        "dEQP-GLES3.functional.primitive_restart.begin",
        "_restart.triangles.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040243,
        "dEQP-GLES3.functional.primitive_restart.begin_rest",
        "art.triangles.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040244,
        "dEQP-GLES3.functional.primitive_restart.begin_re",
        "start.triangles.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040305,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_d",
        "uplicate_restarts.triangles.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040306,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_duplic",
        "ate_restarts.triangles.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040307,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dupl",
        "icate_restarts.triangles.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040368,
        "dEQP-GLES3.functional.primitive_restart.begin_resta",
        "rt_end_restart.triangles.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040369,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_en",
        "d_restart.triangles.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040370,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "end_restart.triangles.unsigned_byte.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040431,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_res",
        "tart_duplicate_restarts.triangles.unsigned_byte.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040432,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restart_",
        "duplicate_restarts.triangles.unsigned_byte.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040433,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_restar",
        "t_duplicate_restarts.triangles.unsigned_byte.draw_range_elements");
