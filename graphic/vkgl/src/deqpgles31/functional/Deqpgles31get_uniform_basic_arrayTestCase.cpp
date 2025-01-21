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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016675,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016676,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016677,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.get_uniform.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016678,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.get_uniform.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016679,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016680,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016681,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.get_uniform.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016682,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016683,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016684,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.basic_array.mat4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016685,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.basic_array.mat4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016686,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_array.mat4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016687,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.get_uniform.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016688,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016689,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016690,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016691,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016692,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.get_uniform.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016693,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.get_uniform.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016694,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016695,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016696,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016697,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016698,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.get_uniform.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016699,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.basic_array.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016700,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.basic_array.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016701,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_array.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016702,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_array.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016703,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.basic_array.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016704,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic_array.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016705,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.basic_array.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016706,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.basic_array.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016707,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_array.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016708,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.basic_array.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016709,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".get_uniform.basic_array.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016710,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.basic_array.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016711,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.basic_array.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016712,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.basic_array.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016713,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_array.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016714,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.basic_array.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016715,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.basic_array.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016716,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_array.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016717,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016718,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016719,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic_array.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017146,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017147,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017148,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.get_uniform.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017149,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.get_uniform.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017150,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017151,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.get_uniform.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017152,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.get_uniform.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017153,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017154,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.get_uniform.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017155,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017156,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017157,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.get_uniform.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017158,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.get_uniform.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017159,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017160,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.get_uniform.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017161,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017162,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017163,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.get_uniform.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017164,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.basic_array.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017165,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.basic_array.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017166,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic_array.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017167,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic_array.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017168,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.basic_array.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017169,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic_array.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017170,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.basic_array.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017171,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.basic_array.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017172,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic_array.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017173,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.basic_array.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017174,
        "dEQP-GLES31.functional.program_uniform.by_value.",
        "get_uniform.basic_array.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017175,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.basic_array.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017176,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.basic_array.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017177,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.basic_array.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017178,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic_array.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017179,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.basic_array.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017180,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.basic_array.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017181,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic_array.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017182,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017183,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017184,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic_array.sampler2D_both");
