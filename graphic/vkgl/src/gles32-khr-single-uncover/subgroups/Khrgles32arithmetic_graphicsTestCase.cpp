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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000522,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.graphics.subgroupadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000523,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.graphics.subgroupmul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000524,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.graphics.subgroupmin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000525,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.graphics.subgroupmax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000526,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.graphics.subgroupand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000527,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.graphics.subgroupor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000528,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.graphics.subgroupxor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000529,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000530,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000531,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000532,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000533,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000534,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.graphics.subgroupinclusiveor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000535,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivexor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000536,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000537,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000538,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000539,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000540,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000541,
        "KHR-Single-GLES32.subgroups.arithme",
        "tic.graphics.subgroupexclusiveor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000542,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivexor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000543,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000544,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000545,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000546,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000547,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000548,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000549,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupxor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000550,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000551,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000552,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000553,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000554,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000555,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000556,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivexor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000557,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000558,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000559,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000560,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000561,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000562,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000563,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivexor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000564,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000565,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000566,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000567,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000568,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000569,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000570,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupxor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000571,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000572,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000573,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000574,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000575,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000576,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000577,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivexor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000578,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000579,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000580,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000581,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000582,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000583,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000584,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivexor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000585,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000586,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000587,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000588,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000589,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000590,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000591,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupxor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000592,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000593,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000594,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000595,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000596,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000597,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000598,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivexor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000599,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000600,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000601,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000602,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000603,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000604,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000605,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivexor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000606,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000607,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000608,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000609,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000610,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000611,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.graphics.subgroupor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000612,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupxor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000613,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000614,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000615,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000616,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000617,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000618,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000619,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivexor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000620,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000621,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000622,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000623,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000624,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000625,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000626,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivexor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000627,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000628,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000629,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000630,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000631,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000632,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000633,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupxor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000634,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000635,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000636,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000637,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000638,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000639,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000640,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivexor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000641,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000642,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000643,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000644,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000645,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000646,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000647,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivexor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000648,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000649,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000650,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000651,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000652,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000653,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000654,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupxor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000655,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000656,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000657,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000658,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000659,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000660,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000661,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivexor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000662,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000663,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000664,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000665,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000666,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000667,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000668,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivexor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000669,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000670,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000671,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000672,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000673,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000674,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000675,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupxor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000676,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000677,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000678,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000679,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000680,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000681,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000682,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivexor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000683,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000684,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000685,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000686,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000687,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000688,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000689,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivexor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000690,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000691,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000692,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000693,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000694,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000695,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000696,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000697,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000698,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000699,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000700,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000701,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000702,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000703,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000704,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000705,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000706,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000707,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000708,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000709,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000710,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000711,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000712,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000713,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000714,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000715,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000716,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000717,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000718,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000719,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000720,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000721,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000722,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000723,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000724,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000725,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000726,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000727,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000728,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000729,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000730,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000731,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000732,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000733,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivemax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000734,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000735,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000736,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000737,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivemax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000738,
        "KHR-Single-GLES32.subgroups.arith",
        "metic.graphics.subgroupadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000739,
        "KHR-Single-GLES32.subgroups.arith",
        "metic.graphics.subgroupmul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000740,
        "KHR-Single-GLES32.subgroups.arith",
        "metic.graphics.subgroupmin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000741,
        "KHR-Single-GLES32.subgroups.arith",
        "metic.graphics.subgroupmax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000742,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000743,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000744,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000745,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000746,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000747,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000748,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000749,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000750,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000751,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000752,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000753,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000754,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000755,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000756,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000757,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000758,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000759,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000760,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000761,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000762,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000763,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000764,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000765,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000766,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000767,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000768,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000769,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000770,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000771,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000772,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000773,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000774,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000775,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000776,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000777,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupmax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000778,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000779,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000780,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000781,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivemax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000782,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000783,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000784,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000785,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivemax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000786,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000787,
        "KHR-Single-GLES32.subgroups.ari",
        "thmetic.graphics.subgroupor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000788,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupxor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000789,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000790,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000791,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusivexor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000792,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000793,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000794,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusivexor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000795,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000796,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000797,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupxor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000798,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000799,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000800,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivexor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000801,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000802,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000803,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivexor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000804,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000805,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000806,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupxor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000807,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000808,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000809,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivexor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000810,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000811,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000812,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivexor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000813,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000814,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000815,
        "KHR-Single-GLES32.subgroups.arit",
        "hmetic.graphics.subgroupxor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000816,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusiveand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000817,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupinclusiveor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000818,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupinclusivexor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000819,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusiveand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000820,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.graphics.subgroupexclusiveor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000821,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.graphics.subgroupexclusivexor_bvec4");
