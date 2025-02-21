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

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013019,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_8_float2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013020,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_float2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013021,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_8_float2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013022,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_float2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013023,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_12_float3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013024,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_float3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013025,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_12_float3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013026,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_float3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013027,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_16_float4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013028,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_float4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013029,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_16_float4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013030,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_float4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013031,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_4_short2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013032,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_short2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013033,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_4_short2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013034,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_short2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013035,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_6_short3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013036,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_short3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013037,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_6_short3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013038,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_short3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013039,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_8_short4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013040,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_short4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013041,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_8_short4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013042,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_short4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013043,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.strides.buffer_0_2_byte2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013044,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_17_byte2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013045,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_byte2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013046,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_2_byte2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013047,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_17_byte2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013048,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_byte2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013049,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.strides.buffer_0_3_byte3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013050,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_17_byte3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013051,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_byte3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013052,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_3_byte3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013053,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_17_byte3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013054,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_byte3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013055,
        "dEQP-GLES2.functional.vertex_arrays.single_attribut",
        "e.strides.buffer_0_4_byte4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013056,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_17_byte4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013057,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_byte4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013058,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_4_byte4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013059,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_17_byte4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013060,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_byte4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013061,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_8_fixed2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013062,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_fixed2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013063,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_8_fixed2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013064,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_fixed2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013065,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_12_fixed3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013066,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_fixed3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013067,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_12_fixed3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013068,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_fixed3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013069,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_16_fixed4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013070,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute",
        ".strides.buffer_0_32_fixed4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013071,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_16_fixed4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013072,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.",
        "strides.buffer_0_32_fixed4_vec4_dynamic_draw_quads_256");
