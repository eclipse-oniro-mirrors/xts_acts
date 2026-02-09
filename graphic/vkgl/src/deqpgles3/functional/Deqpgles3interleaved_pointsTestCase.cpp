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

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040737,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040738,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040739,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040740,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.points.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040741,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040742,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040743,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.points.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040744,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040745,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040746,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.points.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040747,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040748,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040749,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.points.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040750,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040751,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040752,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040753,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.points.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040754,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040755,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040756,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.points.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040757,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040758,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040759,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.points.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040760,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040761,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.points.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040762,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040763,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040764,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040765,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.points.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040766,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040767,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040768,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.points.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040769,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040770,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040771,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.points.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040772,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040773,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.points.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040774,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040775,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040776,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.points.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040777,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040778,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.points.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040779,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040780,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040781,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040782,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040783,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040784,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040785,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040786,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040787,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040788,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.interleaved.points.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040789,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040790,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040791,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040792,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040793,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040794,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040795,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040796,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040797,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040798,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.points.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040799,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.points.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041115,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041116,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041117,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041118,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.points.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041119,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041120,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041121,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.points.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041122,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041123,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041124,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.points.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041125,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041126,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041127,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.points.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041128,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041129,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041130,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041131,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.points.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041132,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041133,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041134,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.points.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041135,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041136,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041137,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.points.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041138,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041139,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.points.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041140,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041141,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041142,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041143,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.points.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041144,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041145,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041146,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.points.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041147,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041148,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041149,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.points.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041150,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041151,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.points.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041152,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041153,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041154,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.points.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041155,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041156,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.points.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041157,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041158,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041159,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041160,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041161,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041162,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041163,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041164,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041165,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041166,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.interleaved.points.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041167,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041168,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041169,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041170,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041171,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041172,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041173,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041174,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041175,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041176,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.points.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041177,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.points.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041493,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041494,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041495,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041496,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.points.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041497,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041498,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041499,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.points.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041500,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041501,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041502,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.points.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041503,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041504,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041505,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.points.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041506,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041507,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041508,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041509,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.points.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041510,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041511,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041512,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.points.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041513,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041514,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041515,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.points.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041516,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041517,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.points.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041518,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041519,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041520,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041521,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.points.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041522,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041523,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041524,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.points.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041525,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041526,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041527,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.points.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041528,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041529,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.points.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041530,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041531,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041532,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.points.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041533,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041534,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.points.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041535,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041536,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041537,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041538,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041539,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041540,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041541,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041542,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041543,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041544,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.interleaved.points.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041545,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041546,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041547,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041548,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041549,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041550,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041551,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041552,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041553,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041554,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.points.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041555,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.points.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041766,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.interleaved.points.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041767,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.interleaved.points.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041768,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.interleaved.points.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041769,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.interleaved.points.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041770,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.interleaved.points.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041771,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.interleaved.points.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041772,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.interleaved.points.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041773,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.interleaved.points.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041774,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.interleaved.points.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041775,
        "dEQP-GLES3.functional.transform_fe",
        "edback.random.interleaved.points.10");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041826,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.points.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041827,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.points.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041828,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.points.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041829,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.points.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041830,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.points.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041831,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.points.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041832,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.points.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041833,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.points.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041834,
        "dEQP-GLES3.functional.transform_feedback.ra",
        "ndom_full_array_capture.interleaved.points.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041835,
        "dEQP-GLES3.functional.transform_feedback.ran",
        "dom_full_array_capture.interleaved.points.10");
