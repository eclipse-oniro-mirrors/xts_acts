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
#include "../ActsDeqpgles30041TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040674,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040675,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040676,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040677,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.triangles.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040678,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040679,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040680,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.triangles.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040681,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040682,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040683,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.triangles.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040684,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040685,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040686,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.triangles.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040687,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040688,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040689,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040690,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.separate.triangles.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040691,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040692,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040693,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.separate.triangles.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040694,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040695,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040696,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.separate.triangles.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040697,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040698,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.triangles.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040699,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040700,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040701,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040702,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.separate.triangles.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040703,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040704,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040705,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.separate.triangles.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040706,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040707,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040708,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.separate.triangles.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040709,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040710,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.triangles.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040711,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040712,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040713,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.triangles.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040714,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040715,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.triangles.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040716,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040717,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040718,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040719,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040720,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040721,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040722,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040723,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040724,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040725,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.triangles.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040726,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040727,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040728,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040729,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040730,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040731,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040732,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040733,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040734,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040735,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.separate.triangles.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040736,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.triangles.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041052,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041053,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041054,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041055,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.triangles.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041056,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041057,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041058,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.triangles.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041059,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041060,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041061,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.triangles.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041062,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041063,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041064,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.triangles.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041065,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041066,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041067,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041068,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.separate.triangles.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041069,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041070,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041071,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.separate.triangles.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041072,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041073,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041074,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.separate.triangles.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041075,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041076,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.triangles.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041077,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041078,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041079,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041080,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.separate.triangles.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041081,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041082,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041083,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.separate.triangles.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041084,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041085,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041086,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.separate.triangles.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041087,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041088,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.triangles.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041089,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041090,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041091,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.triangles.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041092,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041093,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.triangles.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041094,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041095,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041096,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041097,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041098,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041099,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041100,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041101,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041102,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041103,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.triangles.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041104,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041105,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041106,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041107,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041108,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041109,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041110,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041111,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041112,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041113,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.separate.triangles.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041114,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.triangles.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041430,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041431,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041432,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041433,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.triangles.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041434,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041435,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041436,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.triangles.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041437,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041438,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041439,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.triangles.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041440,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041441,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041442,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.triangles.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041443,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041444,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041445,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041446,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.separate.triangles.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041447,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041448,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041449,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.separate.triangles.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041450,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041451,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041452,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.separate.triangles.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041453,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041454,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.triangles.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041455,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041456,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041457,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041458,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.separate.triangles.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041459,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041460,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041461,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.separate.triangles.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041462,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041463,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041464,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.separate.triangles.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041465,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041466,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.triangles.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041467,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041468,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041469,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.triangles.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041470,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041471,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.triangles.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041472,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041473,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041474,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041475,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041476,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041477,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041478,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041479,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041480,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041481,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.triangles.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041482,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041483,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041484,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041485,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041486,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041487,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041488,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041489,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041490,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041491,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.separate.triangles.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041492,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.triangles.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041756,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.separate.triangles.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041757,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.separate.triangles.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041758,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.separate.triangles.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041759,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.separate.triangles.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041760,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.separate.triangles.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041761,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.separate.triangles.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041762,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.separate.triangles.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041763,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.separate.triangles.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041764,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.separate.triangles.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041765,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.separate.triangles.10");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041816,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.separate.triangles.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041817,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.separate.triangles.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041818,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.separate.triangles.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041819,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.separate.triangles.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041820,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.separate.triangles.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041821,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.separate.triangles.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041822,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.separate.triangles.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041823,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.separate.triangles.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041824,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.separate.triangles.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041825,
        "dEQP-GLES3.functional.transform_feedback.ran",
        "dom_full_array_capture.separate.triangles.10");
