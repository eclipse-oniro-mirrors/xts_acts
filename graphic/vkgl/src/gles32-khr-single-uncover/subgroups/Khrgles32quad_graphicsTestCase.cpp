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
#include "../ActsGles32KhrSingleUncover0006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005202,
        "KHR-Single-GLES32.subgroups.quad.g",
        "raphics.subgroupquadbroadcast_0_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005203,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswaphorizontal_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005204,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapvertical_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005205,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapdiagonal_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005206,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005207,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005208,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005209,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005210,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005211,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005212,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005213,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005214,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005215,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005216,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005217,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005218,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005219,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswaphorizontal_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005220,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapvertical_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005221,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapdiagonal_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005222,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005223,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005224,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005225,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005226,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005227,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005228,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005229,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005230,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005231,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005232,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005233,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005234,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005235,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005236,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005237,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005238,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005239,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswaphorizontal_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005240,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapvertical_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005241,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapdiagonal_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005242,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005243,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswaphorizontal_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005244,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapvertical_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005245,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapdiagonal_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005246,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005247,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswaphorizontal_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005248,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapvertical_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005249,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapdiagonal_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005250,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadbroadcast_0_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005251,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005252,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005253,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005254,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005255,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005256,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005257,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005258,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005259,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005260,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005261,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005262,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005263,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005264,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005265,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005266,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005267,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswaphorizontal_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005268,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapvertical_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005269,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadswapdiagonal_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005270,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005271,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005272,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005273,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005274,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005275,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005276,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005277,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005278,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_0_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005279,
        "KHR-Single-GLES32.subgroups.quad.grap",
        "hics.subgroupquadswaphorizontal_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005280,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapvertical_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005281,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadswapdiagonal_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005282,
        "KHR-Single-GLES32.subgroups.quad.g",
        "raphics.subgroupquadbroadcast_1_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005283,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005284,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005285,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005286,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005287,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005288,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005289,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005290,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005291,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005292,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005293,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005294,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadbroadcast_1_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005295,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005296,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005297,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005298,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005299,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005300,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005301,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_1_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005302,
        "KHR-Single-GLES32.subgroups.quad.g",
        "raphics.subgroupquadbroadcast_2_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005303,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005304,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005305,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005306,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005307,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005308,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005309,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005310,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005311,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005312,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005313,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005314,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadbroadcast_2_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005315,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005316,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005317,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005318,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005319,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005320,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005321,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_2_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005322,
        "KHR-Single-GLES32.subgroups.quad.g",
        "raphics.subgroupquadbroadcast_3_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005323,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005324,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005325,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005326,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005327,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005328,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005329,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005330,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005331,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005332,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005333,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005334,
        "KHR-Single-GLES32.subgroups.quad.gra",
        "phics.subgroupquadbroadcast_3_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005335,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005336,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005337,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005338,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005339,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005340,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005341,
        "KHR-Single-GLES32.subgroups.quad.gr",
        "aphics.subgroupquadbroadcast_3_bvec4");
