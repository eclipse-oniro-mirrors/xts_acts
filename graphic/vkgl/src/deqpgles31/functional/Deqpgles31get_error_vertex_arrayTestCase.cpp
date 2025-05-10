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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019603,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.vertex_array.vertex_attribf");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019604,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.vertex_array.vertex_attribfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019605,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.vertex_array.vertex_attribi4");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019606,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.vertex_array.vertex_attribi4v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019607,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.vertex_array.vertex_attrib_pointer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019608,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.vertex_array.vertex_attrib_i_pointer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019609,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.vertex_array.vertex_attrib_format");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019610,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.vertex_array.vertex_attrib_i_format");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019611,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.vertex_array.enable_vertex_attrib_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019612,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.vertex_array.disable_vertex_attrib_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019613,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.vertex_array.gen_vertex_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019614,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.vertex_array.bind_vertex_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019615,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.vertex_array.delete_vertex_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019616,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.vertex_array.vertex_attrib_divisor");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019617,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.vertex_array.draw_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019618,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.vertex_array.draw_arrays_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019619,
        "dEQP-GLES31.functional.debug.negative_coverage.get_",
        "error.vertex_array.draw_arrays_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019620,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.vertex_array.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019621,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.vertex_array.draw_elements_base_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019622,
        "dEQP-GLES31.functional.debug.negative_coverage.get_error.ve",
        "rtex_array.draw_elements_base_vertex_primitive_mode_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019623,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.vertex_array.draw_elements_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019624,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.vertex_array.draw_elements_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019625,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.vertex_array.draw_arrays_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019626,
        "dEQP-GLES31.functional.debug.negative_coverage.get_er",
        "ror.vertex_array.draw_arrays_instanced_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019627,
        "dEQP-GLES31.functional.debug.negative_coverage.get_error",
        ".vertex_array.draw_arrays_instanced_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019628,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.vertex_array.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019629,
        "dEQP-GLES31.functional.debug.negative_coverage.get_err",
        "or.vertex_array.draw_elements_instanced_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019630,
        "dEQP-GLES31.functional.debug.negative_coverage.get_error.",
        "vertex_array.draw_elements_instanced_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019631,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.vertex_array.draw_elements_instanced_base_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019632,
        "dEQP-GLES31.functional.debug.negative_coverage.get_error.vertex_",
        "array.draw_elements_instanced_base_vertex_primitive_mode_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019633,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.vertex_array.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019634,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.vertex_array.draw_range_elements_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019635,
        "dEQP-GLES31.functional.debug.negative_coverage.get_erro",
        "r.vertex_array.draw_range_elements_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019636,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.vertex_array.draw_range_elements_base_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019637,
        "dEQP-GLES31.functional.debug.negative_coverage.get_error.verte",
        "x_array.draw_range_elements_base_vertex_primitive_mode_mismatch");
