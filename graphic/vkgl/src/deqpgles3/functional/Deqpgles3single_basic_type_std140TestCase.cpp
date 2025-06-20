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
#include "../ActsDeqpgles30035TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034489,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034490,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034491,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034492,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034493,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034494,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034495,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034496,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034497,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034498,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034499,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034500,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.lowp_vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034501,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034502,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034503,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034504,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034505,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034506,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034507,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034508,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034509,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.lowp_vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034510,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034511,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034512,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034513,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034514,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034515,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034516,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034517,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034518,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.lowp_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034519,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034520,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034521,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034522,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034523,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034524,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034525,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034526,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034527,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.lowp_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034528,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034529,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034530,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.mediump_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034531,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034532,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034533,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.highp_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034534,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034535,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034536,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034537,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034538,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034539,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034540,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034541,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034542,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034543,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034544,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034545,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034546,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034547,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034548,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034549,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034550,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034551,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034552,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034553,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034554,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034555,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034556,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034557,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034558,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034559,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034560,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034561,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034562,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034563,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.lowp_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034564,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034565,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034566,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034567,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034568,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034569,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034570,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034571,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034572,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034573,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034574,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034575,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034576,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034577,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034578,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034579,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034580,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034581,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034582,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034583,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034584,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034585,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034586,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034587,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034588,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034589,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034590,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034591,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034592,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034593,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034594,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034595,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034596,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034597,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.std140.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034598,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034599,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_type.std140.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034600,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.std140.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034601,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034602,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_type.std140.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034603,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.std140.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034604,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034605,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_type.std140.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034606,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.std140.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034607,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034608,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_type.std140.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034609,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034610,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034611,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.lowp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034612,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034613,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034614,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034615,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034616,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034617,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034618,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034619,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034620,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.std140.row_major_lowp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034621,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034622,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034623,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_mediump_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034624,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034625,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034626,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_highp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034627,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034628,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034629,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.column_major_lowp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034630,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034631,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034632,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_mediump_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034633,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034634,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034635,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.column_major_highp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034636,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034637,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034638,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.lowp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034639,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034640,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034641,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034642,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034643,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034644,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034645,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034646,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034647,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.std140.row_major_lowp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034648,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034649,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034650,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_mediump_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034651,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034652,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034653,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_highp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034654,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034655,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034656,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.column_major_lowp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034657,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034658,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034659,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_mediump_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034660,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034661,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034662,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.column_major_highp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034663,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034664,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034665,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.std140.lowp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034666,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034667,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034668,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.mediump_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034669,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034670,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034671,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.highp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034672,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034673,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034674,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.std140.row_major_lowp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034675,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034676,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034677,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_mediump_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034678,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034679,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_highp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034680,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_highp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034681,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034682,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034683,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.column_major_lowp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034684,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034685,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034686,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_mediump_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034687,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034688,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_highp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034689,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.column_major_highp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034690,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034691,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034692,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034693,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034694,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.std140.mediump_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034695,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034696,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034697,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.highp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034698,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034699,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_lowp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034700,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_lowp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034701,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_lowp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034702,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_mediump_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034703,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.row_major_mediump_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034704,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_mediump_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034705,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_highp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034706,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_highp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034707,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_highp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034708,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_lowp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034709,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_lowp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034710,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_lowp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034711,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_mediump_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034712,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".std140.column_major_mediump_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034713,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_mediump_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034714,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_highp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034715,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_highp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034716,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_highp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034717,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034718,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034719,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034720,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034721,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.std140.mediump_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034722,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034723,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034724,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.highp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034725,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034726,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_lowp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034727,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_lowp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034728,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_lowp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034729,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_mediump_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034730,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.row_major_mediump_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034731,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_mediump_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034732,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_highp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034733,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_highp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034734,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_highp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034735,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_lowp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034736,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_lowp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034737,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_lowp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034738,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_mediump_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034739,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".std140.column_major_mediump_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034740,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_mediump_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034741,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_highp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034742,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_highp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034743,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_highp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034744,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034745,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034746,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034747,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034748,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.std140.mediump_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034749,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034750,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034751,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.highp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034752,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034753,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_lowp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034754,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_lowp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034755,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_lowp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034756,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_mediump_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034757,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.row_major_mediump_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034758,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_mediump_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034759,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_highp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034760,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_highp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034761,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_highp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034762,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_lowp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034763,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_lowp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034764,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_lowp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034765,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_mediump_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034766,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".std140.column_major_mediump_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034767,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_mediump_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034768,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_highp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034769,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_highp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034770,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_highp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034771,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034772,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034773,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034774,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034775,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.std140.mediump_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034776,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034777,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034778,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.highp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034779,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034780,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_lowp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034781,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_lowp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034782,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_lowp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034783,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_mediump_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034784,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.row_major_mediump_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034785,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_mediump_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034786,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_highp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034787,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_highp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034788,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_highp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034789,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_lowp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034790,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_lowp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034791,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_lowp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034792,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_mediump_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034793,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".std140.column_major_mediump_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034794,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_mediump_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034795,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_highp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034796,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_highp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034797,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_highp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034798,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034799,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034800,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034801,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034802,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.std140.mediump_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034803,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034804,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034805,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.highp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034806,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034807,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_lowp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034808,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_lowp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034809,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_lowp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034810,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_mediump_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034811,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.row_major_mediump_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034812,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_mediump_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034813,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_highp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034814,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_highp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034815,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_highp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034816,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_lowp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034817,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_lowp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034818,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_lowp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034819,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_mediump_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034820,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".std140.column_major_mediump_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034821,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_mediump_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034822,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_highp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034823,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_highp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034824,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_highp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034825,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.lowp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034826,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.lowp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034827,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.std140.lowp_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034828,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.mediump_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034829,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.std140.mediump_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034830,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.mediump_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034831,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.std140.highp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034832,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.std140.highp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034833,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.std140.highp_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034834,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_lowp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034835,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_lowp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034836,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.std140.row_major_lowp_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034837,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_mediump_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034838,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.row_major_mediump_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034839,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_mediump_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034840,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.row_major_highp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034841,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.row_major_highp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034842,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.std140.row_major_highp_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034843,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_lowp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034844,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_lowp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034845,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_lowp_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034846,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_mediump_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034847,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".std140.column_major_mediump_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034848,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_mediump_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034849,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.std140.column_major_highp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034850,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.std140.column_major_highp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034851,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.std140.column_major_highp_mat4x3_both");
