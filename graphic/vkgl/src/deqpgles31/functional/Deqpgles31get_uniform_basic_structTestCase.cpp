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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016765,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016766,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016767,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016768,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016769,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016770,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016771,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016772,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016773,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016774,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016775,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016776,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016777,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016778,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016779,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016780,
        "dEQP-GLES31.functional.program_uniform.by_pointer.g",
        "et_uniform.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016781,
        "dEQP-GLES31.functional.program_uniform.by_pointer.ge",
        "t_uniform.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016782,
        "dEQP-GLES31.functional.program_uniform.by_pointer.",
        "get_uniform.basic_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017224,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017225,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017226,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017227,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017228,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017229,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017230,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017231,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017232,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017233,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017234,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017235,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017236,
        "dEQP-GLES31.functional.program_uniform.by_value.ge",
        "t_uniform.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017237,
        "dEQP-GLES31.functional.program_uniform.by_value.get",
        "_uniform.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017238,
        "dEQP-GLES31.functional.program_uniform.by_value.g",
        "et_uniform.basic_struct.sampler2D_samplerCube_both");
