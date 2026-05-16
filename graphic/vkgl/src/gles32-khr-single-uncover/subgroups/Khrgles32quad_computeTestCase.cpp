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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005342,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_0_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005343,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswaphorizontal_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005344,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadswapvertical_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005345,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadswapdiagonal_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005346,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005347,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005348,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005349,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005350,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005351,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005352,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005353,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005354,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005355,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005356,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005357,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005358,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_0_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005359,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005360,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005361,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005362,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005363,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005364,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005365,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005366,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005367,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005368,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005369,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005370,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005371,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005372,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005373,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005374,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005375,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005376,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005377,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005378,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_0_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005379,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005380,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005381,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005382,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_0_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005383,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005384,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005385,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005386,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_0_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005387,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005388,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005389,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005390,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005391,
        "KHR-Single-GLES32.subgroups.quad.comp",
        "ute.subgroupquadswaphorizontal_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005392,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswapvertical_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005393,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswapdiagonal_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005394,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005395,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005396,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005397,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005398,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005399,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005400,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005401,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005402,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005403,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005404,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005405,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005406,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_0_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005407,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005408,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005409,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005410,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005411,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005412,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005413,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005414,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005415,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005416,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005417,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005418,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_0_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005419,
        "KHR-Single-GLES32.subgroups.quad.com",
        "pute.subgroupquadswaphorizontal_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005420,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapvertical_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005421,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadswapdiagonal_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005422,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_1_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005423,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005424,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005425,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005426,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_1_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005427,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005428,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005429,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005430,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005431,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_1_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005432,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_1_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005433,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_1_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005434,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005435,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005436,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005437,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005438,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_1_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005439,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005440,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005441,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_1_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005442,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_2_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005443,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005444,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005445,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005446,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_2_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005447,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005448,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005449,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005450,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005451,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_2_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005452,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_2_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005453,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_2_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005454,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005455,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005456,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005457,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005458,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_2_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005459,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005460,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005461,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_2_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005462,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_3_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005463,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005464,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005465,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005466,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_3_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005467,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005468,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005469,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005470,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005471,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_3_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005472,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_3_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005473,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_3_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005474,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005475,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005476,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005477,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005478,
        "KHR-Single-GLES32.subgroups.quad.c",
        "ompute.subgroupquadbroadcast_3_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005479,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005480,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005481,
        "KHR-Single-GLES32.subgroups.quad.co",
        "mpute.subgroupquadbroadcast_3_bvec4");
