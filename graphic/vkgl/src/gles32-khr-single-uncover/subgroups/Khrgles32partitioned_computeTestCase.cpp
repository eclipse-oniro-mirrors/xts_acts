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
#include "../ActsGles32KhrSingleUncover0004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003222,
        "KHR-Single-GLES32.subgroups.par",
        "titioned.compute.subgroupadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003223,
        "KHR-Single-GLES32.subgroups.par",
        "titioned.compute.subgroupmul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003224,
        "KHR-Single-GLES32.subgroups.par",
        "titioned.compute.subgroupmin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003225,
        "KHR-Single-GLES32.subgroups.par",
        "titioned.compute.subgroupmax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003226,
        "KHR-Single-GLES32.subgroups.par",
        "titioned.compute.subgroupand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003227,
        "KHR-Single-GLES32.subgroups.par",
        "titioned.compute.subgroupor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003228,
        "KHR-Single-GLES32.subgroups.par",
        "titioned.compute.subgroupxor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003229,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003230,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003231,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003232,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003233,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003234,
        "KHR-Single-GLES32.subgroups.partiti",
        "oned.compute.subgroupinclusiveor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003235,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivexor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003236,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003237,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003238,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003239,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003240,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003241,
        "KHR-Single-GLES32.subgroups.partiti",
        "oned.compute.subgroupexclusiveor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003242,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivexor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003243,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003244,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003245,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003246,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003247,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003248,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003249,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupxor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003250,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003251,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003252,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003253,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003254,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003255,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003256,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivexor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003257,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003258,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003259,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003260,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003261,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003262,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003263,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivexor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003264,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003265,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003266,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003267,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003268,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003269,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003270,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupxor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003271,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003272,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003273,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003274,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003275,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003276,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003277,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivexor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003278,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003279,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003280,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003281,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003282,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003283,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003284,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivexor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003285,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003286,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003287,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003288,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003289,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003290,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003291,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupxor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003292,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003293,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003294,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003295,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003296,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003297,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003298,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivexor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003299,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003300,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003301,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003302,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003303,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003304,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003305,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivexor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003306,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003307,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003308,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003309,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003310,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003311,
        "KHR-Single-GLES32.subgroups.par",
        "titioned.compute.subgroupor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003312,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupxor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003313,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003314,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003315,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003316,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003317,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003318,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003319,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivexor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003320,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003321,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003322,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003323,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003324,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003325,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003326,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivexor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003327,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003328,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003329,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003330,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003331,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003332,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003333,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupxor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003334,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003335,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003336,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003337,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003338,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003339,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003340,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivexor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003341,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003342,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003343,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003344,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003345,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003346,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003347,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivexor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003348,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003349,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003350,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003351,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003352,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003353,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003354,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupxor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003355,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003356,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003357,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003358,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003359,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003360,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003361,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivexor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003362,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003363,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003364,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003365,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003366,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003367,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003368,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivexor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003369,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003370,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003371,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003372,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003373,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003374,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003375,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupxor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003376,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003377,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003378,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003379,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003380,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003381,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003382,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivexor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003383,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003384,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003385,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003386,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003387,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003388,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003389,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivexor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003390,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003391,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003392,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003393,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003394,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003395,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003396,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003397,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003398,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003399,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003400,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003401,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003402,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003403,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003404,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003405,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003406,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003407,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003408,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003409,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003410,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003411,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003412,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003413,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003414,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003415,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003416,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003417,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003418,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003419,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003420,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003421,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003422,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003423,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003424,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003425,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003426,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003427,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003428,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003429,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003430,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003431,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003432,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003433,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivemax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003434,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003435,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003436,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003437,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivemax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003438,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.compute.subgroupadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003439,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.compute.subgroupmul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003440,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.compute.subgroupmin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003441,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.compute.subgroupmax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003442,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003443,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003444,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003445,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003446,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003447,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003448,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003449,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003450,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003451,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003452,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003453,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003454,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003455,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003456,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003457,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003458,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003459,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003460,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003461,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003462,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003463,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003464,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003465,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003466,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003467,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003468,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003469,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003470,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003471,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003472,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003473,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003474,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003475,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003476,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003477,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupmax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003478,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003479,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003480,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003481,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivemax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003482,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003483,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003484,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003485,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivemax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003486,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003487,
        "KHR-Single-GLES32.subgroups.par",
        "titioned.compute.subgroupor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003488,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupxor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003489,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003490,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003491,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusivexor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003492,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003493,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003494,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusivexor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003495,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003496,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003497,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupxor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003498,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003499,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003500,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivexor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003501,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003502,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003503,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivexor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003504,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003505,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003506,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupxor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003507,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003508,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003509,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivexor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003510,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003511,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003512,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivexor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003513,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003514,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003515,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.compute.subgroupxor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003516,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusiveand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003517,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupinclusiveor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003518,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupinclusivexor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003519,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusiveand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003520,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.compute.subgroupexclusiveor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003521,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.compute.subgroupexclusivexor_bvec4");
