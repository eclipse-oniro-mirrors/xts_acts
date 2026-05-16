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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016720,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016721,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unif",
        "orm.basic_array_first_elem_without_brackets.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016722,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016723,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016724,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016725,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016726,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016727,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016728,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016729,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform",
        ".basic_array_first_elem_without_brackets.mat4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016730,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform.",
        "basic_array_first_elem_without_brackets.mat4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016731,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unifor",
        "m.basic_array_first_elem_without_brackets.mat4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016732,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016733,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016734,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016735,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016736,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unif",
        "orm.basic_array_first_elem_without_brackets.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016737,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016738,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016739,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016740,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016741,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016742,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unif",
        "orm.basic_array_first_elem_without_brackets.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016743,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016744,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform",
        ".basic_array_first_elem_without_brackets.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016745,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform.",
        "basic_array_first_elem_without_brackets.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016746,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unifor",
        "m.basic_array_first_elem_without_brackets.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016747,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unifor",
        "m.basic_array_first_elem_without_brackets.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016748,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform",
        ".basic_array_first_elem_without_brackets.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016749,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unifo",
        "rm.basic_array_first_elem_without_brackets.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016750,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform",
        ".basic_array_first_elem_without_brackets.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016751,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform.",
        "basic_array_first_elem_without_brackets.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016752,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unifor",
        "m.basic_array_first_elem_without_brackets.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016753,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform.",
        "basic_array_first_elem_without_brackets.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016754,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform.b",
        "asic_array_first_elem_without_brackets.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016755,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform",
        ".basic_array_first_elem_without_brackets.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016756,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform",
        ".basic_array_first_elem_without_brackets.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016757,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform.",
        "basic_array_first_elem_without_brackets.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016758,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unifor",
        "m.basic_array_first_elem_without_brackets.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016759,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform",
        ".basic_array_first_elem_without_brackets.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016760,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uniform.",
        "basic_array_first_elem_without_brackets.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016761,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unifor",
        "m.basic_array_first_elem_without_brackets.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016762,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unifo",
        "rm.basic_array_first_elem_without_brackets.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016763,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unifor",
        "m.basic_array_first_elem_without_brackets.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016764,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_unif",
        "orm.basic_array_first_elem_without_brackets.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017185,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017186,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unifo",
        "rm.basic_array_first_elem_without_brackets.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017187,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017188,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017189,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017190,
        "dEQP-GLES31.functional.program_uniform.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017191,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017192,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017193,
        "dEQP-GLES31.functional.program_uniform.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017194,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017195,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unifo",
        "rm.basic_array_first_elem_without_brackets.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017196,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017197,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017198,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017199,
        "dEQP-GLES31.functional.program_uniform.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017200,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017201,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unifo",
        "rm.basic_array_first_elem_without_brackets.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017202,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017203,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.",
        "basic_array_first_elem_without_brackets.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017204,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.b",
        "asic_array_first_elem_without_brackets.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017205,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform",
        ".basic_array_first_elem_without_brackets.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017206,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform",
        ".basic_array_first_elem_without_brackets.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017207,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.",
        "basic_array_first_elem_without_brackets.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017208,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unifor",
        "m.basic_array_first_elem_without_brackets.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017209,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.",
        "basic_array_first_elem_without_brackets.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017210,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.b",
        "asic_array_first_elem_without_brackets.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017211,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform",
        ".basic_array_first_elem_without_brackets.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017212,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.b",
        "asic_array_first_elem_without_brackets.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017213,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.ba",
        "sic_array_first_elem_without_brackets.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017214,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.",
        "basic_array_first_elem_without_brackets.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017215,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.",
        "basic_array_first_elem_without_brackets.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017216,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.b",
        "asic_array_first_elem_without_brackets.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017217,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform",
        ".basic_array_first_elem_without_brackets.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017218,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.",
        "basic_array_first_elem_without_brackets.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017219,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform.b",
        "asic_array_first_elem_without_brackets.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017220,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform",
        ".basic_array_first_elem_without_brackets.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017221,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unifor",
        "m.basic_array_first_elem_without_brackets.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017222,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uniform",
        ".basic_array_first_elem_without_brackets.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017223,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unifo",
        "rm.basic_array_first_elem_without_brackets.sampler2D_both");
