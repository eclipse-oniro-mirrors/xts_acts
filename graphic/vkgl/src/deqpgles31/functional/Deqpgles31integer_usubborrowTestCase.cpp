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

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001113,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.usubborrow.uint_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001114,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uint_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001115,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uint_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001116,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uint_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001117,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uint_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001118,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.usubborrow.uint_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001119,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uint_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001120,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uint_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001121,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uint_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001122,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.usubborrow.uint_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001123,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uint_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001124,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uint_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001125,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.usubborrow.uint_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001126,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uint_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001127,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uint_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001128,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uint_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001129,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uint_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001130,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uint_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001131,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.usubborrow.uvec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001132,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001133,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001134,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001135,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001136,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001137,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001138,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001139,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001140,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.usubborrow.uvec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001141,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001142,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001143,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001144,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001145,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001146,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.usubborrow.uvec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001147,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001148,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001149,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.usubborrow.uvec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001150,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001151,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001152,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001153,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001154,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001155,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001156,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001157,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001158,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.usubborrow.uvec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001159,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001160,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001161,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001162,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001163,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001164,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.usubborrow.uvec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001165,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001166,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001167,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.usubborrow.uvec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001168,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001169,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001170,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001171,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001172,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001173,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001174,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001175,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001176,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.usubborrow.uvec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001177,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.usubborrow.uvec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001178,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001179,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001180,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001181,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001182,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.usubborrow.uvec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001183,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.usubborrow.uvec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001184,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.usubborrow.uvec4_highp_compute");
