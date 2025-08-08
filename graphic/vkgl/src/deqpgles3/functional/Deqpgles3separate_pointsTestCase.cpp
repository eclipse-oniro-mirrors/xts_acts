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

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040548,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040549,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040550,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040551,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040552,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040553,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040554,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040555,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040556,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040557,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040558,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040559,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040560,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040561,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040562,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040563,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040564,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040565,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040566,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040567,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040568,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040569,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040570,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040571,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040572,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040573,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040574,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040575,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040576,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040577,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040578,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040579,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040580,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040581,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040582,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040583,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040584,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040585,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040586,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040587,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.basic_types.separate.points.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040588,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040589,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040590,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040591,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040592,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040593,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040594,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040595,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040596,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040597,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040598,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040599,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040600,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040601,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040602,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040603,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040604,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040605,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040606,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040607,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040608,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.basic_types.separate.points.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040609,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.separate.points.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040610,
        "dEQP-GLES3.functional.transform_feedback",
        ".basic_types.separate.points.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040926,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040927,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040928,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040929,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040930,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040931,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040932,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040933,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040934,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040935,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040936,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040937,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040938,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040939,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040940,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040941,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040942,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040943,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040944,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040945,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040946,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040947,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040948,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040949,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040950,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040951,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040952,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040953,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040954,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040955,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040956,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040957,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040958,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040959,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040960,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040961,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040962,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040963,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040964,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040965,
        "dEQP-GLES3.functional.transform_fee",
        "dback.array.separate.points.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040966,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040967,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040968,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040969,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040970,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040971,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040972,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040973,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040974,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040975,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040976,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040977,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040978,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040979,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040980,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040981,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040982,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040983,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040984,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040985,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040986,
        "dEQP-GLES3.functional.transform_feed",
        "back.array.separate.points.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040987,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.separate.points.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040988,
        "dEQP-GLES3.functional.transform_feedb",
        "ack.array.separate.points.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041304,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041305,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041306,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041307,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041308,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041309,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041310,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041311,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041312,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041313,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041314,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041315,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041316,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041317,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041318,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041319,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041320,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041321,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041322,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041323,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041324,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041325,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041326,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041327,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041328,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041329,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041330,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041331,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041332,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041333,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041334,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041335,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041336,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041337,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041338,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041339,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041340,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041341,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041342,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041343,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array_element.separate.points.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041344,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041345,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041346,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041347,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041348,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041349,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041350,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041351,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041352,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041353,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041354,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041355,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041356,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041357,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041358,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041359,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041360,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041361,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041362,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041363,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041364,
        "dEQP-GLES3.functional.transform_feedback",
        ".array_element.separate.points.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041365,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.separate.points.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041366,
        "dEQP-GLES3.functional.transform_feedback.",
        "array_element.separate.points.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041736,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.points.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041737,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.points.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041738,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.points.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041739,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.points.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041740,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.points.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041741,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.points.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041742,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.points.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041743,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.points.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041744,
        "dEQP-GLES3.functional.transform_",
        "feedback.random.separate.points.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041745,
        "dEQP-GLES3.functional.transform_f",
        "eedback.random.separate.points.10");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041796,
        "dEQP-GLES3.functional.transform_feedback.r",
        "andom_full_array_capture.separate.points.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041797,
        "dEQP-GLES3.functional.transform_feedback.r",
        "andom_full_array_capture.separate.points.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041798,
        "dEQP-GLES3.functional.transform_feedback.r",
        "andom_full_array_capture.separate.points.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041799,
        "dEQP-GLES3.functional.transform_feedback.r",
        "andom_full_array_capture.separate.points.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041800,
        "dEQP-GLES3.functional.transform_feedback.r",
        "andom_full_array_capture.separate.points.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041801,
        "dEQP-GLES3.functional.transform_feedback.r",
        "andom_full_array_capture.separate.points.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041802,
        "dEQP-GLES3.functional.transform_feedback.r",
        "andom_full_array_capture.separate.points.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041803,
        "dEQP-GLES3.functional.transform_feedback.r",
        "andom_full_array_capture.separate.points.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041804,
        "dEQP-GLES3.functional.transform_feedback.r",
        "andom_full_array_capture.separate.points.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041805,
        "dEQP-GLES3.functional.transform_feedback.r",
        "andom_full_array_capture.separate.points.10");
