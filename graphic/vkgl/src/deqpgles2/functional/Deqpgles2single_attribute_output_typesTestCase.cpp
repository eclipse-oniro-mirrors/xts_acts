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

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013109,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_float2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013110,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_float2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013111,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_float3_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013112,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_float3_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013113,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_float4_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013114,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_float4_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013115,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_float2_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013116,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_float2_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013117,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_float3_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013118,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_float3_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013119,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_float4_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013120,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_float4_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013121,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_float2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013122,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_float2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013123,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_float3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013124,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_float3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013125,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_float4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013126,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_float4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013127,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_short2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013128,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_short2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013129,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_short3_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013130,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_short3_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013131,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_short4_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013132,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_short4_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013133,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_short2_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013134,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_short2_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013135,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_short3_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013136,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_short3_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013137,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_short4_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013138,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_short4_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013139,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_short2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013140,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_short2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013141,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_short3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013142,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_short3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013143,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_short4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013144,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_short4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013145,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013146,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013147,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_byte3_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013148,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_byte3_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013149,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_byte4_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013150,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_byte4_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013151,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_byte2_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013152,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_byte2_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013153,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_byte3_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013154,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_byte3_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013155,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_byte4_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013156,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_byte4_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013157,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_byte2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013158,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_byte2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013159,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_byte3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013160,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_byte3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013161,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_byte4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013162,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_byte4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013163,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_short2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013164,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t",
        "ypes.user_ptr_0_0_unsigned_short2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013165,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_short3_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013166,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t",
        "ypes.user_ptr_0_0_unsigned_short3_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013167,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_short4_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013168,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t",
        "ypes.user_ptr_0_0_unsigned_short4_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013169,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_short2_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013170,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t",
        "ypes.user_ptr_0_0_unsigned_short2_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013171,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_short3_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013172,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t",
        "ypes.user_ptr_0_0_unsigned_short3_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013173,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_short4_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013174,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t",
        "ypes.user_ptr_0_0_unsigned_short4_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013175,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_short2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013176,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t",
        "ypes.user_ptr_0_0_unsigned_short2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013177,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_short3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013178,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t",
        "ypes.user_ptr_0_0_unsigned_short3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013179,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_short4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013180,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t",
        "ypes.user_ptr_0_0_unsigned_short4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013181,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output",
        "_types.user_ptr_0_0_unsigned_byte2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013182,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_byte2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013183,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output",
        "_types.user_ptr_0_0_unsigned_byte3_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013184,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_byte3_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013185,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output",
        "_types.user_ptr_0_0_unsigned_byte4_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013186,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_byte4_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013187,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output",
        "_types.user_ptr_0_0_unsigned_byte2_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013188,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_byte2_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013189,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output",
        "_types.user_ptr_0_0_unsigned_byte3_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013190,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_byte3_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013191,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output",
        "_types.user_ptr_0_0_unsigned_byte4_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013192,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_byte4_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013193,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output",
        "_types.user_ptr_0_0_unsigned_byte2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013194,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_byte2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013195,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output",
        "_types.user_ptr_0_0_unsigned_byte3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013196,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_byte3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013197,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output",
        "_types.user_ptr_0_0_unsigned_byte4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013198,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_",
        "types.user_ptr_0_0_unsigned_byte4_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013199,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_fixed2_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013200,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_fixed2_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013201,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_fixed3_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013202,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_fixed3_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013203,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_fixed4_vec2_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013204,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_fixed4_vec2_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013205,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_fixed2_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013206,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_fixed2_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013207,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_fixed3_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013208,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_fixed3_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013209,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_fixed4_vec3_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013210,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_fixed4_vec3_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013211,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_fixed2_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013212,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_fixed2_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013213,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_fixed3_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013214,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_fixed3_vec4_dynamic_draw_quads_256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013215,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou",
        "tput_types.user_ptr_0_0_fixed4_vec4_dynamic_draw_quads_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013216,
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out",
        "put_types.user_ptr_0_0_fixed4_vec4_dynamic_draw_quads_256");
