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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038203,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038204,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038205,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038206,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038207,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038208,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038209,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038210,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038211,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038212,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038213,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038214,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.basic_array_assign_full.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038215,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038216,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038217,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038218,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038219,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038220,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038221,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038222,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038223,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038224,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038225,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038226,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038227,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038228,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038229,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038230,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "asic_array_assign_full.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038231,
        "dEQP-GLES3.functional.uniform_api.value.assigned.ba",
        "sic_array_assign_full.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038232,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.sampler2D_both");
