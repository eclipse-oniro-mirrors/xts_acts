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
#include "../Khrgles32BaseFunc.h"
#include "../ActsGles32KhrSingleUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000124,
        "KHR-Single-GLES32.subgroups.vote.fra",
        "mebuffer.subgroupallequal_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000125,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000126,
        "KHR-Single-GLES32.subgroups.vote.frameb",
        "uffer.subgroupallequal_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000127,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000128,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000129,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000130,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000131,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000132,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000133,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000134,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000135,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000136,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000137,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000138,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000139,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000140,
        "KHR-Single-GLES32.subgroups.vote.f",
        "ramebuffer.subgroupall_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000141,
        "KHR-Single-GLES32.subgroups.vote.fr",
        "amebuffer.subgroupall_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000142,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupall_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000143,
        "KHR-Single-GLES32.subgroups.vote.fr",
        "amebuffer.subgroupall_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000144,
        "KHR-Single-GLES32.subgroups.vote.f",
        "ramebuffer.subgroupany_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000145,
        "KHR-Single-GLES32.subgroups.vote.fr",
        "amebuffer.subgroupany_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000146,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupany_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000147,
        "KHR-Single-GLES32.subgroups.vote.fr",
        "amebuffer.subgroupany_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000148,
        "KHR-Single-GLES32.subgroups.vote.fra",
        "mebuffer.subgroupallequal_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000149,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000150,
        "KHR-Single-GLES32.subgroups.vote.frameb",
        "uffer.subgroupallequal_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000151,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000152,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000153,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000154,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000155,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000156,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000157,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000158,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000159,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000160,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000161,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000162,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000163,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000164,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000165,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000166,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000167,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000168,
        "KHR-Single-GLES32.subgroups.vote.fra",
        "mebuffer.subgroupallequal_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000169,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000170,
        "KHR-Single-GLES32.subgroups.vote.frameb",
        "uffer.subgroupallequal_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000171,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000172,
        "KHR-Single-GLES32.subgroups.vote.fra",
        "mebuffer.subgroupallequal_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000173,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000174,
        "KHR-Single-GLES32.subgroups.vote.frameb",
        "uffer.subgroupallequal_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000175,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000176,
        "KHR-Single-GLES32.subgroups.vote.fra",
        "mebuffer.subgroupallequal_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000177,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000178,
        "KHR-Single-GLES32.subgroups.vote.frameb",
        "uffer.subgroupallequal_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000179,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000180,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000181,
        "KHR-Single-GLES32.subgroups.vote.frameb",
        "uffer.subgroupallequal_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000182,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000183,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000184,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000185,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000186,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000187,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000188,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000189,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000190,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000191,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000192,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000193,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000194,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000195,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000196,
        "KHR-Single-GLES32.subgroups.vote.fra",
        "mebuffer.subgroupallequal_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000197,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000198,
        "KHR-Single-GLES32.subgroups.vote.frameb",
        "uffer.subgroupallequal_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000199,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000200,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000201,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000202,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000203,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000204,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000205,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000206,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000207,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000208,
        "KHR-Single-GLES32.subgroups.vote.fram",
        "ebuffer.subgroupallequal_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000209,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000210,
        "KHR-Single-GLES32.subgroups.vote.framebu",
        "ffer.subgroupallequal_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000211,
        "KHR-Single-GLES32.subgroups.vote.frame",
        "buffer.subgroupallequal_bvec4_geometry");
