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
#include "../ActsDeqpgles310005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004675,
        "dEQP-GLES31.functional.shaders.l",
        "inkage.es31.uniform.struct.basic");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004676,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.uniform.struct.vertex_only");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004677,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.uniform.struct.fragment_only");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004678,
        "dEQP-GLES31.functional.shaders.li",
        "nkage.es31.uniform.struct.partial");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004679,
        "dEQP-GLES31.functional.shaders.",
        "linkage.es31.uniform.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004680,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.uniform.struct.vertex_only_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004681,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.uniform.struct.fragment_only_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004682,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.uniform.struct.partial_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004683,
        "dEQP-GLES31.functional.shaders.lin",
        "kage.es31.uniform.struct.vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004684,
        "dEQP-GLES31.functional.shaders.linkage.e",
        "s31.uniform.struct.vertex_only_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004685,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.uniform.struct.fragment_only_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004686,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.uniform.struct.partial_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004687,
        "dEQP-GLES31.functional.shaders.lin",
        "kage.es31.uniform.struct.vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004688,
        "dEQP-GLES31.functional.shaders.linkage.e",
        "s31.uniform.struct.vertex_only_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004689,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.uniform.struct.fragment_only_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004690,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.uniform.struct.partial_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004691,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.uniform.struct.partial_vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004692,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.uniform.struct.partial_vec4_vec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004693,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.uniform.struct.partial_vec2_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004694,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.uniform.struct.partial_vec2_int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004695,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.uniform.struct.partial_int_float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004696,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.uniform.struct.partial_bvec2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004697,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.uniform.struct.partial_ivec2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004698,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.uniform.struct.partial_ivec2_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004699,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.uniform.struct.type_conflict_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004700,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.uniform.struct.type_conflict_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004701,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.uniform.struct.type_conflict_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004702,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.uniform.struct.precision_conflict_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004703,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.uniform.struct.precision_conflict_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004704,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.uniform.struct.precision_conflict_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004705,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.uniform.struct.precision_conflict_4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004706,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.uniform.struct.light_struct_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004707,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.uniform.struct.light_struct_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004935,
        "dEQP-GLES31.functional.shaders.l",
        "inkage.es32.uniform.struct.basic");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004936,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.uniform.struct.vertex_only");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004937,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.uniform.struct.fragment_only");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004938,
        "dEQP-GLES31.functional.shaders.li",
        "nkage.es32.uniform.struct.partial");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004939,
        "dEQP-GLES31.functional.shaders.",
        "linkage.es32.uniform.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004940,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.uniform.struct.vertex_only_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004941,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.uniform.struct.fragment_only_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004942,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.uniform.struct.partial_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004943,
        "dEQP-GLES31.functional.shaders.lin",
        "kage.es32.uniform.struct.vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004944,
        "dEQP-GLES31.functional.shaders.linkage.e",
        "s32.uniform.struct.vertex_only_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004945,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.uniform.struct.fragment_only_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004946,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.uniform.struct.partial_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004947,
        "dEQP-GLES31.functional.shaders.lin",
        "kage.es32.uniform.struct.vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004948,
        "dEQP-GLES31.functional.shaders.linkage.e",
        "s32.uniform.struct.vertex_only_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004949,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.uniform.struct.fragment_only_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004950,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.uniform.struct.partial_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004951,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.uniform.struct.partial_vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004952,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.uniform.struct.partial_vec4_vec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004953,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.uniform.struct.partial_vec2_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004954,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.uniform.struct.partial_vec2_int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004955,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.uniform.struct.partial_int_float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004956,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.uniform.struct.partial_bvec2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004957,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.uniform.struct.partial_ivec2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004958,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.uniform.struct.partial_ivec2_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004959,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.uniform.struct.type_conflict_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004960,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.uniform.struct.type_conflict_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004961,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.uniform.struct.type_conflict_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004962,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.uniform.struct.precision_conflict_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004963,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.uniform.struct.precision_conflict_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004964,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.uniform.struct.precision_conflict_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004965,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.uniform.struct.precision_conflict_4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004966,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.uniform.struct.light_struct_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004967,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.uniform.struct.light_struct_mediump");
