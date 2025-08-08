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

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001665,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.integer.bitcount.int_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001666,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.int_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001667,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.int_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001668,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.int_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001669,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.int_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001670,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.int_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001671,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.int_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001672,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.int_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001673,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.int_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001674,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitcount.int_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001675,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.int_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001676,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.int_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001677,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.int_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001678,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.int_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001679,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.int_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001680,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.int_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001681,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.int_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001682,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.int_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001683,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.ivec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001684,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001685,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001686,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001687,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001688,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001689,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001690,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001691,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001692,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitcount.ivec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001693,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001694,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001695,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001696,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001697,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001698,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitcount.ivec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001699,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001700,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001701,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.ivec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001702,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001703,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001704,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001705,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001706,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001707,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001708,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001709,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001710,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitcount.ivec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001711,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001712,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001713,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001714,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001715,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001716,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitcount.ivec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001717,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001718,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001719,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.ivec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001720,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001721,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001722,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001723,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001724,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001725,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001726,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001727,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001728,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitcount.ivec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001729,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.ivec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001730,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001731,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001732,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001733,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001734,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitcount.ivec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001735,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.ivec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001736,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.ivec4_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001737,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.uint_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001738,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uint_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001739,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uint_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001740,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uint_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001741,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uint_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001742,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.uint_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001743,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uint_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001744,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uint_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001745,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uint_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001746,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitcount.uint_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001747,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uint_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001748,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uint_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001749,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.uint_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001750,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uint_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001751,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uint_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001752,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uint_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001753,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uint_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001754,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uint_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001755,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.uvec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001756,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001757,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001758,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001759,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001760,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001761,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001762,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001763,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001764,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitcount.uvec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001765,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001766,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001767,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001768,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001769,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001770,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitcount.uvec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001771,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001772,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001773,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.uvec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001774,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001775,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001776,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001777,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001778,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001779,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001780,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001781,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001782,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitcount.uvec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001783,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001784,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001785,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001786,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001787,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001788,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitcount.uvec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001789,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001790,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001791,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.bitcount.uvec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001792,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001793,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001794,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001795,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001796,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001797,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001798,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001799,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001800,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.bitcount.uvec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001801,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.bitcount.uvec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001802,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001803,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001804,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001805,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001806,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.bitcount.uvec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001807,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.bitcount.uvec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001808,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.bitcount.uvec4_highp_compute");
