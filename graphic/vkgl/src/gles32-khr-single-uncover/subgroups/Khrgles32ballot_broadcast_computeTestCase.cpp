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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000280,
        "KHR-Single-GLES32.subgroups.ballot_br",
        "oadcast.compute.subgroupbroadcast_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000281,
        "KHR-Single-GLES32.subgroups.ballot_broa",
        "dcast.compute.subgroupbroadcastfirst_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000282,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000283,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000284,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000285,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000286,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000287,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000288,
        "KHR-Single-GLES32.subgroups.ballot_br",
        "oadcast.compute.subgroupbroadcast_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000289,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000290,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000291,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000292,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000293,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000294,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000295,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000296,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000297,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000298,
        "KHR-Single-GLES32.subgroups.ballot_br",
        "oadcast.compute.subgroupbroadcast_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000299,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000300,
        "KHR-Single-GLES32.subgroups.ballot_br",
        "oadcast.compute.subgroupbroadcast_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000301,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000302,
        "KHR-Single-GLES32.subgroups.ballot_br",
        "oadcast.compute.subgroupbroadcast_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000303,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000304,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000305,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.compute.subgroupbroadcastfirst_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000306,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000307,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000308,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000309,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000310,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000311,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000312,
        "KHR-Single-GLES32.subgroups.ballot_br",
        "oadcast.compute.subgroupbroadcast_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000313,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000314,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000315,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000316,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000317,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000318,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.compute.subgroupbroadcast_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000319,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.compute.subgroupbroadcastfirst_bvec4");
