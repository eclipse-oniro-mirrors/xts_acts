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

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001521,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldreverse.int_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001522,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.int_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001523,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.int_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001524,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.int_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001525,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.int_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001526,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldreverse.int_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001527,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.int_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001528,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.int_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001529,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.int_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001530,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.int_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001531,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.int_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001532,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.int_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001533,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldreverse.int_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001534,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.int_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001535,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.int_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001536,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.int_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001537,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.int_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001538,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.int_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001539,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.ivec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001540,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001541,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001542,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.ivec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001543,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001544,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.ivec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001545,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001546,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001547,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001548,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldreverse.ivec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001549,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.ivec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001550,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001551,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.ivec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001552,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001553,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001554,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.ivec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001555,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001556,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001557,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.ivec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001558,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001559,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001560,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.ivec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001561,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001562,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.ivec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001563,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001564,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001565,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001566,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldreverse.ivec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001567,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.ivec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001568,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001569,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.ivec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001570,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001571,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001572,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.ivec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001573,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001574,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001575,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.ivec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001576,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001577,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001578,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.ivec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001579,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001580,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.ivec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001581,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001582,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001583,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001584,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldreverse.ivec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001585,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.ivec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001586,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001587,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.ivec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001588,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001589,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001590,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.ivec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001591,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.ivec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001592,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.ivec4_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001593,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldreverse.uint_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001594,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uint_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001595,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uint_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001596,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uint_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001597,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uint_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001598,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uint_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001599,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uint_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001600,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uint_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001601,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uint_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001602,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldreverse.uint_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001603,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uint_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001604,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uint_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001605,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uint_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001606,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uint_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001607,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uint_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001608,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.uint_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001609,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uint_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001610,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uint_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001611,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uvec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001612,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001613,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001614,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.uvec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001615,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001616,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uvec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001617,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001618,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001619,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001620,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldreverse.uvec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001621,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.uvec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001622,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001623,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uvec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001624,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001625,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001626,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.uvec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001627,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001628,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001629,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uvec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001630,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001631,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001632,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.uvec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001633,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001634,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uvec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001635,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001636,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001637,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001638,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldreverse.uvec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001639,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.uvec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001640,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001641,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uvec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001642,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001643,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001644,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.uvec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001645,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001646,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001647,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uvec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001648,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001649,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001650,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.uvec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001651,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001652,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uvec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001653,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001654,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001655,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001656,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldreverse.uvec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001657,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.uvec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001658,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001659,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldreverse.uvec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001660,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001661,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001662,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldreverse.uvec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001663,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldreverse.uvec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001664,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldreverse.uvec4_highp_compute");
