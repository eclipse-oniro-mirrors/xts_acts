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

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013073,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_float2_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013074,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_float2_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013075,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_float3_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013076,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_float3_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013077,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_float4_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013078,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_float4_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013079,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_short2_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013080,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_short2_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013081,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_short3_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013082,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_short3_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013083,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_short4_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013084,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_short4_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013085,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_byte2_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013086,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_byte2_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013087,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_byte3_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013088,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_byte3_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013089,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_byte4_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013090,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_byte4_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013091,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.u",
        "ser_ptr_0_0_unsigned_short2_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013092,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.us",
        "er_ptr_0_0_unsigned_short2_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013093,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.u",
        "ser_ptr_0_0_unsigned_short3_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013094,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.us",
        "er_ptr_0_0_unsigned_short3_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013095,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.u",
        "ser_ptr_0_0_unsigned_short4_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013096,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.us",
        "er_ptr_0_0_unsigned_short4_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013097,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.",
        "user_ptr_0_0_unsigned_byte2_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013098,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.u",
        "ser_ptr_0_0_unsigned_byte2_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013099,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.",
        "user_ptr_0_0_unsigned_byte3_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013100,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.u",
        "ser_ptr_0_0_unsigned_byte3_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013101,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.",
        "user_ptr_0_0_unsigned_byte4_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013102,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normalize.u",
        "ser_ptr_0_0_unsigned_byte4_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013103,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_fixed2_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013104,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_fixed2_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013105,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_fixed3_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013106,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_fixed3_normalized_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013107,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normal",
        "ize.user_ptr_0_0_fixed4_normalized_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013108,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.normali",
        "ze.user_ptr_0_0_fixed4_normalized_vec4_dynamic_draw_quads_256");
