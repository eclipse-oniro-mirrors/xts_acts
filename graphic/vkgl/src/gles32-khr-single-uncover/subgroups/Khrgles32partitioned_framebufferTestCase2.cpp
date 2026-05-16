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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004007,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004008,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004009,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004010,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004011,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004012,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004013,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004014,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004015,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004016,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004017,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004018,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004019,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004020,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004021,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004022,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004023,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004024,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004025,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004026,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004027,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004028,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004029,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004030,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004031,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004032,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004033,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004034,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004035,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004036,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004037,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004038,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004039,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004040,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004041,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004042,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004043,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004044,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004045,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004046,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004047,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004048,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004049,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004050,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004051,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004052,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004053,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004054,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004055,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004056,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004057,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004058,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004059,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004060,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004061,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004062,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004063,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004064,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004065,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004066,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004067,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004068,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004069,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004070,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004071,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004072,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004073,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004074,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004075,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004076,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004077,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004078,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004079,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004080,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004081,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004082,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004083,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004084,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004085,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004086,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004087,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004088,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004089,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004090,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004091,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004092,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004093,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004094,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004095,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004096,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004097,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004098,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004099,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004100,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004101,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004102,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004103,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004104,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004105,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004106,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004107,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004108,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004109,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004110,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004111,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004112,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004113,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004114,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004115,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004116,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004117,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004118,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004119,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004120,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004121,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004122,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004123,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004124,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004125,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004126,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004127,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004128,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004129,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004130,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004131,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004132,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004133,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004134,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004135,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004136,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004137,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004138,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004139,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004140,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004141,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004142,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004143,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004144,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004145,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004146,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004147,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004148,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004149,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004150,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004151,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004152,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004153,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004154,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004155,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004156,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004157,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004158,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004159,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004160,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004161,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004162,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004163,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004164,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004165,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004166,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004167,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004168,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004169,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004170,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004171,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004172,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004173,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004174,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004175,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004176,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004177,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004178,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004179,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004180,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004181,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004182,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004183,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004184,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004185,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004186,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004187,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004188,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004189,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004190,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004191,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004192,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004193,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004194,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004195,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004196,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004197,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004198,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004199,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004200,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004201,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004202,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004203,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004204,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004205,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004206,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004207,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004208,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004209,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004210,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004211,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004212,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004213,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004214,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004215,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004216,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004217,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004218,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004219,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004220,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004221,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004222,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004223,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004224,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004225,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004226,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004227,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004228,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004229,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004230,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004231,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004232,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004233,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004234,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004235,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004236,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004237,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004238,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004239,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004240,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004241,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004242,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupadd_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004243,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004244,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004245,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004246,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmul_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004247,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004248,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004249,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004250,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmin_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004251,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004252,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004253,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004254,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmax_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004255,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004256,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004257,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004258,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004259,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004260,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004261,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004262,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004263,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004264,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004265,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004266,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004267,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004268,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004269,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004270,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004271,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004272,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004273,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004274,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004275,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004276,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004277,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004278,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004279,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004280,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004281,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004282,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004283,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004284,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004285,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004286,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004287,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004288,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004289,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004290,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupadd_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004291,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004292,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004293,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004294,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmul_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004295,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004296,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004297,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004298,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmin_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004299,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004300,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004301,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004302,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmax_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004303,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004304,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004305,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004306,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004307,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004308,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004309,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004310,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004311,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004312,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004313,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004314,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004315,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004316,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004317,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004318,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004319,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004320,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004321,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004322,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004323,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004324,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004325,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004326,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004327,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004328,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004329,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004330,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004331,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004332,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004333,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004334,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004335,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004336,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004337,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004338,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupadd_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004339,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004340,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004341,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004342,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmul_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004343,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004344,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004345,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004346,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmin_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004347,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004348,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004349,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004350,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmax_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004351,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004352,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004353,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004354,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004355,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004356,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004357,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004358,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004359,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004360,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004361,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004362,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004363,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004364,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004365,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004366,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004367,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004368,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004369,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004370,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004371,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004372,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004373,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004374,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004375,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004376,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004377,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004378,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004379,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004380,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004381,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004382,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004383,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004384,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004385,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004386,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004387,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004388,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004389,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004390,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004391,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004392,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004393,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004394,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004395,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004396,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004397,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004398,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004399,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004400,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004401,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004402,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004403,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004404,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupinclusiveadd_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004405,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004406,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004407,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004408,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupinclusivemul_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004409,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004410,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004411,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004412,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupinclusivemin_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004413,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004414,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004415,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004416,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupinclusivemax_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004417,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004418,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004419,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004420,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupexclusiveadd_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004421,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004422,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004423,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004424,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupexclusivemul_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004425,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004426,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004427,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004428,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupexclusivemin_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004429,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004430,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004431,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004432,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupexclusivemax_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004433,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004434,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004435,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004436,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004437,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004438,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004439,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004440,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004441,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004442,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004443,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004444,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004445,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004446,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004447,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004448,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004449,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004450,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004451,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004452,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004453,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004454,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004455,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004456,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004457,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004458,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004459,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004460,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004461,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004462,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004463,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004464,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004465,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004466,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004467,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004468,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004469,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004470,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004471,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004472,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004473,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004474,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004475,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004476,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004477,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004478,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004479,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004480,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004481,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004482,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004483,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004484,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004485,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004486,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004487,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004488,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004489,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0004TestSuite, TestCase_004490,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_dvec3_vertex");
