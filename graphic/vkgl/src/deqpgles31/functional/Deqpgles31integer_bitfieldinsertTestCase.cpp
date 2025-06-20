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

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001377,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitfieldinsert.int_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001378,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.int_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001379,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.int_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001380,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.int_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001381,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.int_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001382,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.int_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001383,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.int_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001384,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.int_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001385,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.int_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001386,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldinsert.int_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001387,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.int_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001388,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.int_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001389,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.int_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001390,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.int_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001391,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.int_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001392,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.int_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001393,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.int_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001394,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.int_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001395,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.ivec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001396,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001397,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001398,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001399,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001400,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001401,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001402,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001403,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001404,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldinsert.ivec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001405,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001406,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001407,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001408,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001409,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001410,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldinsert.ivec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001411,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001412,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001413,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.ivec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001414,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001415,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001416,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001417,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001418,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001419,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001420,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001421,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001422,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldinsert.ivec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001423,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001424,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001425,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001426,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001427,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001428,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldinsert.ivec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001429,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001430,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001431,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.ivec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001432,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001433,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001434,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001435,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001436,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001437,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001438,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001439,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001440,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldinsert.ivec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001441,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.ivec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001442,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001443,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001444,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001445,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001446,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldinsert.ivec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001447,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.ivec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001448,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.ivec4_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001449,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.uint_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001450,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uint_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001451,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uint_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001452,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uint_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001453,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uint_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001454,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.uint_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001455,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uint_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001456,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uint_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001457,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uint_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001458,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldinsert.uint_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001459,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uint_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001460,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uint_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001461,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.uint_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001462,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uint_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001463,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uint_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001464,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uint_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001465,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uint_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001466,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uint_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001467,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.uvec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001468,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001469,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001470,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001471,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001472,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001473,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001474,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001475,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001476,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldinsert.uvec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001477,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001478,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001479,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001480,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001481,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001482,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldinsert.uvec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001483,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001484,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001485,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.uvec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001486,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001487,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001488,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001489,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001490,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001491,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001492,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001493,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001494,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldinsert.uvec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001495,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001496,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001497,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001498,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001499,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001500,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldinsert.uvec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001501,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001502,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001503,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitfieldinsert.uvec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001504,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001505,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001506,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001507,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001508,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001509,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001510,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001511,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001512,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "integer.bitfieldinsert.uvec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001513,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.bitfieldinsert.uvec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001514,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001515,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001516,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001517,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001518,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".integer.bitfieldinsert.uvec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001519,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitfieldinsert.uvec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001520,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitfieldinsert.uvec4_highp_compute");
