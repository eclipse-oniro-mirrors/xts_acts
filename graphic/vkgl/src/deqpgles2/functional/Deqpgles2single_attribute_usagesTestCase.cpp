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

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013217,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_float2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013218,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_float2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013219,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_float2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013220,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_8_float2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013221,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_8_float2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013222,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_8_float2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013223,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_32_float2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013224,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_32_float2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013225,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_float2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013226,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_0_float2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013227,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_0_float2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013228,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_0_float2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013229,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_8_float2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013230,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_8_float2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013231,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_8_float2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013232,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_float2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013233,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_float2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013234,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "usages.buffer_0_32_float2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013235,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_fixed2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013236,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_fixed2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013237,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_fixed2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013238,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_8_fixed2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013239,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_8_fixed2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013240,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_8_fixed2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013241,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_32_fixed2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013242,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_32_fixed2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013243,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_fixed2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013244,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_0_fixed2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013245,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_0_fixed2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013246,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_0_fixed2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013247,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_8_fixed2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013248,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_8_fixed2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013249,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_8_fixed2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013250,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_fixed2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013251,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_fixed2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013252,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "usages.buffer_0_32_fixed2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013253,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_short2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013254,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_short2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013255,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_short2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013256,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_4_short2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013257,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_4_short2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013258,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_4_short2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013259,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_32_short2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013260,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_32_short2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013261,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_short2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013262,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_0_short2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013263,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_0_short2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013264,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_0_short2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013265,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_4_short2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013266,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_4_short2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013267,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_4_short2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013268,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_short2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013269,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_short2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013270,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "usages.buffer_0_32_short2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013271,
        "dEQP-GLES2.functional.vertex_arrays.single_attribu",
        "te.usages.buffer_0_0_byte2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013272,
        "dEQP-GLES2.functional.vertex_arrays.single_attribu",
        "te.usages.buffer_0_0_byte2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013273,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013274,
        "dEQP-GLES2.functional.vertex_arrays.single_attribu",
        "te.usages.buffer_0_2_byte2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013275,
        "dEQP-GLES2.functional.vertex_arrays.single_attribu",
        "te.usages.buffer_0_2_byte2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013276,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_2_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013277,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_17_byte2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013278,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_17_byte2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013279,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_17_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013280,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_32_byte2_vec2_static_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013281,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_32_byte2_vec2_stream_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013282,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_32_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013283,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_byte2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013284,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_0_byte2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013285,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_0_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013286,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_2_byte2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013287,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.usages.buffer_0_2_byte2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013288,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_2_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013289,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_17_byte2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013290,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_17_byte2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013291,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_17_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013292,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_byte2_vec2_static_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013293,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_byte2_vec2_stream_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013294,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".usages.buffer_0_32_byte2_vec2_dynamic_draw_quads_256");
