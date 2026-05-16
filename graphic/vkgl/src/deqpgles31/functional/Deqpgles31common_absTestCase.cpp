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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000013,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000014,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000015,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000016,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000017,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000018,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.abs.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000019,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000020,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000021,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000022,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.abs.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000023,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000024,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000025,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000026,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000027,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000028,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.abs.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000029,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000030,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.abs.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000031,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000032,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000033,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000034,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000035,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000036,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000037,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000038,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000039,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000040,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.abs.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000041,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000042,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.abs.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000043,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000044,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000045,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000046,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000047,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000048,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000049,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000050,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000051,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000052,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.abs.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000053,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000054,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.abs.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000055,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000056,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000057,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000058,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000059,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000060,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.vec4_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000061,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.abs.int_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000062,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.int_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000063,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.int_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000064,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.abs.int_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000065,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.int_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000066,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.abs.int_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000067,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.int_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000068,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.int_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000069,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.int_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000070,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.int_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000071,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.int_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000072,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.abs.int_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000073,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.ivec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000074,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000075,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000076,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.ivec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000077,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000078,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.abs.ivec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000079,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000080,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000081,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000082,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.abs.ivec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000083,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000084,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.ivec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000085,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.ivec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000086,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000087,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000088,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.ivec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000089,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000090,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.abs.ivec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000091,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000092,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000093,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000094,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.abs.ivec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000095,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000096,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.ivec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000097,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.ivec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000098,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000099,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000100,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.ivec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000101,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000102,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.abs.ivec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000103,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000104,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000105,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000106,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.abs.ivec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000107,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.abs.ivec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000108,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.abs.ivec4_highp_compute");
