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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004491,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004492,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004493,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004494,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004495,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004496,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004497,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004498,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004499,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004500,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004501,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004502,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004503,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004504,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004505,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004506,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004507,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004508,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004509,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004510,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004511,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004512,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004513,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004514,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004515,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004516,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004517,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004518,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004519,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004520,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004521,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004522,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004523,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004524,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004525,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004526,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004527,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004528,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004529,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004530,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004531,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004532,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004533,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004534,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004535,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004536,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004537,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004538,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004539,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004540,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004541,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004542,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004543,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004544,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004545,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004546,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004547,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004548,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004549,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004550,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004551,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004552,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004553,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004554,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004555,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004556,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004557,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004558,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004559,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004560,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004561,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004562,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004563,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004564,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004565,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004566,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004567,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004568,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004569,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004570,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004571,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004572,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004573,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004574,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004575,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004576,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004577,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004578,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupand_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004579,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004580,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupand_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004581,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004582,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004583,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004584,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004585,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004586,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupxor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004587,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004588,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupxor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004589,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004590,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004591,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004592,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004593,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004594,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusiveor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004595,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004596,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004597,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004598,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004599,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004600,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004601,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004602,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004603,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004604,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004605,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004606,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusiveor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004607,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004608,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004609,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004610,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004611,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004612,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004613,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004614,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004615,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004616,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004617,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004618,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004619,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004620,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004621,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004622,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004623,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004624,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004625,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004626,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004627,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004628,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004629,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004630,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004631,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004632,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004633,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004634,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004635,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004636,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004637,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004638,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004639,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004640,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004641,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004642,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004643,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004644,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004645,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004646,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004647,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004648,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004649,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004650,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004651,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004652,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004653,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004654,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004655,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004656,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004657,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004658,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004659,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004660,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004661,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004662,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004663,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004664,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004665,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004666,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004667,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004668,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004669,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004670,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004671,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004672,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004673,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004674,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004675,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004676,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004677,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004678,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004679,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004680,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004681,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004682,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004683,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004684,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004685,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004686,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004687,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004688,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004689,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004690,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004691,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004692,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004693,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004694,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004695,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004696,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004697,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004698,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004699,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004700,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004701,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004702,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004703,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004704,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004705,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004706,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004707,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004708,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004709,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004710,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004711,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004712,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004713,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004714,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004715,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004716,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004717,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004718,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004719,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004720,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004721,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_bvec4_geometry");
