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
#include "../ActsDeqpgles20016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015050,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015051,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015052,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015053,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015054,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015055,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015056,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015057,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015058,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015059,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015060,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015061,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.basic_array_assign_full.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015062,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015063,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015064,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015065,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015066,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015067,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015068,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".basic_array_assign_full.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015069,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015070,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.basic_array_assign_full.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015071,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "asic_array_assign_full.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015072,
        "dEQP-GLES2.functional.uniform_api.value.assigned.ba",
        "sic_array_assign_full.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015073,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_full.basic_array.sampler2D_both");
