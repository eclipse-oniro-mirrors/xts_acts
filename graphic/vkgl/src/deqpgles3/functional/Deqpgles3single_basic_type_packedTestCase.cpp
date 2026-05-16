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

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034247,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034248,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034249,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034250,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034251,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034252,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034253,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.packed.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034254,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034255,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034256,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034257,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034258,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034259,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.packed.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034260,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034261,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034262,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034263,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034264,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034265,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.packed.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034266,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034267,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034268,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034269,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034270,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034271,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.packed.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034272,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034273,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034274,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034275,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.packed.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034276,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034277,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034278,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034279,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034280,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034281,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034282,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034283,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034284,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034285,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034286,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034287,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034288,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034289,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034290,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034291,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034292,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034293,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034294,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034295,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.packed.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034296,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034297,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034298,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034299,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034300,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034301,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034302,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034303,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034304,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034305,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034306,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034307,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034308,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034309,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034310,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034311,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034312,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034313,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034314,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034315,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034316,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034317,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034318,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034319,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.packed.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034320,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.packed.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034321,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.packed.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034322,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.packed.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034323,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.packed.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034324,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.packed.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034325,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.packed.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034326,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.packed.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034327,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.packed.lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034328,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034329,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034330,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034331,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034332,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034333,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.packed.row_major_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034334,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034335,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034336,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034337,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034338,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034339,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.column_major_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034340,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034341,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034342,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034343,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.column_major_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034344,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034345,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.packed.lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034346,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034347,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034348,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034349,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034350,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034351,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.packed.row_major_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034352,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034353,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034354,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034355,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034356,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034357,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.column_major_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034358,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034359,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034360,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034361,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.column_major_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034362,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034363,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.packed.lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034364,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034365,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034366,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034367,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034368,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034369,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.packed.row_major_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034370,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034371,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034372,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034373,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034374,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_highp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034375,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.column_major_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034376,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034377,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034378,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034379,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.column_major_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034380,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_highp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034381,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034382,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034383,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034384,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.packed.mediump_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034385,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034386,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.highp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034387,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_lowp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034388,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_lowp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034389,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_mediump_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034390,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.row_major_mediump_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034391,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_highp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034392,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_highp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034393,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_lowp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034394,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_lowp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034395,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_mediump_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034396,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".packed.column_major_mediump_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034397,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_highp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034398,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_highp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034399,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034400,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034401,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034402,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.packed.mediump_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034403,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034404,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.highp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034405,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_lowp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034406,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_lowp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034407,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_mediump_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034408,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.row_major_mediump_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034409,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_highp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034410,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_highp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034411,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_lowp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034412,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_lowp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034413,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_mediump_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034414,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".packed.column_major_mediump_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034415,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_highp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034416,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_highp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034417,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034418,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034419,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034420,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.packed.mediump_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034421,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034422,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.highp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034423,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_lowp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034424,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_lowp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034425,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_mediump_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034426,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.row_major_mediump_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034427,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_highp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034428,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_highp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034429,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_lowp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034430,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_lowp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034431,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_mediump_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034432,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".packed.column_major_mediump_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034433,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_highp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034434,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_highp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034435,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034436,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034437,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034438,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.packed.mediump_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034439,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034440,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.highp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034441,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_lowp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034442,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_lowp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034443,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_mediump_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034444,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.row_major_mediump_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034445,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_highp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034446,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_highp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034447,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_lowp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034448,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_lowp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034449,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_mediump_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034450,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".packed.column_major_mediump_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034451,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_highp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034452,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_highp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034453,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034454,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034455,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034456,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.packed.mediump_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034457,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034458,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.highp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034459,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_lowp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034460,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_lowp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034461,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_mediump_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034462,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.row_major_mediump_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034463,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_highp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034464,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_highp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034465,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_lowp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034466,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_lowp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034467,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_mediump_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034468,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".packed.column_major_mediump_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034469,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_highp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034470,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_highp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034471,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.packed.lowp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034472,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.lowp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034473,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.mediump_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034474,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.packed.mediump_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034475,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.packed.highp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034476,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.packed.highp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034477,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.packed.row_major_lowp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034478,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_lowp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034479,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_mediump_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034480,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.row_major_mediump_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034481,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.packed.row_major_highp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034482,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.row_major_highp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034483,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_lowp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034484,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_lowp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034485,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_mediump_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034486,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".packed.column_major_mediump_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034487,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.packed.column_major_highp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034488,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.packed.column_major_highp_mat4x3_fragment");
