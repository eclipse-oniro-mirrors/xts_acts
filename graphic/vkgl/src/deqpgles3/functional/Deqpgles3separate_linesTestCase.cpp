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

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040611,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040612,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040613,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040614,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.basic_types.separate.lines.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040615,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040616,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040617,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.basic_types.separate.lines.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040618,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040619,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040620,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.basic_types.separate.lines.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040621,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040622,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040623,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.basic_types.separate.lines.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040624,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040625,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040626,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040627,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.lines.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040628,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040629,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040630,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.lines.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040631,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040632,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040633,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.lines.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040634,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040635,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.basic_types.separate.lines.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040636,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040637,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040638,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040639,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.lines.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040640,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040641,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040642,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.lines.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040643,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040644,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040645,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.lines.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040646,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040647,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.basic_types.separate.lines.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040648,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040649,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040650,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.basic_types.separate.lines.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040651,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040652,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.basic_types.separate.lines.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040653,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040654,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040655,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040656,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040657,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040658,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040659,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040660,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040661,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040662,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.basic_types.separate.lines.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040663,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040664,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040665,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040666,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040667,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040668,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040669,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040670,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040671,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040672,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.lines.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040673,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.lines.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040989,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040990,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040991,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040992,
        "dEQP-GLES3.functional.transform_fee",
        "dback.array.separate.lines.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040993,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040994,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040995,
        "dEQP-GLES3.functional.transform_fee",
        "dback.array.separate.lines.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040996,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040997,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040998,
        "dEQP-GLES3.functional.transform_fee",
        "dback.array.separate.lines.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040999,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041000,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041001,
        "dEQP-GLES3.functional.transform_fee",
        "dback.array.separate.lines.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041002,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041003,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041004,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041005,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.lines.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041006,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041007,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041008,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.lines.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041009,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041010,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041011,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.lines.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041012,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041013,
        "dEQP-GLES3.functional.transform_fee",
        "dback.array.separate.lines.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041014,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041015,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041016,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041017,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.lines.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041018,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041019,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041020,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.lines.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041021,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041022,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041023,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.lines.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041024,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041025,
        "dEQP-GLES3.functional.transform_fee",
        "dback.array.separate.lines.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041026,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041027,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041028,
        "dEQP-GLES3.functional.transform_fee",
        "dback.array.separate.lines.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041029,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041030,
        "dEQP-GLES3.functional.transform_fee",
        "dback.array.separate.lines.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041031,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041032,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041033,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041034,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041035,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041036,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041037,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041038,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041039,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041040,
        "dEQP-GLES3.functional.transform_fee",
        "dback.array.separate.lines.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041041,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041042,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041043,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041044,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041045,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041046,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041047,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041048,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041049,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041050,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.lines.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041051,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.lines.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041367,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041368,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041369,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041370,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array_element.separate.lines.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041371,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041372,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041373,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array_element.separate.lines.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041374,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041375,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041376,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array_element.separate.lines.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041377,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041378,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041379,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array_element.separate.lines.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041380,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041381,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041382,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041383,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.lines.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041384,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041385,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041386,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.lines.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041387,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041388,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041389,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.lines.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041390,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041391,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array_element.separate.lines.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041392,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041393,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041394,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041395,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.lines.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041396,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041397,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041398,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.lines.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041399,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041400,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041401,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.lines.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041402,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041403,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array_element.separate.lines.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041404,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041405,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041406,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array_element.separate.lines.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041407,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041408,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array_element.separate.lines.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041409,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041410,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041411,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041412,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041413,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041414,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041415,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041416,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041417,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041418,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array_element.separate.lines.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041419,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041420,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041421,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041422,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041423,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041424,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041425,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041426,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041427,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041428,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.lines.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041429,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.lines.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041746,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.lines.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041747,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.lines.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041748,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.lines.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041749,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.lines.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041750,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.lines.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041751,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.lines.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041752,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.lines.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041753,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.lines.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041754,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.lines.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041755,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.lines.10");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041806,
        "dEQP-GLES3.functional.transform_feedback.",
        "random_full_array_capture.separate.lines.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041807,
        "dEQP-GLES3.functional.transform_feedback.",
        "random_full_array_capture.separate.lines.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041808,
        "dEQP-GLES3.functional.transform_feedback.",
        "random_full_array_capture.separate.lines.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041809,
        "dEQP-GLES3.functional.transform_feedback.",
        "random_full_array_capture.separate.lines.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041810,
        "dEQP-GLES3.functional.transform_feedback.",
        "random_full_array_capture.separate.lines.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041811,
        "dEQP-GLES3.functional.transform_feedback.",
        "random_full_array_capture.separate.lines.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041812,
        "dEQP-GLES3.functional.transform_feedback.",
        "random_full_array_capture.separate.lines.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041813,
        "dEQP-GLES3.functional.transform_feedback.",
        "random_full_array_capture.separate.lines.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041814,
        "dEQP-GLES3.functional.transform_feedback.",
        "random_full_array_capture.separate.lines.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041815,
        "dEQP-GLES3.functional.transform_feedback.r",
        "andom_full_array_capture.separate.lines.10");
