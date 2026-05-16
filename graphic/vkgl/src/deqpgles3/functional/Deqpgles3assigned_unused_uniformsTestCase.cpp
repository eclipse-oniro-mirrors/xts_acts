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
#include "../ActsDeqpgles30039TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038305,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.unused_uniforms.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038306,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.unused_uniforms.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038307,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.unused_uniforms.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038308,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.unused_uniforms.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038309,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.unused_uniforms.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038310,
        "dEQP-GLES3.functional.uniform_api.value",
        ".assigned.unused_uniforms.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038311,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.unused_uniforms.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038312,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.unused_uniforms.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038313,
        "dEQP-GLES3.functional.uniform_api.value",
        ".assigned.unused_uniforms.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038314,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.unused_uniforms.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038315,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.unused_uniforms.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038316,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.unused_uniforms.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038317,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.unused_uniforms.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038318,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.unused_uniforms.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038319,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.unused_uniforms.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038320,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.unused_uniforms.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038321,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.unused_uniforms.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038322,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.unused_uniforms.sampler2D_samplerCube_both");
