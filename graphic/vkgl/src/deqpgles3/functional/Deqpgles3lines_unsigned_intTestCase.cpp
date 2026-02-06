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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039969,
        "dEQP-GLES3.functional.primitive_restart",
        ".basic.lines.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039970,
        "dEQP-GLES3.functional.primitive_restart.basi",
        "c.lines.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039971,
        "dEQP-GLES3.functional.primitive_restart.ba",
        "sic.lines.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040032,
        "dEQP-GLES3.functional.primitive_restart.dupli",
        "cate_restarts.lines.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040033,
        "dEQP-GLES3.functional.primitive_restart.duplicate_",
        "restarts.lines.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040034,
        "dEQP-GLES3.functional.primitive_restart.duplicat",
        "e_restarts.lines.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040095,
        "dEQP-GLES3.functional.primitive_restart.en",
        "d_restart.lines.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040096,
        "dEQP-GLES3.functional.primitive_restart.end_res",
        "tart.lines.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040097,
        "dEQP-GLES3.functional.primitive_restart.end_r",
        "estart.lines.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040158,
        "dEQP-GLES3.functional.primitive_restart.end_restart",
        "_duplicate_restarts.lines.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040159,
        "dEQP-GLES3.functional.primitive_restart.end_restart_dupl",
        "icate_restarts.lines.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040160,
        "dEQP-GLES3.functional.primitive_restart.end_restart_du",
        "plicate_restarts.lines.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040221,
        "dEQP-GLES3.functional.primitive_restart.beg",
        "in_restart.lines.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040222,
        "dEQP-GLES3.functional.primitive_restart.begin_re",
        "start.lines.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040223,
        "dEQP-GLES3.functional.primitive_restart.begin_",
        "restart.lines.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040284,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t_duplicate_restarts.lines.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040285,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_dup",
        "licate_restarts.lines.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040286,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_d",
        "uplicate_restarts.lines.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040347,
        "dEQP-GLES3.functional.primitive_restart.begin_res",
        "tart_end_restart.lines.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040348,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_",
        "end_restart.lines.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040349,
        "dEQP-GLES3.functional.primitive_restart.begin_restar",
        "t_end_restart.lines.unsigned_int.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040410,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_",
        "restart_duplicate_restarts.lines.unsigned_int.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040411,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_resta",
        "rt_duplicate_restarts.lines.unsigned_int.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_040412,
        "dEQP-GLES3.functional.primitive_restart.begin_restart_end_res",
        "tart_duplicate_restarts.lines.unsigned_int.draw_range_elements");
