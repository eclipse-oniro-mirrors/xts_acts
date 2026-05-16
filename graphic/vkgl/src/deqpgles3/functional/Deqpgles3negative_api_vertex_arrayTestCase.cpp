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
#include "../ActsDeqpgles30043TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042143,
        "dEQP-GLES3.functional.negative_",
        "api.vertex_array.vertex_attribf");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042144,
        "dEQP-GLES3.functional.negative_",
        "api.vertex_array.vertex_attribfv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042145,
        "dEQP-GLES3.functional.negative_",
        "api.vertex_array.vertex_attribi4");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042146,
        "dEQP-GLES3.functional.negative_a",
        "pi.vertex_array.vertex_attribi4v");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042147,
        "dEQP-GLES3.functional.negative_api",
        ".vertex_array.vertex_attrib_pointer");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042148,
        "dEQP-GLES3.functional.negative_api.",
        "vertex_array.vertex_attrib_i_pointer");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042149,
        "dEQP-GLES3.functional.negative_api.ve",
        "rtex_array.enable_vertex_attrib_array");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042150,
        "dEQP-GLES3.functional.negative_api.ve",
        "rtex_array.disable_vertex_attrib_array");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042151,
        "dEQP-GLES3.functional.negative_a",
        "pi.vertex_array.gen_vertex_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042152,
        "dEQP-GLES3.functional.negative_a",
        "pi.vertex_array.bind_vertex_array");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042153,
        "dEQP-GLES3.functional.negative_api",
        ".vertex_array.delete_vertex_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042154,
        "dEQP-GLES3.functional.negative_api",
        ".vertex_array.vertex_attrib_divisor");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042155,
        "dEQP-GLES3.functional.negativ",
        "e_api.vertex_array.draw_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042156,
        "dEQP-GLES3.functional.negative_api.ve",
        "rtex_array.draw_arrays_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042157,
        "dEQP-GLES3.functional.negative_api.verte",
        "x_array.draw_arrays_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042158,
        "dEQP-GLES3.functional.negative",
        "_api.vertex_array.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042159,
        "dEQP-GLES3.functional.negative_api.ver",
        "tex_array.draw_elements_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042160,
        "dEQP-GLES3.functional.negative_api.vertex",
        "_array.draw_elements_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042161,
        "dEQP-GLES3.functional.negative_api",
        ".vertex_array.draw_arrays_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042162,
        "dEQP-GLES3.functional.negative_api.vertex_",
        "array.draw_arrays_instanced_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042163,
        "dEQP-GLES3.functional.negative_api.vertex_arr",
        "ay.draw_arrays_instanced_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042164,
        "dEQP-GLES3.functional.negative_api.",
        "vertex_array.draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042165,
        "dEQP-GLES3.functional.negative_api.vertex_a",
        "rray.draw_elements_instanced_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042166,
        "dEQP-GLES3.functional.negative_api.vertex_arra",
        "y.draw_elements_instanced_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042167,
        "dEQP-GLES3.functional.negative_ap",
        "i.vertex_array.draw_range_elements");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042168,
        "dEQP-GLES3.functional.negative_api.vertex",
        "_array.draw_range_elements_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042169,
        "dEQP-GLES3.functional.negative_api.vertex_ar",
        "ray.draw_range_elements_incomplete_primitive");
