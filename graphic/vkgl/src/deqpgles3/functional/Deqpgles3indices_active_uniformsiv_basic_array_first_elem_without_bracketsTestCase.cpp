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
#include "../ActsDeqpgles30037TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036562,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_u",
        "niformsiv.basic_array_first_elem_without_brackets.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036563,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_un",
        "iformsiv.basic_array_first_elem_without_brackets.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036564,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_",
        "uniformsiv.basic_array_first_elem_without_brackets.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036565,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_u",
        "niformsiv.basic_array_first_elem_without_brackets.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036566,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_un",
        "iformsiv.basic_array_first_elem_without_brackets.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036567,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_",
        "uniformsiv.basic_array_first_elem_without_brackets.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036568,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_u",
        "niformsiv.basic_array_first_elem_without_brackets.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036569,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_un",
        "iformsiv.basic_array_first_elem_without_brackets.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036570,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_",
        "uniformsiv.basic_array_first_elem_without_brackets.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036571,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_",
        "uniformsiv.basic_array_first_elem_without_brackets.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036572,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_u",
        "niformsiv.basic_array_first_elem_without_brackets.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036573,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active",
        "_uniformsiv.basic_array_first_elem_without_brackets.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036574,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_u",
        "niformsiv.basic_array_first_elem_without_brackets.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036575,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_un",
        "iformsiv.basic_array_first_elem_without_brackets.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036576,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_",
        "uniformsiv.basic_array_first_elem_without_brackets.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036577,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_u",
        "niformsiv.basic_array_first_elem_without_brackets.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036578,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_un",
        "iformsiv.basic_array_first_elem_without_brackets.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036579,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_",
        "uniformsiv.basic_array_first_elem_without_brackets.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036580,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_u",
        "niformsiv.basic_array_first_elem_without_brackets.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036581,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_un",
        "iformsiv.basic_array_first_elem_without_brackets.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036582,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_",
        "uniformsiv.basic_array_first_elem_without_brackets.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036583,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_u",
        "niformsiv.basic_array_first_elem_without_brackets.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036584,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_un",
        "iformsiv.basic_array_first_elem_without_brackets.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036585,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_",
        "uniformsiv.basic_array_first_elem_without_brackets.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036586,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_u",
        "niformsiv.basic_array_first_elem_without_brackets.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036587,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_un",
        "iformsiv.basic_array_first_elem_without_brackets.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036588,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_",
        "uniformsiv.basic_array_first_elem_without_brackets.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036589,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_uni",
        "formsiv.basic_array_first_elem_without_brackets.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036590,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_unif",
        "ormsiv.basic_array_first_elem_without_brackets.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036591,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_un",
        "iformsiv.basic_array_first_elem_without_brackets.sampler2D_both");
