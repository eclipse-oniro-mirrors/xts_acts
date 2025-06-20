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
#include "../ActsDeqpgles30017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016514,
        "dEQP-GLES3.functional.shader",
        "s.struct.uniform.basic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016515,
        "dEQP-GLES3.functional.shaders",
        ".struct.uniform.basic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016516,
        "dEQP-GLES3.functional.shaders",
        ".struct.uniform.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016517,
        "dEQP-GLES3.functional.shaders.",
        "struct.uniform.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016518,
        "dEQP-GLES3.functional.shaders.st",
        "ruct.uniform.array_member_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016519,
        "dEQP-GLES3.functional.shaders.str",
        "uct.uniform.array_member_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016520,
        "dEQP-GLES3.functional.shaders.struct.un",
        "iform.array_member_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016521,
        "dEQP-GLES3.functional.shaders.struct.uni",
        "form.array_member_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016522,
        "dEQP-GLES3.functional.shaders.st",
        "ruct.uniform.struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016523,
        "dEQP-GLES3.functional.shaders.str",
        "uct.uniform.struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016524,
        "dEQP-GLES3.functional.shaders.struct.un",
        "iform.struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016525,
        "dEQP-GLES3.functional.shaders.struct.uni",
        "form.struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016526,
        "dEQP-GLES3.functional.shaders.struc",
        "t.uniform.nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016527,
        "dEQP-GLES3.functional.shaders.struct",
        ".uniform.nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016528,
        "dEQP-GLES3.functional.shaders.struct.unifo",
        "rm.nested_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016529,
        "dEQP-GLES3.functional.shaders.struct.unifor",
        "m.nested_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016530,
        "dEQP-GLES3.functional.shaders.stru",
        "ct.uniform.loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016531,
        "dEQP-GLES3.functional.shaders.struc",
        "t.uniform.loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016532,
        "dEQP-GLES3.functional.shaders.struct.u",
        "niform.loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016533,
        "dEQP-GLES3.functional.shaders.struct.un",
        "iform.loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016534,
        "dEQP-GLES3.functional.shaders.struct.u",
        "niform.dynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016535,
        "dEQP-GLES3.functional.shaders.struct.un",
        "iform.dynamic_loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016536,
        "dEQP-GLES3.functional.shaders.struct.unifo",
        "rm.dynamic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016537,
        "dEQP-GLES3.functional.shaders.struct.unifor",
        "m.dynamic_loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016538,
        "dEQP-GLES3.functional.shaders",
        ".struct.uniform.sampler_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016539,
        "dEQP-GLES3.functional.shaders.",
        "struct.uniform.sampler_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016540,
        "dEQP-GLES3.functional.shaders.str",
        "uct.uniform.sampler_nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016541,
        "dEQP-GLES3.functional.shaders.stru",
        "ct.uniform.sampler_nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016542,
        "dEQP-GLES3.functional.shaders.st",
        "ruct.uniform.sampler_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016543,
        "dEQP-GLES3.functional.shaders.str",
        "uct.uniform.sampler_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016544,
        "dEQP-GLES3.functional.shader",
        "s.struct.uniform.equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016545,
        "dEQP-GLES3.functional.shaders",
        ".struct.uniform.equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016546,
        "dEQP-GLES3.functional.shaders.",
        "struct.uniform.not_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016547,
        "dEQP-GLES3.functional.shaders.s",
        "truct.uniform.not_equal_fragment");
