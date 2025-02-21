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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036406,
        "dEQP-GLES3.functional.uniform_api.info_query.acti",
        "ve_uniform.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036407,
        "dEQP-GLES3.functional.uniform_api.info_query.activ",
        "e_uniform.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036408,
        "dEQP-GLES3.functional.uniform_api.info_query.act",
        "ive_uniform.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036409,
        "dEQP-GLES3.functional.uniform_api.info_query.acti",
        "ve_uniform.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036410,
        "dEQP-GLES3.functional.uniform_api.info_query.activ",
        "e_uniform.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036411,
        "dEQP-GLES3.functional.uniform_api.info_query.act",
        "ive_uniform.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036412,
        "dEQP-GLES3.functional.uniform_api.info_query.acti",
        "ve_uniform.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036413,
        "dEQP-GLES3.functional.uniform_api.info_query.activ",
        "e_uniform.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036414,
        "dEQP-GLES3.functional.uniform_api.info_query.act",
        "ive_uniform.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036415,
        "dEQP-GLES3.functional.uniform_api.info_query.acti",
        "ve_uniform.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036416,
        "dEQP-GLES3.functional.uniform_api.info_query.activ",
        "e_uniform.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036417,
        "dEQP-GLES3.functional.uniform_api.info_query.act",
        "ive_uniform.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036418,
        "dEQP-GLES3.functional.uniform_api.info_query.acti",
        "ve_uniform.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036419,
        "dEQP-GLES3.functional.uniform_api.info_query.activ",
        "e_uniform.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036420,
        "dEQP-GLES3.functional.uniform_api.info_query.act",
        "ive_uniform.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036421,
        "dEQP-GLES3.functional.uniform_api.info_query.active_uni",
        "form.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036422,
        "dEQP-GLES3.functional.uniform_api.info_query.active_unif",
        "orm.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036423,
        "dEQP-GLES3.functional.uniform_api.info_query.active_un",
        "iform.nested_structs_arrays.sampler2D_samplerCube_both");
