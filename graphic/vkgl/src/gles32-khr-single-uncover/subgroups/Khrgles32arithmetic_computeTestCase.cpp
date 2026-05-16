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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000822,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000823,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000824,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000825,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000826,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000827,
        "KHR-Single-GLES32.subgroups.ar",
        "ithmetic.compute.subgroupor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000828,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupxor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000829,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupinclusiveadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000830,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupinclusivemul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000831,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupinclusivemin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000832,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupinclusivemax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000833,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupinclusiveand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000834,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupinclusiveor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000835,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupinclusivexor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000836,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupexclusiveadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000837,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupexclusivemul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000838,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupexclusivemin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000839,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupexclusivemax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000840,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupexclusiveand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000841,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupexclusiveor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000842,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupexclusivexor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000843,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000844,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000845,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000846,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000847,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000848,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000849,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupxor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000850,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000851,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000852,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000853,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000854,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000855,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000856,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivexor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000857,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000858,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000859,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000860,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000861,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000862,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000863,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivexor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000864,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000865,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000866,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000867,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000868,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000869,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000870,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupxor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000871,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000872,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000873,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000874,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000875,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000876,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000877,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivexor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000878,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000879,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000880,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000881,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000882,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000883,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000884,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivexor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000885,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000886,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000887,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000888,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000889,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000890,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000891,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupxor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000892,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000893,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000894,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000895,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000896,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000897,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000898,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivexor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000899,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000900,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000901,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000902,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000903,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000904,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000905,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivexor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000906,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000907,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000908,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000909,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000910,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000911,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000912,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupxor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000913,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000914,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000915,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000916,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000917,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000918,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupinclusiveor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000919,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivexor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000920,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000921,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000922,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000923,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000924,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000925,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupexclusiveor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000926,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivexor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000927,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000928,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000929,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000930,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000931,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000932,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000933,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupxor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000934,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000935,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000936,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000937,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000938,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000939,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000940,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivexor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000941,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000942,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000943,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000944,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000945,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000946,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000947,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivexor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000948,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000949,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000950,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000951,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000952,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000953,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000954,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupxor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000955,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000956,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000957,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000958,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000959,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000960,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000961,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivexor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000962,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000963,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000964,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000965,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000966,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000967,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000968,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivexor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000969,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000970,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000971,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000972,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000973,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000974,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000975,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupxor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000976,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000977,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000978,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000979,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000980,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000981,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000982,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivexor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000983,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000984,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000985,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000986,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000987,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000988,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000989,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivexor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000990,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000991,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000992,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000993,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000994,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000995,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000996,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000997,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000998,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000999,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001000,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001001,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001002,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001003,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001004,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001005,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001006,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001007,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001008,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001009,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001010,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001011,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001012,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001013,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001014,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001015,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001016,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001017,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001018,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001019,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001020,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001021,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001022,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001023,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001024,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001025,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001026,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001027,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001028,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001029,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupmax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001030,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001031,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001032,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001033,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001034,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001035,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001036,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001037,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001038,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001039,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001040,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001041,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001042,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.compute.subgroupinclusiveadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001043,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.compute.subgroupinclusivemul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001044,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.compute.subgroupinclusivemin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001045,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.compute.subgroupinclusivemax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001046,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.compute.subgroupexclusiveadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001047,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.compute.subgroupexclusivemul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001048,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.compute.subgroupexclusivemin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001049,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.compute.subgroupexclusivemax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001050,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001051,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001052,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001053,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001054,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001055,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001056,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001057,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001058,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001059,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001060,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001061,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001062,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001063,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001064,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001065,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001066,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001067,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001068,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001069,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001070,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001071,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001072,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001073,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001074,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001075,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001076,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001077,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupmax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001078,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001079,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001080,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001081,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivemax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001082,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001083,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001084,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001085,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivemax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001086,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001087,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001088,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupxor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001089,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001090,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupinclusiveor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001091,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivexor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001092,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001093,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.compute.subgroupexclusiveor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001094,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivexor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001095,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001096,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001097,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupxor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001098,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001099,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001100,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivexor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001101,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001102,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001103,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivexor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001104,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001105,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001106,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupxor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001107,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001108,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001109,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivexor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001110,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001111,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001112,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivexor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001113,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001114,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.compute.subgroupor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001115,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.compute.subgroupxor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001116,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001117,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusiveor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001118,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupinclusivexor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001119,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001120,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusiveor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_001121,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.compute.subgroupexclusivexor_bvec4");
