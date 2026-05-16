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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013295,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.offset.buffer_4_8_float2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013296,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_4_32_float2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013297,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_4_8_float2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013298,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "offset.buffer_4_32_float2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013299,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_32_8_float2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013300,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_32_32_float2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013301,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "offset.buffer_32_8_float2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013302,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "offset.buffer_32_32_float2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013303,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.offset.buffer_1_2_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013304,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.offset.buffer_1_17_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013305,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.offset.buffer_1_32_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013306,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_1_2_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013307,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_1_17_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013308,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_1_32_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013309,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.offset.buffer_4_2_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013310,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.offset.buffer_4_17_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013311,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.offset.buffer_4_32_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013312,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_4_2_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013313,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_4_17_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013314,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_4_32_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013315,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.offset.buffer_17_2_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013316,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_17_17_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013317,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_17_32_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013318,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_17_2_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013319,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "offset.buffer_17_17_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013320,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "offset.buffer_17_32_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013321,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.offset.buffer_32_2_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013322,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_32_17_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013323,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_32_32_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013324,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_32_2_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013325,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "offset.buffer_32_17_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013326,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "offset.buffer_32_32_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013327,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.offset.buffer_4_8_fixed2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013328,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_4_32_fixed2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013329,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_4_8_fixed2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013330,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "offset.buffer_4_32_fixed2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013331,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_32_8_fixed2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013332,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".offset.buffer_32_32_fixed2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013333,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "offset.buffer_32_8_fixed2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013334,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "offset.buffer_32_32_fixed2_vec2_dynamic_draw_quads_256");
