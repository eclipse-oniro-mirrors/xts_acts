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

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015092,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015093,
        "dEQP-GLES2.functional.uniform_api.value.assigned.ba",
        "sic_array_assign_partial.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015094,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015095,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015096,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015097,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".basic_array_assign_partial.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015098,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015099,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015100,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".basic_array_assign_partial.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015101,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015102,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015103,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".basic_array_assign_partial.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015104,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015105,
        "dEQP-GLES2.functional.uniform_api.value.assigned.ba",
        "sic_array_assign_partial.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015106,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015107,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015108,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015109,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".basic_array_assign_partial.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015110,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "asic_array_assign_partial.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015111,
        "dEQP-GLES2.functional.uniform_api.value.assigned.ba",
        "sic_array_assign_partial.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015112,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "basic_array_assign_partial.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015113,
        "dEQP-GLES2.functional.uniform_api.value.assigned.bas",
        "ic_array_assign_partial.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015114,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basi",
        "c_array_assign_partial.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015115,
        "dEQP-GLES2.functional.uniform_api.value.assigned.ba",
        "sic_array_assign_partial.basic_array.sampler2D_both");
