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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001556,
        "dEQP-GLES3.functional.shaders",
        ".linkage.uniform.struct.basic");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001557,
        "dEQP-GLES3.functional.shaders.li",
        "nkage.uniform.struct.vertex_only");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001558,
        "dEQP-GLES3.functional.shaders.lin",
        "kage.uniform.struct.fragment_only");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001559,
        "dEQP-GLES3.functional.shaders.",
        "linkage.uniform.struct.partial");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001560,
        "dEQP-GLES3.functional.shader",
        "s.linkage.uniform.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001561,
        "dEQP-GLES3.functional.shaders.link",
        "age.uniform.struct.vertex_only_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001562,
        "dEQP-GLES3.functional.shaders.linka",
        "ge.uniform.struct.fragment_only_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001563,
        "dEQP-GLES3.functional.shaders.li",
        "nkage.uniform.struct.partial_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001564,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.uniform.struct.vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001565,
        "dEQP-GLES3.functional.shaders.linkage",
        ".uniform.struct.vertex_only_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001566,
        "dEQP-GLES3.functional.shaders.linkage.",
        "uniform.struct.fragment_only_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001567,
        "dEQP-GLES3.functional.shaders.linka",
        "ge.uniform.struct.partial_vec4_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001568,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.uniform.struct.vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001569,
        "dEQP-GLES3.functional.shaders.linkage",
        ".uniform.struct.vertex_only_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001570,
        "dEQP-GLES3.functional.shaders.linkage.",
        "uniform.struct.fragment_only_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001571,
        "dEQP-GLES3.functional.shaders.linka",
        "ge.uniform.struct.partial_vec4_float");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001572,
        "dEQP-GLES3.functional.shaders.linkag",
        "e.uniform.struct.partial_vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001573,
        "dEQP-GLES3.functional.shaders.linkage.",
        "uniform.struct.partial_vec4_vec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001574,
        "dEQP-GLES3.functional.shaders.linka",
        "ge.uniform.struct.partial_vec2_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001575,
        "dEQP-GLES3.functional.shaders.link",
        "age.uniform.struct.partial_vec2_int");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001576,
        "dEQP-GLES3.functional.shaders.linka",
        "ge.uniform.struct.partial_int_float");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001577,
        "dEQP-GLES3.functional.shaders.linka",
        "ge.uniform.struct.partial_bvec2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001578,
        "dEQP-GLES3.functional.shaders.linka",
        "ge.uniform.struct.partial_ivec2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001579,
        "dEQP-GLES3.functional.shaders.linkag",
        "e.uniform.struct.partial_ivec2_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001580,
        "dEQP-GLES3.functional.shaders.link",
        "age.uniform.struct.type_conflict_1");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001581,
        "dEQP-GLES3.functional.shaders.link",
        "age.uniform.struct.type_conflict_2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001582,
        "dEQP-GLES3.functional.shaders.link",
        "age.uniform.struct.type_conflict_3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001583,
        "dEQP-GLES3.functional.shaders.linkag",
        "e.uniform.struct.precision_conflict_1");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001584,
        "dEQP-GLES3.functional.shaders.linkag",
        "e.uniform.struct.precision_conflict_2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001585,
        "dEQP-GLES3.functional.shaders.linkag",
        "e.uniform.struct.precision_conflict_3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001586,
        "dEQP-GLES3.functional.shaders.linkag",
        "e.uniform.struct.precision_conflict_4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001587,
        "dEQP-GLES3.functional.shaders.linka",
        "ge.uniform.struct.light_struct_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001588,
        "dEQP-GLES3.functional.shaders.linkag",
        "e.uniform.struct.light_struct_mediump");
