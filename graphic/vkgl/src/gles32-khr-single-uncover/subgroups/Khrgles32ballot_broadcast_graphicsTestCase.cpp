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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000240,
        "KHR-Single-GLES32.subgroups.ballot_br",
        "oadcast.graphics.subgroupbroadcast_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000241,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.graphics.subgroupbroadcastfirst_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000242,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000243,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000244,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000245,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000246,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000247,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000248,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000249,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.graphics.subgroupbroadcastfirst_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000250,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000251,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000252,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000253,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000254,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000255,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000256,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000257,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000258,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000259,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.graphics.subgroupbroadcastfirst_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000260,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000261,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.graphics.subgroupbroadcastfirst_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000262,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000263,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.graphics.subgroupbroadcastfirst_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000264,
        "KHR-Single-GLES32.subgroups.ballot_broa",
        "dcast.graphics.subgroupbroadcast_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000265,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000266,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000267,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000268,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000269,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000270,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000271,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000272,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000273,
        "KHR-Single-GLES32.subgroups.ballot_broad",
        "cast.graphics.subgroupbroadcastfirst_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000274,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000275,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000276,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000277,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000278,
        "KHR-Single-GLES32.subgroups.ballot_bro",
        "adcast.graphics.subgroupbroadcast_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000279,
        "KHR-Single-GLES32.subgroups.ballot_broadc",
        "ast.graphics.subgroupbroadcastfirst_bvec4");
