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
#include "../ActsGles32KhrSingleUncover0002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002071,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_dvec2_tess_eval");
        
static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002072,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemul_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002073,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002074,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemin_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002075,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002076,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemin_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002077,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002078,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemax_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002079,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002080,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemax_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002081,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002082,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupadd_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002083,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupadd_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002084,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupadd_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002085,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupadd_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002086,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmul_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002087,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmul_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002088,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmul_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002089,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmul_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002090,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmin_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002091,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmin_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002092,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmin_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002093,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmin_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002094,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmax_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002095,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmax_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002096,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmax_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002097,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmax_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002098,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveadd_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002099,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002100,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveadd_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002101,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002102,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemul_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002103,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002104,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemul_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002105,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002106,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemin_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002107,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002108,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemin_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002109,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002110,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemax_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002111,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemax_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002112,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemax_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002113,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemax_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002114,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveadd_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002115,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveadd_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002116,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusiveadd_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002117,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveadd_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002118,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemul_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002119,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002120,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemul_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002121,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002122,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemin_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002123,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002124,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemin_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002125,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002126,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemax_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002127,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002128,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemax_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002129,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002130,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupadd_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002131,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupadd_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002132,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupadd_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002133,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupadd_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002134,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmul_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002135,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmul_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002136,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmul_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002137,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmul_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002138,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmin_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002139,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmin_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002140,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmin_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002141,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmin_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002142,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmax_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002143,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmax_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002144,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmax_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002145,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmax_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002146,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveadd_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002147,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002148,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveadd_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002149,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002150,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemul_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002151,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002152,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemul_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002153,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002154,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemin_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002155,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002156,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemin_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002157,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002158,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemax_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002159,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemax_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002160,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemax_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002161,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemax_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002162,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveadd_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002163,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveadd_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002164,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusiveadd_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002165,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveadd_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002166,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemul_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002167,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002168,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemul_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002169,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002170,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemin_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002171,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002172,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemin_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002173,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002174,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemax_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002175,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002176,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemax_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002177,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002178,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupand_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002179,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002180,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupand_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002181,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002182,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.framebuffer.subgroupor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002183,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002184,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002185,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002186,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupxor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002187,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002188,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupxor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002189,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002190,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveand_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002191,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002192,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveand_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002193,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveand_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002194,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002195,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002196,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002197,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002198,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusivexor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002199,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002200,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusivexor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002201,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivexor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002202,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveand_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002203,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002204,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveand_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002205,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveand_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002206,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002207,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002208,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002209,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002210,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusivexor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002211,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002212,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusivexor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002213,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivexor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002214,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupand_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002215,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupand_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002216,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupand_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002217,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002218,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002219,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002220,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002221,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002222,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupxor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002223,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupxor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002224,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupxor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002225,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002226,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveand_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002227,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002228,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveand_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002229,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002230,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002231,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002232,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002233,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002234,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivexor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002235,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002236,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivexor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002237,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002238,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveand_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002239,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002240,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusiveand_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002241,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002242,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002243,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002244,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002245,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002246,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivexor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002247,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002248,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivexor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002249,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002250,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupand_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002251,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupand_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002252,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupand_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002253,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002254,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002255,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002256,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002257,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002258,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupxor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002259,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupxor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002260,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupxor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002261,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002262,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveand_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002263,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002264,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveand_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002265,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002266,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002267,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002268,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002269,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002270,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivexor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002271,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002272,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivexor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002273,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002274,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveand_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002275,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002276,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusiveand_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002277,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002278,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002279,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002280,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002281,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002282,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivexor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002283,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002284,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivexor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002285,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002286,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupand_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002287,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupand_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002288,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupand_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002289,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002290,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002291,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002292,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002293,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002294,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupxor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002295,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupxor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002296,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupxor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002297,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002298,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveand_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002299,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002300,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveand_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002301,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002302,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002303,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002304,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002305,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002306,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivexor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002307,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002308,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivexor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002309,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002310,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveand_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002311,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002312,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusiveand_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002313,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002314,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002315,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002316,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002317,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002318,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivexor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002319,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002320,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivexor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_002321,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_bvec4_geometry");
