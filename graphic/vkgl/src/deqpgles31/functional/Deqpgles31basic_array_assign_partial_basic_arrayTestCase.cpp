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
#include "../ActsDeqpgles310018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017488,
        "dEQP-GLES31.functional.program_uniform.basic_",
        "array_assign_partial.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017489,
        "dEQP-GLES31.functional.program_uniform.basic_a",
        "rray_assign_partial.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017490,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_partial.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017491,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_partial.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017492,
        "dEQP-GLES31.functional.program_uniform.basic_",
        "array_assign_partial.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017493,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_partial.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017494,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_partial.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017495,
        "dEQP-GLES31.functional.program_uniform.basic_",
        "array_assign_partial.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017496,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_partial.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017497,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_partial.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017498,
        "dEQP-GLES31.functional.program_uniform.basic_",
        "array_assign_partial.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017499,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_partial.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017500,
        "dEQP-GLES31.functional.program_uniform.basic_",
        "array_assign_partial.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017501,
        "dEQP-GLES31.functional.program_uniform.basic_a",
        "rray_assign_partial.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017502,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_partial.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017503,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_partial.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017504,
        "dEQP-GLES31.functional.program_uniform.basic_",
        "array_assign_partial.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017505,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_partial.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017506,
        "dEQP-GLES31.functional.program_uniform.basic_",
        "array_assign_partial.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017507,
        "dEQP-GLES31.functional.program_uniform.basic_a",
        "rray_assign_partial.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017508,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_partial.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017509,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_partial.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017510,
        "dEQP-GLES31.functional.program_uniform.basic_",
        "array_assign_partial.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017511,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_partial.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017512,
        "dEQP-GLES31.functional.program_uniform.basic_",
        "array_assign_partial.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017513,
        "dEQP-GLES31.functional.program_uniform.basic_a",
        "rray_assign_partial.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017514,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_partial.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017515,
        "dEQP-GLES31.functional.program_uniform.basic_ar",
        "ray_assign_partial.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017516,
        "dEQP-GLES31.functional.program_uniform.basic_arr",
        "ay_assign_partial.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017517,
        "dEQP-GLES31.functional.program_uniform.basic_a",
        "rray_assign_partial.basic_array.sampler2D_both");
