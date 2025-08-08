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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016472,
        "dEQP-GLES31.functional.geometry_shading.verte",
        "x_transform_feedback.capture_vertex_line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016473,
        "dEQP-GLES31.functional.geometry_shading.verte",
        "x_transform_feedback.capture_vertex_line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016474,
        "dEQP-GLES31.functional.geometry_shading.vertex_",
        "transform_feedback.capture_vertex_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016475,
        "dEQP-GLES31.functional.geometry_shading.vertex",
        "_transform_feedback.capture_vertex_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016476,
        "dEQP-GLES31.functional.geometry_shading.vertex",
        "_transform_feedback.capture_vertex_draw_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016477,
        "dEQP-GLES31.functional.geometry_shading.vertex_tran",
        "sform_feedback.capture_vertex_draw_arrays_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016478,
        "dEQP-GLES31.functional.geometry_shading.vertex_tra",
        "nsform_feedback.capture_vertex_draw_arrays_indirect");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016479,
        "dEQP-GLES31.functional.geometry_shading.vertex_",
        "transform_feedback.capture_vertex_draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016480,
        "dEQP-GLES31.functional.geometry_shading.vertex_trans",
        "form_feedback.capture_vertex_draw_elements_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016481,
        "dEQP-GLES31.functional.geometry_shading.vertex_tran",
        "sform_feedback.capture_vertex_draw_elements_indirect");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016482,
        "dEQP-GLES31.functional.geometry_shading.vertex_transform_",
        "feedback.capture_vertex_draw_arrays_overflow_single_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016483,
        "dEQP-GLES31.functional.geometry_shading.vertex_transform_f",
        "eedback.capture_vertex_draw_elements_overflow_single_buffer");
