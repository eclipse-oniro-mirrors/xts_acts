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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018608,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.vertex_array.vertex_attribf");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018609,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.vertex_array.vertex_attribfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018610,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.vertex_array.vertex_attribi4");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018611,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.vertex_array.vertex_attribi4v");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018612,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.vertex_array.vertex_attrib_pointer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018613,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.vertex_array.vertex_attrib_i_pointer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018614,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.vertex_array.vertex_attrib_format");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018615,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.vertex_array.vertex_attrib_i_format");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018616,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.vertex_array.enable_vertex_attrib_array");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018617,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.vertex_array.disable_vertex_attrib_array");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018618,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.vertex_array.gen_vertex_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018619,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.vertex_array.bind_vertex_array");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018620,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.vertex_array.delete_vertex_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018621,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.vertex_array.vertex_attrib_divisor");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018622,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.vertex_array.draw_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018623,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.vertex_array.draw_arrays_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018624,
        "dEQP-GLES31.functional.debug.negative_coverage.call",
        "backs.vertex_array.draw_arrays_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018625,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.vertex_array.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018626,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.vertex_array.draw_elements_base_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018627,
        "dEQP-GLES31.functional.debug.negative_coverage.callbacks.ve",
        "rtex_array.draw_elements_base_vertex_primitive_mode_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018628,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.vertex_array.draw_elements_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018629,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.vertex_array.draw_elements_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018630,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.vertex_array.draw_arrays_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018631,
        "dEQP-GLES31.functional.debug.negative_coverage.callba",
        "cks.vertex_array.draw_arrays_instanced_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018632,
        "dEQP-GLES31.functional.debug.negative_coverage.callbacks",
        ".vertex_array.draw_arrays_instanced_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018633,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.vertex_array.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018634,
        "dEQP-GLES31.functional.debug.negative_coverage.callbac",
        "ks.vertex_array.draw_elements_instanced_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018635,
        "dEQP-GLES31.functional.debug.negative_coverage.callbacks.",
        "vertex_array.draw_elements_instanced_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018636,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.vertex_array.draw_elements_instanced_base_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018637,
        "dEQP-GLES31.functional.debug.negative_coverage.callbacks.vertex_",
        "array.draw_elements_instanced_base_vertex_primitive_mode_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018638,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.vertex_array.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018639,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.vertex_array.draw_range_elements_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018640,
        "dEQP-GLES31.functional.debug.negative_coverage.callback",
        "s.vertex_array.draw_range_elements_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018641,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.vertex_array.draw_range_elements_base_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018642,
        "dEQP-GLES31.functional.debug.negative_coverage.callbacks.verte",
        "x_array.draw_range_elements_base_vertex_primitive_mode_mismatch");
