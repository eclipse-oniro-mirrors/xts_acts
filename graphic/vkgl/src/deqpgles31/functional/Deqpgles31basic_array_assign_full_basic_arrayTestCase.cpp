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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017437,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_full.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017438,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_full.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017439,
        "dEQP-GLES31.functional.program_uniform.bas",
        "ic_array_assign_full.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017440,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_full.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017441,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_full.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017442,
        "dEQP-GLES31.functional.program_uniform.bas",
        "ic_array_assign_full.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017443,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_full.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017444,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_full.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017445,
        "dEQP-GLES31.functional.program_uniform.bas",
        "ic_array_assign_full.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017446,
        "dEQP-GLES31.functional.program_uniform.bas",
        "ic_array_assign_full.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017447,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_full.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017448,
        "dEQP-GLES31.functional.program_uniform.ba",
        "sic_array_assign_full.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017449,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_full.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017450,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_full.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017451,
        "dEQP-GLES31.functional.program_uniform.bas",
        "ic_array_assign_full.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017452,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_full.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017453,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_full.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017454,
        "dEQP-GLES31.functional.program_uniform.bas",
        "ic_array_assign_full.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017455,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_full.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017456,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_full.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017457,
        "dEQP-GLES31.functional.program_uniform.bas",
        "ic_array_assign_full.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017458,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_full.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017459,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_full.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017460,
        "dEQP-GLES31.functional.program_uniform.bas",
        "ic_array_assign_full.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017461,
        "dEQP-GLES31.functional.program_uniform.basi",
        "c_array_assign_full.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017462,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_full.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017463,
        "dEQP-GLES31.functional.program_uniform.bas",
        "ic_array_assign_full.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017464,
        "dEQP-GLES31.functional.program_uniform.basic_",
        "array_assign_full.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017465,
        "dEQP-GLES31.functional.program_uniform.basic_a",
        "rray_assign_full.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017466,
        "dEQP-GLES31.functional.program_uniform.basic",
        "_array_assign_full.basic_array.sampler2D_both");
