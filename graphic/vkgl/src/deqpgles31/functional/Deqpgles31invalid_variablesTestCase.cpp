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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005927,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.variables.uint_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005928,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uint_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005929,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uint_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005930,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uint_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005931,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uint_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005932,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uint_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005933,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uint_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005934,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uint_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005935,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.ivec2_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005936,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec2_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005937,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005938,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005939,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005940,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005941,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005942,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005943,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005944,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005945,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.ivec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005946,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005947,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.ivec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005948,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005949,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uvec2_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005950,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec2_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005951,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec2_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005952,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec2_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005953,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005954,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005955,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005956,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005957,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005958,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005959,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005960,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005961,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uvec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005962,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005963,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uvec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005964,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005965,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.ivec3_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005966,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec3_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005967,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005968,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005969,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec3_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005970,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec3_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005971,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005972,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005973,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec3_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005974,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec3_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005975,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.ivec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005976,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005977,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.ivec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005978,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005979,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uvec3_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005980,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec3_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005981,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005982,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005983,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec3_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005984,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec3_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005985,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec3_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005986,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec3_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005987,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005988,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005989,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec3_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005990,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec3_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005991,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uvec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005992,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005993,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uvec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005994,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005995,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.ivec4_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005996,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec4_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005997,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005998,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005999,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec4_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006000,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec4_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006001,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006002,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006003,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec4_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006004,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.ivec4_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006005,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.ivec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006006,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006007,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.ivec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006008,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.ivec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006009,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uvec4_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006010,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec4_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006011,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006012,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006013,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec4_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006014,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec4_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006015,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006016,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006017,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec4_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006018,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec4_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006019,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec4_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006020,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.uvec4_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006021,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uvec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006022,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006023,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.uvec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006024,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.uvec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006025,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.float_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006026,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.float_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006027,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.float_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006028,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.float_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006029,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.float_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006030,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.float_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006031,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.float_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006032,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.float_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006033,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.float_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006034,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.float_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006035,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.float_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006036,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.float_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006037,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.float_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006038,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.float_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006039,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.float_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006040,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es31.invalid.variables.float_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006041,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.variables.vec2_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006042,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec2_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006043,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec2_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006044,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec2_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006045,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec2_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006046,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec2_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006047,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006048,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006049,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006050,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006051,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006052,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006053,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006054,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006055,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006056,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006057,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006058,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006059,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006060,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006061,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.variables.vec3_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006062,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec3_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006063,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec3_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006064,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec3_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006065,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006066,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006067,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec3_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006068,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec3_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006069,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec3_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006070,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec3_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006071,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006072,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006073,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006074,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006075,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec3_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006076,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec3_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006077,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006078,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006079,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006080,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006081,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.variables.vec4_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006082,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec4_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006083,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec4_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006084,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec4_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006085,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006086,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006087,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec4_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006088,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec4_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006089,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006090,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006091,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec4_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006092,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec4_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006093,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec4_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006094,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec4_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006095,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006096,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006097,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006098,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006099,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.variables.vec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006100,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.variables.vec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006961,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.variables.uint_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006962,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uint_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006963,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uint_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006964,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uint_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006965,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uint_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006966,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uint_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006967,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uint_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006968,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uint_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006969,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.ivec2_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006970,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec2_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006971,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006972,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006973,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006974,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006975,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006976,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006977,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006978,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006979,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.ivec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006980,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006981,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.ivec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006982,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006983,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uvec2_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006984,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec2_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006985,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec2_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006986,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec2_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006987,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006988,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006989,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006990,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006991,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006992,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006993,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006994,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006995,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uvec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006996,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006997,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uvec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006998,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006999,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.ivec3_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007000,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec3_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007001,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007002,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007003,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec3_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007004,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec3_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007005,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007006,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007007,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec3_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007008,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec3_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007009,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.ivec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007010,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007011,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.ivec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007012,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007013,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uvec3_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007014,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec3_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007015,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007016,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007017,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec3_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007018,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec3_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007019,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec3_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007020,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec3_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007021,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007022,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007023,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec3_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007024,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec3_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007025,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uvec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007026,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007027,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uvec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007028,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007029,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.ivec4_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007030,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec4_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007031,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007032,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007033,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec4_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007034,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec4_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007035,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007036,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007037,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec4_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007038,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.ivec4_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007039,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.ivec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007040,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007041,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.ivec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007042,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.ivec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007043,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uvec4_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007044,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec4_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007045,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007046,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007047,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec4_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007048,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec4_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007049,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007050,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007051,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec4_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007052,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec4_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007053,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec4_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007054,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.uvec4_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007055,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uvec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007056,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007057,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.uvec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007058,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.uvec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007059,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.float_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007060,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.float_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007061,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.float_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007062,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.float_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007063,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.float_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007064,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.float_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007065,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.float_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007066,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.float_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007067,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.float_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007068,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.float_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007069,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.float_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007070,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.float_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007071,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.float_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007072,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.float_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007073,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.float_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007074,
        "dEQP-GLES31.functional.shaders.implicit_conversio",
        "ns.es32.invalid.variables.float_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007075,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.variables.vec2_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007076,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec2_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007077,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec2_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007078,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec2_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007079,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec2_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007080,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec2_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007081,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007082,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007083,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007084,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007085,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007086,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007087,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007088,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007089,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007090,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007091,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007092,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007093,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007094,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007095,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.variables.vec3_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007096,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec3_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007097,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec3_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007098,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec3_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007099,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007100,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007101,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec3_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007102,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec3_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007103,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec3_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007104,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec3_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007105,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007106,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007107,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007108,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007109,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec3_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007110,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec3_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007111,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007112,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007113,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007114,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007115,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.variables.vec4_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007116,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec4_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007117,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec4_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007118,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec4_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007119,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007120,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007121,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec4_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007122,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec4_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007123,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007124,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007125,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec4_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007126,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec4_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007127,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec4_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007128,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec4_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007129,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007130,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007131,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007132,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007133,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.variables.vec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_007134,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.variables.vec4_to_vec3_fragment");
