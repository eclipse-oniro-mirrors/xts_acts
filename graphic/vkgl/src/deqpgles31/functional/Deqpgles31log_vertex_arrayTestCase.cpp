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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019106,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.vertex_array.vertex_attribf");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019107,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.vertex_array.vertex_attribfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019108,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.vertex_array.vertex_attribi4");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019109,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.vertex_array.vertex_attribi4v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019110,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.vertex_array.vertex_attrib_pointer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019111,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.vertex_array.vertex_attrib_i_pointer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019112,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.vertex_array.vertex_attrib_format");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019113,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.vertex_array.vertex_attrib_i_format");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019114,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.vertex_array.enable_vertex_attrib_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019115,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.vertex_array.disable_vertex_attrib_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019116,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.vertex_array.gen_vertex_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019117,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.vertex_array.bind_vertex_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019118,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.vertex_array.delete_vertex_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019119,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.vertex_array.vertex_attrib_divisor");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019120,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.vertex_array.draw_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019121,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.vertex_array.draw_arrays_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019122,
        "dEQP-GLES31.functional.debug.negative_coverage.l",
        "og.vertex_array.draw_arrays_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019123,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.vertex_array.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019124,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.vertex_array.draw_elements_base_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019125,
        "dEQP-GLES31.functional.debug.negative_coverage.log.verte",
        "x_array.draw_elements_base_vertex_primitive_mode_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019126,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.vertex_array.draw_elements_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019127,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.vertex_array.draw_elements_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019128,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.vertex_array.draw_arrays_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019129,
        "dEQP-GLES31.functional.debug.negative_coverage.log",
        ".vertex_array.draw_arrays_instanced_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019130,
        "dEQP-GLES31.functional.debug.negative_coverage.log.ve",
        "rtex_array.draw_arrays_instanced_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019131,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.vertex_array.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019132,
        "dEQP-GLES31.functional.debug.negative_coverage.log.",
        "vertex_array.draw_elements_instanced_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019133,
        "dEQP-GLES31.functional.debug.negative_coverage.log.ver",
        "tex_array.draw_elements_instanced_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019134,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.vertex_array.draw_elements_instanced_base_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019135,
        "dEQP-GLES31.functional.debug.negative_coverage.log.vertex_arr",
        "ay.draw_elements_instanced_base_vertex_primitive_mode_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019136,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.vertex_array.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019137,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.vertex_array.draw_range_elements_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019138,
        "dEQP-GLES31.functional.debug.negative_coverage.log.v",
        "ertex_array.draw_range_elements_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019139,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.vertex_array.draw_range_elements_base_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019140,
        "dEQP-GLES31.functional.debug.negative_coverage.log.vertex_a",
        "rray.draw_range_elements_base_vertex_primitive_mode_mismatch");
