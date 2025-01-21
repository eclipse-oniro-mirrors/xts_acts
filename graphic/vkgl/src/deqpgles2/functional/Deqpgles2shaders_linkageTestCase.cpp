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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000728,
        "dEQP-GLES2.functional.s",
        "haders.linkage.varying_1");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000729,
        "dEQP-GLES2.functional.s",
        "haders.linkage.varying_2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000730,
        "dEQP-GLES2.functional.s",
        "haders.linkage.varying_3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000731,
        "dEQP-GLES2.functional.s",
        "haders.linkage.varying_4");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000732,
        "dEQP-GLES2.functional.s",
        "haders.linkage.varying_5");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000733,
        "dEQP-GLES2.functional.s",
        "haders.linkage.varying_6");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000734,
        "dEQP-GLES2.functional.s",
        "haders.linkage.varying_7");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000735,
        "dEQP-GLES2.functional.shader",
        "s.linkage.varying_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000736,
        "dEQP-GLES2.functional.shade",
        "rs.linkage.varying_type_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000737,
        "dEQP-GLES2.functional.shade",
        "rs.linkage.varying_type_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000738,
        "dEQP-GLES2.functional.shade",
        "rs.linkage.varying_type_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000739,
        "dEQP-GLES2.functional.shade",
        "rs.linkage.varying_type_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000740,
        "dEQP-GLES2.functional.shade",
        "rs.linkage.varying_type_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000741,
        "dEQP-GLES2.functional.shade",
        "rs.linkage.varying_type_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000742,
        "dEQP-GLES2.functional.shaders.lin",
        "kage.varying_differing_precision_1");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000743,
        "dEQP-GLES2.functional.shaders.lin",
        "kage.varying_differing_precision_2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000744,
        "dEQP-GLES2.functional.shaders.lin",
        "kage.varying_differing_precision_3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000745,
        "dEQP-GLES2.functional.shaders.",
        "linkage.varying_type_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000746,
        "dEQP-GLES2.functional.shaders.l",
        "inkage.invalid_varying_type_int");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000747,
        "dEQP-GLES2.functional.shaders.l",
        "inkage.invalid_varying_type_bool");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000748,
        "dEQP-GLES2.functional.shaders.li",
        "nkage.invalid_varying_type_struct");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000749,
        "dEQP-GLES2.functional.shader",
        "s.linkage.varying_readback_1");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000750,
        "dEQP-GLES2.functional.shader",
        "s.linkage.varying_writeback_1");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000751,
        "dEQP-GLES2.functional.shad",
        "ers.linkage.uniform_struct");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000752,
        "dEQP-GLES2.functional.shaders.li",
        "nkage.uniform_struct_vertex_only");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000753,
        "dEQP-GLES2.functional.shaders.lin",
        "kage.uniform_struct_fragment_only");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000754,
        "dEQP-GLES2.functional.shaders.",
        "linkage.uniform_struct_partial");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000755,
        "dEQP-GLES2.functional.shader",
        "s.linkage.uniform_struct_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000756,
        "dEQP-GLES2.functional.shaders.link",
        "age.uniform_struct_vertex_only_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000757,
        "dEQP-GLES2.functional.shaders.linka",
        "ge.uniform_struct_fragment_only_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000758,
        "dEQP-GLES2.functional.shaders.li",
        "nkage.uniform_struct_partial_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000759,
        "dEQP-GLES2.functional.shaders.l",
        "inkage.uniform_struct_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000760,
        "dEQP-GLES2.functional.shaders.linkage",
        ".uniform_struct_vertex_only_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000761,
        "dEQP-GLES2.functional.shaders.linkage.",
        "uniform_struct_fragment_only_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000762,
        "dEQP-GLES2.functional.shaders.linka",
        "ge.uniform_struct_partial_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000763,
        "dEQP-GLES2.functional.shaders.l",
        "inkage.uniform_struct_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000764,
        "dEQP-GLES2.functional.shaders.linkage",
        ".uniform_struct_vertex_only_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000765,
        "dEQP-GLES2.functional.shaders.linkage.",
        "uniform_struct_fragment_only_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000766,
        "dEQP-GLES2.functional.shaders.linka",
        "ge.uniform_struct_partial_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000767,
        "dEQP-GLES2.functional.shaders.linkag",
        "e.uniform_struct_partial_vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000768,
        "dEQP-GLES2.functional.shaders.linkage.",
        "uniform_struct_partial_vec4_vec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000769,
        "dEQP-GLES2.functional.shaders.linka",
        "ge.uniform_struct_partial_vec2_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000770,
        "dEQP-GLES2.functional.shaders.link",
        "age.uniform_struct_partial_vec2_int");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000771,
        "dEQP-GLES2.functional.shaders.linka",
        "ge.uniform_struct_partial_int_float");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000772,
        "dEQP-GLES2.functional.shaders.linka",
        "ge.uniform_struct_partial_bvec2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000773,
        "dEQP-GLES2.functional.shaders.linka",
        "ge.uniform_struct_partial_ivec2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000774,
        "dEQP-GLES2.functional.shaders.linkag",
        "e.uniform_struct_partial_ivec2_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000775,
        "dEQP-GLES2.functional.shaders.li",
        "nkage.uniform_struct_use_case_rip");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000776,
        "dEQP-GLES2.functional.shaders.linkage.",
        "uniform_struct_use_case_rip_sans_highp");
