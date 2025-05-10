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

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040863,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040864,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040865,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040866,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040867,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040868,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040869,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040870,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040871,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040872,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040873,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040874,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040875,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040876,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040877,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040878,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040879,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040880,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040881,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040882,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040883,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040884,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040885,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040886,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040887,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040888,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040889,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040890,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040891,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040892,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040893,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040894,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040895,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040896,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040897,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040898,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040899,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040900,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040901,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040902,
        "dEQP-GLES3.functional.transform_feedback.",
        "basic_types.interleaved.triangles.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040903,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040904,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040905,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040906,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040907,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040908,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040909,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040910,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040911,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040912,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040913,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040914,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040915,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040916,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040917,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040918,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040919,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040920,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040921,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040922,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040923,
        "dEQP-GLES3.functional.transform_feedback.b",
        "asic_types.interleaved.triangles.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040924,
        "dEQP-GLES3.functional.transform_feedback.bas",
        "ic_types.interleaved.triangles.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040925,
        "dEQP-GLES3.functional.transform_feedback.ba",
        "sic_types.interleaved.triangles.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041241,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041242,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041243,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041244,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041245,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041246,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041247,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041248,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041249,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041250,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041251,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041252,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041253,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041254,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041255,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041256,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041257,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041258,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041259,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041260,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041261,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041262,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041263,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041264,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041265,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041266,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041267,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041268,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041269,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041270,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041271,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041272,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041273,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041274,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041275,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041276,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041277,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041278,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041279,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041280,
        "dEQP-GLES3.functional.transform_feedba",
        "ck.array.interleaved.triangles.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041281,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041282,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041283,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041284,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041285,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041286,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041287,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041288,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041289,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041290,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041291,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041292,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041293,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041294,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041295,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041296,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041297,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041298,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041299,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041300,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041301,
        "dEQP-GLES3.functional.transform_feedbac",
        "k.array.interleaved.triangles.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041302,
        "dEQP-GLES3.functional.transform_feedback.",
        "array.interleaved.triangles.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041303,
        "dEQP-GLES3.functional.transform_feedback",
        ".array.interleaved.triangles.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041619,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041620,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041621,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041622,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041623,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041624,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041625,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041626,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041627,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041628,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041629,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041630,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041631,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041632,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041633,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041634,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041635,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041636,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041637,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041638,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041639,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041640,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041641,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041642,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041643,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041644,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041645,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041646,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041647,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041648,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041649,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041650,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041651,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041652,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041653,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041654,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041655,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041656,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041657,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041658,
        "dEQP-GLES3.functional.transform_feedback.a",
        "rray_element.interleaved.triangles.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041659,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041660,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041661,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041662,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041663,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041664,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041665,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041666,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041667,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041668,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041669,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041670,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041671,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041672,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041673,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041674,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041675,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041676,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041677,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041678,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041679,
        "dEQP-GLES3.functional.transform_feedback.ar",
        "ray_element.interleaved.triangles.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041680,
        "dEQP-GLES3.functional.transform_feedback.arra",
        "y_element.interleaved.triangles.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041681,
        "dEQP-GLES3.functional.transform_feedback.arr",
        "ay_element.interleaved.triangles.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041786,
        "dEQP-GLES3.functional.transform_fee",
        "dback.random.interleaved.triangles.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041787,
        "dEQP-GLES3.functional.transform_fee",
        "dback.random.interleaved.triangles.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041788,
        "dEQP-GLES3.functional.transform_fee",
        "dback.random.interleaved.triangles.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041789,
        "dEQP-GLES3.functional.transform_fee",
        "dback.random.interleaved.triangles.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041790,
        "dEQP-GLES3.functional.transform_fee",
        "dback.random.interleaved.triangles.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041791,
        "dEQP-GLES3.functional.transform_fee",
        "dback.random.interleaved.triangles.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041792,
        "dEQP-GLES3.functional.transform_fee",
        "dback.random.interleaved.triangles.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041793,
        "dEQP-GLES3.functional.transform_fee",
        "dback.random.interleaved.triangles.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041794,
        "dEQP-GLES3.functional.transform_fee",
        "dback.random.interleaved.triangles.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041795,
        "dEQP-GLES3.functional.transform_feed",
        "back.random.interleaved.triangles.10");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041846,
        "dEQP-GLES3.functional.transform_feedback.rand",
        "om_full_array_capture.interleaved.triangles.1");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041847,
        "dEQP-GLES3.functional.transform_feedback.rand",
        "om_full_array_capture.interleaved.triangles.2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041848,
        "dEQP-GLES3.functional.transform_feedback.rand",
        "om_full_array_capture.interleaved.triangles.3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041849,
        "dEQP-GLES3.functional.transform_feedback.rand",
        "om_full_array_capture.interleaved.triangles.4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041850,
        "dEQP-GLES3.functional.transform_feedback.rand",
        "om_full_array_capture.interleaved.triangles.5");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041851,
        "dEQP-GLES3.functional.transform_feedback.rand",
        "om_full_array_capture.interleaved.triangles.6");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041852,
        "dEQP-GLES3.functional.transform_feedback.rand",
        "om_full_array_capture.interleaved.triangles.7");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041853,
        "dEQP-GLES3.functional.transform_feedback.rand",
        "om_full_array_capture.interleaved.triangles.8");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041854,
        "dEQP-GLES3.functional.transform_feedback.rand",
        "om_full_array_capture.interleaved.triangles.9");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_041855,
        "dEQP-GLES3.functional.transform_feedback.rand",
        "om_full_array_capture.interleaved.triangles.10");
