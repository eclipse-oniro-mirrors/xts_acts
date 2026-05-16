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

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040800,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040801,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040802,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040803,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040804,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040805,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040806,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040807,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040808,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040809,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040810,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040811,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040812,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040813,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040814,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040815,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040816,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040817,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040818,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040819,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040820,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040821,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040822,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040823,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040824,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040825,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040826,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040827,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040828,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040829,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040830,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040831,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040832,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040833,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040834,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040835,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040836,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040837,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040838,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040839,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.interleaved.lines.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040840,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040841,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040842,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040843,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040844,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040845,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040846,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040847,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040848,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040849,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040850,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040851,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040852,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040853,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040854,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040855,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040856,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040857,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040858,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040859,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040860,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.lines.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040861,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.lines.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040862,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.lines.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041178,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041179,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041180,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041181,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041182,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041183,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041184,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041185,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041186,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041187,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041188,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041189,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041190,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041191,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041192,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041193,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041194,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041195,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041196,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041197,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041198,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041199,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041200,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041201,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041202,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041203,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041204,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041205,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041206,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041207,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041208,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041209,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041210,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041211,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041212,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041213,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041214,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041215,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041216,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041217,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.interleaved.lines.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041218,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041219,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041220,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041221,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041222,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041223,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041224,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041225,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041226,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041227,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041228,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041229,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041230,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041231,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041232,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041233,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041234,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041235,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041236,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041237,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041238,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.lines.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041239,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.lines.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041240,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.lines.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041556,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041557,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041558,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041559,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041560,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041561,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041562,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041563,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041564,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041565,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041566,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041567,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041568,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041569,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041570,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041571,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041572,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041573,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041574,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041575,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041576,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041577,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041578,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041579,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041580,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041581,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041582,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041583,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041584,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041585,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041586,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041587,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041588,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041589,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041590,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041591,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041592,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041593,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041594,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041595,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.interleaved.lines.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041596,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041597,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041598,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041599,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041600,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041601,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041602,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041603,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041604,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041605,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041606,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041607,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041608,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041609,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041610,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041611,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041612,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041613,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041614,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041615,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041616,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.lines.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041617,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.lines.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041618,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.lines.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041776,
        "dEQP-GLES3.functional.transform_f",
        "eedback.random.interleaved.lines.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041777,
        "dEQP-GLES3.functional.transform_f",
        "eedback.random.interleaved.lines.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041778,
        "dEQP-GLES3.functional.transform_f",
        "eedback.random.interleaved.lines.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041779,
        "dEQP-GLES3.functional.transform_f",
        "eedback.random.interleaved.lines.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041780,
        "dEQP-GLES3.functional.transform_f",
        "eedback.random.interleaved.lines.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041781,
        "dEQP-GLES3.functional.transform_f",
        "eedback.random.interleaved.lines.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041782,
        "dEQP-GLES3.functional.transform_f",
        "eedback.random.interleaved.lines.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041783,
        "dEQP-GLES3.functional.transform_f",
        "eedback.random.interleaved.lines.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041784,
        "dEQP-GLES3.functional.transform_f",
        "eedback.random.interleaved.lines.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041785,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.interleaved.lines.10");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041836,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.lines.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041837,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.lines.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041838,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.lines.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041839,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.lines.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041840,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.lines.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041841,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.lines.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041842,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.lines.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041843,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.lines.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041844,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.lines.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041845,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.lines.10");
