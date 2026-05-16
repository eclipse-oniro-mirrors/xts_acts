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
#include "../ActsGles32KhrSingleUncover0005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004882,
        "KHR-Single-GLES32.subgroups.shuffle.f",
        "ramebuffer.subgroupshuffle_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004883,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004884,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffle_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004885,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004886,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshufflexor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004887,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004888,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004889,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004890,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffleup_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004891,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004892,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffleup_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004893,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004894,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffledown_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004895,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004896,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffledown_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004897,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004898,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004899,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004900,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004901,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004902,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004903,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004904,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004905,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004906,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004907,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004908,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004909,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004910,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004911,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004912,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004913,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004914,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004915,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004916,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004917,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004918,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004919,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004920,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004921,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004922,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004923,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004924,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004925,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004926,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004927,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004928,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004929,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004930,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004931,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004932,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004933,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004934,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004935,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004936,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004937,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004938,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004939,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004940,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004941,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004942,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004943,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004944,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004945,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004946,
        "KHR-Single-GLES32.subgroups.shuffle.f",
        "ramebuffer.subgroupshuffle_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004947,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004948,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffle_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004949,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004950,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004951,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004952,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004953,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004954,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffleup_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004955,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004956,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffleup_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004957,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004958,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffledown_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004959,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004960,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffledown_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004961,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004962,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004963,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004964,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004965,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004966,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004967,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004968,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004969,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004970,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004971,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004972,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004973,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004974,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004975,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004976,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004977,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004978,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004979,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004980,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004981,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004982,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004983,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004984,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004985,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004986,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004987,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004988,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004989,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004990,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004991,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004992,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004993,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004994,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004995,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004996,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004997,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004998,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004999,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005000,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005001,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005002,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005003,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005004,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005005,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005006,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005007,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005008,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005009,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005010,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005011,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005012,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005013,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005014,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005015,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005016,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005017,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005018,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005019,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005020,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005021,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005022,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005023,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005024,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005025,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005026,
        "KHR-Single-GLES32.subgroups.shuffle.f",
        "ramebuffer.subgroupshuffle_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005027,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005028,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffle_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005029,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005030,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005031,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005032,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005033,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005034,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffleup_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005035,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005036,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffleup_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005037,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005038,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffledown_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005039,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005040,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffledown_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005041,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005042,
        "KHR-Single-GLES32.subgroups.shuffle.f",
        "ramebuffer.subgroupshuffle_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005043,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005044,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffle_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005045,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005046,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005047,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005048,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005049,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005050,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffleup_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005051,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005052,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffleup_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005053,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005054,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffledown_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005055,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005056,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffledown_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005057,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005058,
        "KHR-Single-GLES32.subgroups.shuffle.f",
        "ramebuffer.subgroupshuffle_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005059,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005060,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffle_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005061,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005062,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005063,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005064,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005065,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005066,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffleup_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005067,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005068,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffleup_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005069,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005070,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffledown_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005071,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005072,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffledown_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005073,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005074,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005075,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffle_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005076,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005077,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005078,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005079,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005080,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshufflexor_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005081,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005082,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005083,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffleup_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005084,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005085,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005086,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005087,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffledown_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005088,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005089,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005090,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005091,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005092,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005093,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005094,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005095,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005096,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005097,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005098,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005099,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005100,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005101,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005102,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005103,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005104,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005105,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005106,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005107,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005108,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005109,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005110,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005111,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005112,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005113,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005114,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005115,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005116,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005117,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005118,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005119,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005120,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005121,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005122,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005123,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005124,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005125,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005126,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005127,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005128,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005129,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005130,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005131,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005132,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005133,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005134,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005135,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005136,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005137,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005138,
        "KHR-Single-GLES32.subgroups.shuffle.f",
        "ramebuffer.subgroupshuffle_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005139,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005140,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffle_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005141,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005142,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005143,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005144,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005145,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005146,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffleup_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005147,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005148,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffleup_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005149,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005150,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffledown_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005151,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005152,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffledown_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005153,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005154,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005155,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005156,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005157,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005158,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005159,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005160,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005161,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005162,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005163,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005164,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005165,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005166,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005167,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005168,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005169,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005170,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005171,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005172,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005173,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005174,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005175,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005176,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005177,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005178,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005179,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005180,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005181,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005182,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005183,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005184,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005185,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005186,
        "KHR-Single-GLES32.subgroups.shuffle.fr",
        "amebuffer.subgroupshuffle_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005187,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005188,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffle_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005189,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffle_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005190,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshufflexor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005191,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshufflexor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005192,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshufflexor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005193,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshufflexor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005194,
        "KHR-Single-GLES32.subgroups.shuffle.fra",
        "mebuffer.subgroupshuffleup_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005195,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005196,
        "KHR-Single-GLES32.subgroups.shuffle.frameb",
        "uffer.subgroupshuffleup_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005197,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffleup_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005198,
        "KHR-Single-GLES32.subgroups.shuffle.fram",
        "ebuffer.subgroupshuffledown_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005199,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005200,
        "KHR-Single-GLES32.subgroups.shuffle.framebu",
        "ffer.subgroupshuffledown_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_005201,
        "KHR-Single-GLES32.subgroups.shuffle.frame",
        "buffer.subgroupshuffledown_bvec4_geometry");
