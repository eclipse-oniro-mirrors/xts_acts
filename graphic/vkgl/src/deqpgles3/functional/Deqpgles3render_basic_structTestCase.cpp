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
#include "../ActsDeqpgles30038TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037240,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.render.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037241,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037242,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.render.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037243,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.render.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037244,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037245,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.render.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037246,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.render.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037247,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037248,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.render.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037249,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.render.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037250,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037251,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.render.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037252,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.render.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037253,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037254,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.render.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037753,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037754,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037755,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037756,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037757,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037758,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037759,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037760,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037761,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037762,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037763,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037764,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037765,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037766,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037767,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037768,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.render.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037769,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poi",
        "nter.render.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037770,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.render.basic_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038137,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.render.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038138,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038139,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.render.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038140,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.render.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038141,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038142,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.render.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038143,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.render.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038144,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038145,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.render.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038146,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.render.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038147,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038148,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.render.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038149,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_v",
        "alue.render.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038150,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_va",
        "lue.render.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038151,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.render.basic_struct.sampler2D_samplerCube_both");
