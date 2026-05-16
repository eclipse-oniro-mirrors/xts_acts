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
#include "../ActsDeqpgles310002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001041,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.uaddcarry.uint_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001042,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uint_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001043,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uint_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001044,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uint_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001045,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uint_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001046,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uint_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001047,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uint_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001048,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uint_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001049,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uint_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001050,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.uaddcarry.uint_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001051,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uint_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001052,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uint_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001053,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uint_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001054,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uint_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001055,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uint_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001056,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.uaddcarry.uint_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001057,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uint_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001058,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uint_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001059,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uvec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001060,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001061,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001062,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.uaddcarry.uvec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001063,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001064,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uvec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001065,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001066,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001067,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001068,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.uaddcarry.uvec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001069,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.uaddcarry.uvec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001070,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001071,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uvec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001072,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001073,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001074,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.uaddcarry.uvec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001075,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001076,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001077,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uvec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001078,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001079,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001080,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.uaddcarry.uvec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001081,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001082,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uvec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001083,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001084,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001085,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001086,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.uaddcarry.uvec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001087,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.uaddcarry.uvec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001088,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001089,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uvec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001090,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001091,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001092,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.uaddcarry.uvec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001093,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001094,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001095,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uvec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001096,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001097,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001098,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.uaddcarry.uvec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001099,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001100,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uvec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001101,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001102,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001103,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001104,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.uaddcarry.uvec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001105,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.uaddcarry.uvec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001106,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001107,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.uaddcarry.uvec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001108,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001109,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001110,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.uaddcarry.uvec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001111,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.uaddcarry.uvec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001112,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.uaddcarry.uvec4_highp_compute");
