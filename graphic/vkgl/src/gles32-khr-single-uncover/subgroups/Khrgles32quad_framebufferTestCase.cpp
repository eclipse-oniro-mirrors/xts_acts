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
#include "../ActsGles32KhrSingleUncover0006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005482,
        "KHR-Single-GLES32.subgroups.quad.frameb",
        "uffer.subgroupquadbroadcast_0_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005483,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005484,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005485,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005486,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswaphorizontal_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005487,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005488,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswaphorizontal_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005489,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005490,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapvertical_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005491,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005492,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapvertical_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005493,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005494,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapdiagonal_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005495,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005496,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapdiagonal_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005497,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005498,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005499,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005500,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005501,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005502,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005503,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005504,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005505,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005506,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005507,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005508,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005509,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005510,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005511,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005512,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005513,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005514,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005515,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005516,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005517,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005518,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005519,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005520,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005521,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005522,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005523,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005524,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005525,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005526,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005527,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005528,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005529,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005530,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005531,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005532,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005533,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005534,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005535,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005536,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005537,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005538,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005539,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005540,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005541,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005542,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005543,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005544,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005545,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005546,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005547,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005548,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005549,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005550,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswaphorizontal_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005551,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005552,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswaphorizontal_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005553,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005554,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapvertical_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005555,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005556,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapvertical_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005557,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005558,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapdiagonal_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005559,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005560,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapdiagonal_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005561,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005562,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005563,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005564,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005565,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005566,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005567,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005568,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005569,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005570,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005571,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005572,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005573,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005574,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005575,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005576,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005577,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005578,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005579,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005580,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005581,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005582,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005583,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005584,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005585,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005586,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005587,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005588,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005589,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005590,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005591,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005592,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005593,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005594,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005595,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005596,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005597,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005598,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005599,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005600,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005601,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005602,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005603,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005604,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005605,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005606,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005607,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005608,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005609,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005610,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005611,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005612,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005613,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005614,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005615,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005616,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005617,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005618,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005619,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005620,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005621,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005622,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005623,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005624,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005625,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005626,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005627,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005628,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005629,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005630,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswaphorizontal_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005631,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005632,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswaphorizontal_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005633,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005634,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapvertical_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005635,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005636,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapvertical_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005637,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005638,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapdiagonal_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005639,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005640,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapdiagonal_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005641,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005642,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005643,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005644,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005645,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005646,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswaphorizontal_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005647,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005648,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswaphorizontal_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005649,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005650,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapvertical_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005651,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005652,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapvertical_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005653,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005654,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapdiagonal_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005655,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005656,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapdiagonal_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005657,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005658,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005659,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005660,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005661,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005662,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswaphorizontal_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005663,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005664,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswaphorizontal_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005665,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005666,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapvertical_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005667,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005668,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapvertical_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005669,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005670,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapdiagonal_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005671,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005672,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapdiagonal_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005673,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005674,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005675,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005676,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadbroadcast_0_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005677,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005678,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005679,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswaphorizontal_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005680,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005681,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005682,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005683,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapvertical_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005684,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005685,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005686,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005687,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapdiagonal_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005688,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005689,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005690,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005691,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005692,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005693,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005694,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005695,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005696,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005697,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005698,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005699,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005700,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005701,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005702,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005703,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005704,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005705,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005706,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005707,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005708,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005709,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005710,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005711,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005712,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005713,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005714,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005715,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005716,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005717,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005718,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005719,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005720,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005721,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005722,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005723,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005724,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005725,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005726,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005727,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005728,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005729,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005730,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005731,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005732,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005733,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005734,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005735,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005736,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005737,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005738,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005739,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005740,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005741,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005742,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswaphorizontal_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005743,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005744,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswaphorizontal_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005745,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005746,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapvertical_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005747,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005748,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapvertical_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005749,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005750,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadswapdiagonal_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005751,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005752,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswapdiagonal_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005753,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005754,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005755,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005756,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005757,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005758,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005759,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005760,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005761,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005762,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005763,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005764,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005765,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005766,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005767,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005768,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005769,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005770,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005771,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005772,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005773,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005774,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005775,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005776,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005777,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005778,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005779,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005780,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005781,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005782,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005783,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005784,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005785,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005786,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_0_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005787,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_0_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005788,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_0_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005789,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_0_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005790,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswaphorizontal_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005791,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005792,
        "KHR-Single-GLES32.subgroups.quad.framebuffer.",
        "subgroupquadswaphorizontal_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005793,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadswaphorizontal_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005794,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapvertical_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005795,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005796,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapvertical_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005797,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapvertical_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005798,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadswapdiagonal_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005799,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005800,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadswapdiagonal_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005801,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadswapdiagonal_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005802,
        "KHR-Single-GLES32.subgroups.quad.frameb",
        "uffer.subgroupquadbroadcast_1_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005803,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005804,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005805,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005806,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005807,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005808,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005809,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005810,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005811,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005812,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005813,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005814,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005815,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005816,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005817,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005818,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005819,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005820,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005821,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005822,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005823,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005824,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005825,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005826,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005827,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005828,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005829,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005830,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005831,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005832,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005833,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005834,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005835,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005836,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005837,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005838,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005839,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005840,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005841,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005842,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005843,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005844,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005845,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005846,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005847,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005848,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005849,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005850,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005851,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005852,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadbroadcast_1_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005853,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005854,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005855,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005856,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005857,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005858,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005859,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005860,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005861,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005862,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005863,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005864,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005865,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005866,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005867,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005868,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005869,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005870,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005871,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005872,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005873,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005874,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005875,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005876,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005877,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005878,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_1_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005879,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_1_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005880,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_1_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005881,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_1_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005882,
        "KHR-Single-GLES32.subgroups.quad.frameb",
        "uffer.subgroupquadbroadcast_2_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005883,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005884,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005885,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005886,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005887,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005888,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005889,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005890,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005891,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005892,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005893,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005894,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005895,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005896,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005897,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005898,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005899,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005900,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005901,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005902,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005903,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005904,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005905,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005906,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005907,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005908,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005909,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005910,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005911,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005912,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005913,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005914,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005915,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005916,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005917,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005918,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005919,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005920,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005921,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005922,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005923,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005924,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005925,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005926,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005927,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005928,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005929,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005930,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005931,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005932,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadbroadcast_2_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005933,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005934,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005935,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005936,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005937,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005938,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005939,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005940,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005941,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005942,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005943,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005944,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005945,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005946,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005947,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005948,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005949,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005950,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005951,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005952,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005953,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005954,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005955,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005956,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005957,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005958,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_2_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005959,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_2_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005960,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_2_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005961,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_2_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005962,
        "KHR-Single-GLES32.subgroups.quad.frameb",
        "uffer.subgroupquadbroadcast_3_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005963,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005964,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005965,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005966,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005967,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005968,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005969,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005970,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005971,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005972,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005973,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005974,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005975,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005976,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005977,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005978,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005979,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005980,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005981,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005982,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005983,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005984,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005985,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005986,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005987,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005988,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005989,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005990,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005991,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005992,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005993,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005994,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005995,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005996,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005997,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005998,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_005999,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006000,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006001,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006002,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006003,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006004,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006005,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006006,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006007,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006008,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006009,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006010,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006011,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006012,
        "KHR-Single-GLES32.subgroups.quad.framebuffer",
        ".subgroupquadbroadcast_3_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006013,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006014,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006015,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006016,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006017,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006018,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006019,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006020,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006021,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006022,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006023,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006024,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006025,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006026,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006027,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006028,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006029,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006030,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006031,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006032,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006033,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006034,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006035,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006036,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006037,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006038,
        "KHR-Single-GLES32.subgroups.quad.framebu",
        "ffer.subgroupquadbroadcast_3_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006039,
        "KHR-Single-GLES32.subgroups.quad.framebuff",
        "er.subgroupquadbroadcast_3_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006040,
        "KHR-Single-GLES32.subgroups.quad.framebuffe",
        "r.subgroupquadbroadcast_3_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0006TestSuite, TestCase_006041,
        "KHR-Single-GLES32.subgroups.quad.framebuf",
        "fer.subgroupquadbroadcast_3_bvec4_geometry");
