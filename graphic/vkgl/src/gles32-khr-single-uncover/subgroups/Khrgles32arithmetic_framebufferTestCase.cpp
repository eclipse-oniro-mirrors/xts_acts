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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001122,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.framebuffer.subgroupadd_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001123,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupadd_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001124,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupadd_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001125,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupadd_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001126,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.framebuffer.subgroupmul_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001127,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmul_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001128,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmul_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001129,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmul_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001130,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.framebuffer.subgroupmin_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001131,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmin_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001132,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmin_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001133,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmin_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001134,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.framebuffer.subgroupmax_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001135,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmax_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001136,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmax_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001137,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmax_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001138,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.framebuffer.subgroupand_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001139,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001140,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupand_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001141,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupand_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001142,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.framebuffer.subgroupor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001143,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001144,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001145,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001146,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.framebuffer.subgroupxor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001147,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001148,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupxor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001149,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupxor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001150,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveadd_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001151,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveadd_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001152,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveadd_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001153,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveadd_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001154,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusivemul_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001155,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemul_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001156,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusivemul_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001157,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemul_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001158,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusivemin_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001159,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemin_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001160,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusivemin_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001161,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemin_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001162,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusivemax_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001163,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemax_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001164,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusivemax_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001165,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemax_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001166,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveand_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001167,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveand_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001168,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveand_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001169,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveand_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001170,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupinclusiveor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001171,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001172,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001173,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001174,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusivexor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001175,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivexor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001176,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusivexor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001177,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivexor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001178,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveadd_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001179,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveadd_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001180,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveadd_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001181,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveadd_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001182,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusivemul_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001183,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemul_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001184,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusivemul_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001185,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemul_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001186,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusivemin_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001187,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemin_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001188,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusivemin_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001189,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemin_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001190,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusivemax_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001191,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemax_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001192,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusivemax_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001193,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemax_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001194,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveand_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001195,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveand_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001196,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveand_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001197,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveand_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001198,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupexclusiveor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001199,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001200,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001201,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001202,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusivexor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001203,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivexor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001204,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusivexor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001205,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivexor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001206,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupadd_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001207,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupadd_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001208,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupadd_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001209,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupadd_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001210,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmul_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001211,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmul_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001212,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmul_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001213,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmul_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001214,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmin_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001215,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmin_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001216,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmin_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001217,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmin_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001218,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmax_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001219,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmax_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001220,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmax_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001221,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmax_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001222,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupand_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001223,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupand_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001224,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupand_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001225,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001226,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001227,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001228,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001229,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001230,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupxor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001231,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupxor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001232,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupxor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001233,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001234,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveadd_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001235,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001236,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveadd_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001237,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001238,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemul_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001239,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001240,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemul_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001241,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001242,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemin_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001243,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001244,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemin_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001245,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001246,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemax_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001247,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemax_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001248,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemax_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001249,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemax_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001250,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveand_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001251,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001252,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveand_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001253,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001254,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001255,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001256,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001257,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001258,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivexor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001259,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001260,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivexor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001261,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001262,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveadd_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001263,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveadd_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001264,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusiveadd_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001265,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveadd_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001266,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemul_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001267,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001268,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemul_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001269,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001270,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemin_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001271,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001272,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemin_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001273,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001274,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemax_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001275,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001276,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemax_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001277,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001278,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveand_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001279,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001280,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusiveand_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001281,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001282,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001283,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001284,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001285,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001286,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivexor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001287,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001288,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivexor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001289,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001290,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupadd_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001291,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupadd_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001292,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupadd_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001293,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupadd_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001294,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmul_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001295,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmul_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001296,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmul_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001297,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmul_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001298,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmin_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001299,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmin_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001300,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmin_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001301,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmin_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001302,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmax_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001303,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmax_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001304,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmax_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001305,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmax_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001306,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupand_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001307,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupand_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001308,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupand_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001309,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001310,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001311,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001312,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001313,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001314,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupxor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001315,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupxor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001316,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupxor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001317,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001318,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveadd_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001319,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001320,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveadd_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001321,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001322,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemul_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001323,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001324,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemul_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001325,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001326,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemin_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001327,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001328,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemin_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001329,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001330,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemax_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001331,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemax_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001332,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemax_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001333,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemax_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001334,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveand_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001335,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001336,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveand_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001337,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001338,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001339,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001340,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001341,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001342,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivexor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001343,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001344,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivexor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001345,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001346,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveadd_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001347,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveadd_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001348,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusiveadd_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001349,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveadd_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001350,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemul_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001351,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001352,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemul_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001353,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001354,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemin_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001355,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001356,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemin_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001357,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001358,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemax_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001359,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001360,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemax_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001361,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001362,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveand_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001363,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001364,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusiveand_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001365,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001366,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001367,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001368,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001369,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001370,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivexor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001371,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001372,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivexor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001373,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001374,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupadd_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001375,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupadd_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001376,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupadd_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001377,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupadd_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001378,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmul_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001379,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmul_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001380,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmul_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001381,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmul_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001382,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmin_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001383,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmin_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001384,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmin_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001385,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmin_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001386,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmax_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001387,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmax_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001388,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmax_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001389,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmax_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001390,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupand_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001391,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupand_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001392,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupand_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001393,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001394,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001395,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001396,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001397,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001398,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupxor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001399,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupxor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001400,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupxor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001401,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001402,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveadd_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001403,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001404,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveadd_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001405,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001406,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemul_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001407,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001408,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemul_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001409,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001410,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemin_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001411,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001412,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemin_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001413,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001414,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemax_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001415,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemax_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001416,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemax_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001417,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemax_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001418,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveand_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001419,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001420,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveand_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001421,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001422,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001423,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001424,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001425,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001426,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivexor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001427,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001428,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivexor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001429,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001430,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveadd_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001431,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveadd_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001432,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusiveadd_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001433,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveadd_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001434,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemul_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001435,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001436,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemul_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001437,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001438,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemin_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001439,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001440,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemin_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001441,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001442,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemax_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001443,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001444,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivemax_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001445,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001446,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveand_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001447,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001448,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusiveand_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001449,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001450,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001451,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001452,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001453,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001454,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivexor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001455,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001456,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupexclusivexor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001457,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001458,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupadd_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001459,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupadd_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001460,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupadd_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001461,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupadd_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001462,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmul_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001463,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmul_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001464,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmul_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001465,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmul_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001466,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmin_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001467,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmin_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001468,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmin_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001469,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmin_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001470,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmax_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001471,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmax_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001472,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmax_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001473,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmax_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001474,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupand_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001475,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001476,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupand_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001477,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001478,
        "KHR-Single-GLES32.subgroups.arithmet",
        "ic.framebuffer.subgroupor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001479,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001480,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001481,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001482,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupxor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001483,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001484,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupxor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001485,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001486,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveadd_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001487,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001488,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveadd_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001489,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveadd_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001490,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusivemul_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001491,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001492,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusivemul_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001493,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemul_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001494,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusivemin_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001495,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001496,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusivemin_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001497,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemin_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001498,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusivemax_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001499,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemax_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001500,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusivemax_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001501,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemax_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001502,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveand_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001503,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveand_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001504,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveand_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001505,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveand_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001506,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusiveor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001507,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001508,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusiveor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001509,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001510,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupinclusivexor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001511,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivexor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001512,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupinclusivexor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001513,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivexor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001514,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveadd_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001515,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveadd_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001516,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveadd_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001517,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveadd_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001518,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusivemul_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001519,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemul_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001520,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusivemul_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001521,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemul_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001522,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusivemin_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001523,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemin_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001524,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusivemin_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001525,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemin_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001526,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusivemax_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001527,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivemax_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001528,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusivemax_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001529,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivemax_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001530,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveand_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001531,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusiveand_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001532,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveand_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001533,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveand_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001534,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusiveor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001535,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001536,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusiveor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001537,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusiveor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001538,
        "KHR-Single-GLES32.subgroups.arithmetic.fr",
        "amebuffer.subgroupexclusivexor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001539,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupexclusivexor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001540,
        "KHR-Single-GLES32.subgroups.arithmetic.frame",
        "buffer.subgroupexclusivexor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001541,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupexclusivexor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001542,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupadd_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001543,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupadd_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001544,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupadd_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001545,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupadd_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001546,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmul_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001547,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmul_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001548,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmul_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001549,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmul_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001550,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmin_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001551,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmin_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001552,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmin_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001553,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmin_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001554,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupmax_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001555,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupmax_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001556,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupmax_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001557,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupmax_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001558,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupand_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001559,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupand_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001560,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupand_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001561,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupand_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001562,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001563,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001564,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001565,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001566,
        "KHR-Single-GLES32.subgroups.arithmeti",
        "c.framebuffer.subgroupxor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001567,
        "KHR-Single-GLES32.subgroups.arithmetic.",
        "framebuffer.subgroupxor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001568,
        "KHR-Single-GLES32.subgroups.arithmetic.f",
        "ramebuffer.subgroupxor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001569,
        "KHR-Single-GLES32.subgroups.arithmetic",
        ".framebuffer.subgroupxor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001570,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusiveadd_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001571,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001572,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusiveadd_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001573,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusiveadd_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001574,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemul_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001575,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001576,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemul_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001577,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemul_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001578,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemin_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001579,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001580,
        "KHR-Single-GLES32.subgroups.arithmetic.frameb",
        "uffer.subgroupinclusivemin_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001581,
        "KHR-Single-GLES32.subgroups.arithmetic.fram",
        "ebuffer.subgroupinclusivemin_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0002TestSuite, TestCase_001582,
        "KHR-Single-GLES32.subgroups.arithmetic.fra",
        "mebuffer.subgroupinclusivemax_uvec2_vertex");
