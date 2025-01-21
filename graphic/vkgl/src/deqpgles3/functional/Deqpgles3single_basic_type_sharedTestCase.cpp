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
#include "../ActsDeqpgles30034TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033884,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033885,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033886,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033887,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033888,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033889,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033890,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033891,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033892,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033893,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033894,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033895,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.lowp_vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033896,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033897,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033898,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033899,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033900,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033901,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033902,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033903,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033904,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.lowp_vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033905,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033906,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033907,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033908,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033909,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033910,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033911,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033912,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033913,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.lowp_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033914,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033915,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033916,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033917,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033918,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033919,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033920,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033921,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033922,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.lowp_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033923,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033924,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033925,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.mediump_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033926,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033927,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033928,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.highp_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033929,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033930,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033931,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033932,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033933,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033934,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033935,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033936,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033937,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033938,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033939,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033940,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033941,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033942,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033943,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033944,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033945,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033946,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033947,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033948,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033949,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033950,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033951,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033952,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033953,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033954,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033955,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033956,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033957,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033958,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.lowp_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033959,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033960,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033961,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033962,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033963,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033964,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033965,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033966,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033967,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033968,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033969,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033970,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033971,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033972,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033973,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033974,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033975,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033976,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033977,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033978,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033979,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033980,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033981,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033982,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033983,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033984,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033985,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033986,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033987,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033988,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033989,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033990,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033991,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033992,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.shared.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033993,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033994,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_type.shared.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033995,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.shared.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033996,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033997,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_type.shared.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033998,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.shared.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033999,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034000,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_type.shared.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034001,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_type.shared.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034002,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034003,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_type.shared.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034004,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034005,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034006,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.lowp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034007,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034008,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034009,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034010,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034011,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034012,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034013,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034014,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034015,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.shared.row_major_lowp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034016,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034017,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034018,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_mediump_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034019,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034020,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034021,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_highp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034022,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034023,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034024,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.column_major_lowp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034025,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034026,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034027,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_mediump_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034028,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034029,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034030,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.column_major_highp_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034031,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034032,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034033,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.lowp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034034,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034035,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034036,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034037,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034038,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034039,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034040,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034041,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034042,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.shared.row_major_lowp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034043,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034044,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034045,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_mediump_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034046,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034047,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034048,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_highp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034049,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034050,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034051,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.column_major_lowp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034052,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034053,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034054,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_mediump_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034055,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034056,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034057,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.column_major_highp_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034058,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034059,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034060,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_type.shared.lowp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034061,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034062,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034063,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.mediump_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034064,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034065,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034066,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.highp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034067,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034068,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034069,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.shared.row_major_lowp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034070,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034071,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034072,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_mediump_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034073,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034074,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_highp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034075,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_highp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034076,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034077,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034078,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.column_major_lowp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034079,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034080,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034081,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_mediump_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034082,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034083,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_highp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034084,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.column_major_highp_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034085,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034086,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034087,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034088,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034089,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.shared.mediump_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034090,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034091,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034092,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.highp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034093,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034094,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_lowp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034095,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_lowp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034096,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_lowp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034097,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_mediump_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034098,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.row_major_mediump_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034099,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_mediump_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034100,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_highp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034101,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_highp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034102,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_highp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034103,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_lowp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034104,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_lowp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034105,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_lowp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034106,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_mediump_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034107,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".shared.column_major_mediump_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034108,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_mediump_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034109,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_highp_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034110,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_highp_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034111,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_highp_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034112,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034113,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034114,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034115,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034116,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.shared.mediump_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034117,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034118,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034119,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.highp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034120,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034121,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_lowp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034122,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_lowp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034123,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_lowp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034124,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_mediump_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034125,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.row_major_mediump_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034126,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_mediump_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034127,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_highp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034128,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_highp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034129,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_highp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034130,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_lowp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034131,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_lowp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034132,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_lowp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034133,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_mediump_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034134,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".shared.column_major_mediump_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034135,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_mediump_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034136,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_highp_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034137,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_highp_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034138,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_highp_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034139,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034140,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034141,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034142,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034143,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.shared.mediump_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034144,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034145,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034146,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.highp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034147,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034148,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_lowp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034149,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_lowp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034150,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_lowp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034151,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_mediump_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034152,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.row_major_mediump_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034153,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_mediump_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034154,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_highp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034155,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_highp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034156,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_highp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034157,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_lowp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034158,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_lowp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034159,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_lowp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034160,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_mediump_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034161,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".shared.column_major_mediump_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034162,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_mediump_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034163,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_highp_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034164,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_highp_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034165,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_highp_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034166,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034167,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034168,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034169,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034170,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.shared.mediump_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034171,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034172,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034173,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.highp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034174,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034175,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_lowp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034176,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_lowp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034177,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_lowp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034178,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_mediump_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034179,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.row_major_mediump_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034180,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_mediump_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034181,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_highp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034182,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_highp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034183,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_highp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034184,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_lowp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034185,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_lowp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034186,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_lowp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034187,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_mediump_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034188,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".shared.column_major_mediump_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034189,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_mediump_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034190,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_highp_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034191,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_highp_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034192,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_highp_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034193,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034194,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034195,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034196,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034197,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.shared.mediump_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034198,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034199,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034200,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.highp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034201,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034202,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_lowp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034203,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_lowp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034204,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_lowp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034205,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_mediump_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034206,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.row_major_mediump_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034207,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_mediump_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034208,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_highp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034209,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_highp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034210,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_highp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034211,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_lowp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034212,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_lowp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034213,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_lowp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034214,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_mediump_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034215,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".shared.column_major_mediump_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034216,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_mediump_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034217,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_highp_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034218,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_highp_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034219,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_highp_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034220,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.lowp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034221,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.lowp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034222,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_type.shared.lowp_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034223,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.mediump_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034224,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_type.shared.mediump_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034225,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.mediump_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034226,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_type.shared.highp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034227,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_type.shared.highp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034228,
        "dEQP-GLES3.functional.ubo.single_b",
        "asic_type.shared.highp_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034229,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_lowp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034230,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_lowp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034231,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_type.shared.row_major_lowp_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034232,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_mediump_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034233,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.row_major_mediump_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034234,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_mediump_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034235,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.row_major_highp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034236,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.row_major_highp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034237,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "type.shared.row_major_highp_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034238,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_lowp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034239,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_lowp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034240,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_lowp_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034241,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_mediump_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034242,
        "dEQP-GLES3.functional.ubo.single_basic_type",
        ".shared.column_major_mediump_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034243,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_mediump_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034244,
        "dEQP-GLES3.functional.ubo.single_basic_ty",
        "pe.shared.column_major_highp_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034245,
        "dEQP-GLES3.functional.ubo.single_basic_typ",
        "e.shared.column_major_highp_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_034246,
        "dEQP-GLES3.functional.ubo.single_basic_t",
        "ype.shared.column_major_highp_mat4x3_both");
