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

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001233,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldextract.int_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001234,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.int_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001235,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.int_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001236,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.int_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001237,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.int_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001238,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldextract.int_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001239,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.int_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001240,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.int_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001241,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.int_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001242,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.int_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001243,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.int_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001244,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.int_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001245,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldextract.int_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001246,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.int_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001247,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.int_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001248,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.int_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001249,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.int_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001250,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.int_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001251,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.ivec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001252,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001253,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001254,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.ivec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001255,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001256,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.ivec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001257,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001258,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001259,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001260,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldextract.ivec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001261,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.ivec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001262,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001263,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.ivec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001264,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001265,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001266,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.ivec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001267,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001268,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001269,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.ivec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001270,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001271,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001272,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.ivec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001273,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001274,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.ivec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001275,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001276,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001277,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001278,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldextract.ivec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001279,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.ivec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001280,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001281,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.ivec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001282,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001283,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001284,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.ivec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001285,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001286,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001287,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.ivec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001288,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001289,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001290,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.ivec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001291,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001292,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.ivec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001293,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001294,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001295,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001296,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldextract.ivec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001297,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.ivec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001298,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001299,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.ivec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001300,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001301,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001302,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.ivec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001303,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.ivec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001304,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.ivec4_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001305,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldextract.uint_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001306,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uint_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001307,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uint_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001308,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uint_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001309,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uint_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001310,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uint_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001311,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uint_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001312,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uint_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001313,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uint_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001314,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldextract.uint_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001315,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uint_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001316,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uint_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001317,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uint_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001318,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uint_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001319,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uint_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001320,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.uint_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001321,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uint_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001322,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uint_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001323,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uvec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001324,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001325,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001326,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.uvec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001327,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001328,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uvec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001329,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001330,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001331,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001332,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldextract.uvec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001333,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.uvec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001334,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001335,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uvec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001336,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001337,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001338,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.uvec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001339,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001340,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001341,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uvec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001342,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001343,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001344,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.uvec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001345,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001346,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uvec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001347,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001348,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001349,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001350,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldextract.uvec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001351,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.uvec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001352,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001353,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uvec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001354,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001355,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001356,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.uvec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001357,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001358,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001359,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uvec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001360,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001361,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001362,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.uvec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001363,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001364,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uvec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001365,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001366,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001367,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001368,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldextract.uvec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001369,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.uvec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001370,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001371,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldextract.uvec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001372,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001373,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001374,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldextract.uvec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001375,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldextract.uvec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001376,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldextract.uvec4_highp_compute");
