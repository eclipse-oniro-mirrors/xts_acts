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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038254,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038255,
        "dEQP-GLES3.functional.uniform_api.value.assigned.ba",
        "sic_array_assign_partial.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038256,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038257,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038258,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038259,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_partial.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038260,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038261,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038262,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_partial.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038263,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038264,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038265,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_partial.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038266,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038267,
        "dEQP-GLES3.functional.uniform_api.value.assigned.ba",
        "sic_array_assign_partial.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038268,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038269,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038270,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038271,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_partial.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038272,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038273,
        "dEQP-GLES3.functional.uniform_api.value.assigned.ba",
        "sic_array_assign_partial.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038274,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038275,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038276,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038277,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_partial.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038278,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038279,
        "dEQP-GLES3.functional.uniform_api.value.assigned.ba",
        "sic_array_assign_partial.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038280,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038281,
        "dEQP-GLES3.functional.uniform_api.value.assigned.bas",
        "ic_array_assign_partial.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038282,
        "dEQP-GLES3.functional.uniform_api.value.assigned.basi",
        "c_array_assign_partial.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038283,
        "dEQP-GLES3.functional.uniform_api.value.assigned.ba",
        "sic_array_assign_partial.basic_array.sampler2D_both");
