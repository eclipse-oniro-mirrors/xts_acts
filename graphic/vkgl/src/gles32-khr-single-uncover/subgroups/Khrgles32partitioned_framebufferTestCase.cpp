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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003522,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupadd_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003523,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003524,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003525,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003526,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmul_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003527,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003528,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003529,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003530,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmin_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003531,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003532,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003533,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003534,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmax_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003535,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003536,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003537,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003538,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupand_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003539,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003540,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupand_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003541,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003542,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.framebuffer.subgroupor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003543,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003544,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003545,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003546,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupxor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003547,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003548,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupxor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003549,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003550,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusiveadd_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003551,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003552,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003553,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003554,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusivemul_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003555,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003556,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003557,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003558,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusivemin_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003559,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003560,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003561,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003562,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusivemax_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003563,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003564,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003565,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003566,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusiveand_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003567,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003568,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003569,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003570,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusiveor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003571,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003572,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003573,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003574,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusivexor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003575,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003576,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003577,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003578,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusiveadd_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003579,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003580,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003581,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003582,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusivemul_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003583,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003584,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003585,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003586,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusivemin_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003587,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003588,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003589,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003590,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusivemax_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003591,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003592,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003593,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003594,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusiveand_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003595,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003596,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003597,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003598,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusiveor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003599,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003600,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003601,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003602,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusivexor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003603,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003604,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003605,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003606,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003607,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003608,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003609,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003610,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003611,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003612,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003613,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003614,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003615,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003616,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003617,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003618,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003619,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003620,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003621,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003622,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003623,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003624,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003625,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003626,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003627,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003628,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003629,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003630,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003631,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003632,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003633,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003634,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003635,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003636,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003637,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003638,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003639,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003640,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003641,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003642,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003643,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003644,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003645,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003646,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003647,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003648,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003649,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003650,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003651,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003652,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003653,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003654,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003655,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003656,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003657,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003658,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003659,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003660,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003661,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003662,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003663,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003664,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003665,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003666,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003667,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003668,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003669,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003670,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003671,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003672,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003673,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003674,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003675,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003676,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003677,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003678,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003679,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003680,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003681,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003682,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003683,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003684,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003685,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003686,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003687,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003688,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003689,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003690,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003691,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003692,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003693,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003694,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003695,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003696,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003697,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003698,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003699,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003700,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003701,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003702,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003703,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003704,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003705,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003706,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003707,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003708,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003709,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003710,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003711,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003712,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003713,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003714,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003715,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003716,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003717,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003718,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003719,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003720,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003721,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003722,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003723,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003724,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003725,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003726,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003727,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003728,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003729,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003730,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003731,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003732,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003733,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003734,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003735,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003736,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003737,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003738,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003739,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003740,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003741,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003742,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003743,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003744,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003745,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003746,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003747,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003748,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003749,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003750,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003751,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003752,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003753,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003754,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003755,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003756,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003757,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003758,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003759,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003760,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003761,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003762,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003763,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003764,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003765,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003766,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003767,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003768,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003769,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003770,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003771,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003772,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003773,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003774,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003775,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003776,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003777,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003778,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003779,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003780,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003781,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003782,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003783,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003784,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003785,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003786,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003787,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003788,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003789,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003790,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003791,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003792,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003793,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003794,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003795,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003796,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003797,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003798,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003799,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003800,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003801,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003802,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003803,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003804,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003805,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003806,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003807,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003808,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003809,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003810,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003811,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003812,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003813,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003814,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003815,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003816,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003817,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003818,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003819,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003820,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003821,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003822,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003823,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003824,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003825,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003826,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003827,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003828,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003829,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003830,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003831,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003832,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003833,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003834,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003835,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003836,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003837,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003838,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003839,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003840,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003841,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003842,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003843,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003844,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003845,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003846,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003847,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003848,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003849,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003850,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003851,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003852,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003853,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003854,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003855,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003856,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003857,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003858,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupadd_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003859,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003860,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003861,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003862,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmul_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003863,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003864,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003865,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003866,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmin_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003867,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003868,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003869,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003870,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmax_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003871,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003872,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003873,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003874,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupand_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003875,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003876,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupand_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003877,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003878,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003879,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003880,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003881,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003882,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupxor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003883,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003884,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupxor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003885,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003886,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003887,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003888,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003889,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003890,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003891,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003892,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003893,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003894,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003895,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003896,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003897,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003898,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003899,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003900,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003901,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003902,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003903,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003904,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003905,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003906,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusiveor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003907,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003908,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003909,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003910,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003911,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003912,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003913,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003914,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003915,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003916,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003917,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003918,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003919,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003920,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003921,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003922,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003923,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003924,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003925,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003926,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003927,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003928,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003929,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003930,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003931,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003932,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003933,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003934,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusiveor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003935,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003936,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003937,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003938,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003939,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003940,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003941,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003942,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003943,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003944,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003945,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003946,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003947,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003948,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003949,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003950,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003951,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003952,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003953,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003954,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003955,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003956,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003957,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003958,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003959,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003960,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003961,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003962,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003963,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003964,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003965,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003966,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003967,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003968,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003969,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003970,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003971,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003972,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003973,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003974,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003975,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003976,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003977,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003978,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003979,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003980,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003981,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003982,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003983,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003984,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003985,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003986,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003987,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003988,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003989,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003990,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003991,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003992,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003993,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003994,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003995,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003996,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003997,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003998,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_003999,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004000,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004001,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004002,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004003,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004004,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004005,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004006,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_uvec2_vertex");
