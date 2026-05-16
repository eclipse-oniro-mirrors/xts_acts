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
#include "../ActsGles32KhrSingleUncover0003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002922,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002923,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002924,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002925,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002926,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002927,
        "KHR-Single-GLES32.subgroups.par",
        "titioned.graphics.subgroupor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002928,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupxor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002929,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupinclusiveadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002930,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupinclusivemul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002931,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupinclusivemin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002932,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupinclusivemax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002933,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupinclusiveand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002934,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupinclusiveor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002935,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupinclusivexor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002936,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupexclusiveadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002937,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupexclusivemul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002938,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupexclusivemin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002939,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupexclusivemax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002940,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupexclusiveand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002941,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupexclusiveor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002942,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupexclusivexor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002943,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002944,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002945,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002946,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002947,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002948,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002949,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupxor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002950,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002951,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002952,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002953,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002954,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002955,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002956,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivexor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002957,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002958,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002959,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002960,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002961,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002962,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002963,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivexor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002964,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002965,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002966,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002967,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002968,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002969,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002970,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupxor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002971,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002972,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002973,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002974,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002975,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002976,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002977,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivexor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002978,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002979,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002980,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002981,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002982,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002983,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002984,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivexor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002985,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002986,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002987,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002988,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002989,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002990,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002991,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupxor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002992,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002993,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002994,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002995,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002996,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002997,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002998,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivexor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002999,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003000,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003001,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003002,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003003,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003004,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003005,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivexor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003006,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003007,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003008,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003009,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003010,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003011,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003012,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupxor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003013,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003014,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003015,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003016,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003017,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003018,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupinclusiveor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003019,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivexor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003020,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003021,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003022,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003023,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003024,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003025,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupexclusiveor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003026,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivexor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003027,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003028,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003029,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003030,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003031,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003032,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003033,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupxor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003034,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003035,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003036,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003037,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003038,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003039,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003040,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivexor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003041,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003042,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003043,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003044,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003045,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003046,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003047,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivexor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003048,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003049,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003050,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003051,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003052,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003053,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003054,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupxor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003055,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003056,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003057,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003058,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003059,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003060,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003061,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivexor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003062,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003063,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003064,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003065,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003066,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003067,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003068,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivexor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003069,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003070,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003071,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003072,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003073,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003074,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003075,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupxor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003076,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003077,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003078,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003079,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003080,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003081,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003082,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivexor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003083,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003084,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003085,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003086,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003087,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003088,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003089,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivexor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003090,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003091,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003092,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003093,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003094,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003095,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003096,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003097,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003098,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003099,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003100,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003101,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003102,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003103,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003104,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003105,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003106,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003107,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003108,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003109,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003110,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003111,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003112,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003113,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003114,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003115,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003116,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003117,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003118,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003119,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003120,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003121,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003122,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003123,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003124,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003125,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003126,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003127,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003128,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003129,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupmax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003130,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003131,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003132,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003133,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003134,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003135,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003136,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003137,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003138,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003139,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003140,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003141,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003142,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.graphics.subgroupinclusiveadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003143,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.graphics.subgroupinclusivemul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003144,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.graphics.subgroupinclusivemin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003145,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.graphics.subgroupinclusivemax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003146,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.graphics.subgroupexclusiveadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003147,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.graphics.subgroupexclusivemul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003148,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.graphics.subgroupexclusivemin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003149,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.graphics.subgroupexclusivemax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003150,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003151,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003152,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003153,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003154,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003155,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003156,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003157,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003158,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003159,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003160,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003161,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003162,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003163,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003164,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003165,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003166,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003167,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003168,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003169,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003170,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003171,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003172,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003173,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003174,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003175,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003176,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003177,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupmax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003178,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003179,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003180,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003181,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivemax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003182,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003183,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003184,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003185,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivemax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003186,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003187,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003188,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupxor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003189,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003190,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupinclusiveor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003191,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivexor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003192,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003193,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.graphics.subgroupexclusiveor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003194,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivexor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003195,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003196,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003197,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupxor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003198,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003199,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003200,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivexor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003201,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003202,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003203,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivexor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003204,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003205,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003206,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupxor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003207,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003208,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003209,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivexor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003210,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003211,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003212,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivexor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003213,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003214,
        "KHR-Single-GLES32.subgroups.part",
        "itioned.graphics.subgroupor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003215,
        "KHR-Single-GLES32.subgroups.parti",
        "tioned.graphics.subgroupxor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003216,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003217,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusiveor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003218,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupinclusivexor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003219,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003220,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusiveor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_003221,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.graphics.subgroupexclusivexor_bvec4");
