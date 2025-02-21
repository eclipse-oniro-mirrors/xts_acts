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

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037006,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037007,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037008,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037009,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037010,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037011,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037012,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037013,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037014,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037015,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037016,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037017,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037018,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037019,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037020,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037021,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037022,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037023,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037024,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037025,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037026,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037027,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.basic_array.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037028,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.basic_array.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037029,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic_array.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037030,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic_array.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037031,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.basic_array.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037032,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic_array.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037033,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.basic_array.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037034,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.basic_array.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037035,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic_array.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037036,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.basic_array.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037037,
        "dEQP-GLES3.functional.uniform_api.value.initial.",
        "get_uniform.basic_array.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037038,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.basic_array.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037039,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.basic_array.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037040,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.basic_array.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037041,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic_array.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037042,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.basic_array.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037043,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.basic_array.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037044,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic_array.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037045,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037046,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037047,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic_array.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037441,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037442,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037443,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037444,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037445,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037446,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037447,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037448,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037449,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037450,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_array.mat4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037451,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.basic_array.mat4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037452,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_array.mat4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037453,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037454,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037455,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037456,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037457,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037458,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037459,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037460,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037461,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037462,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037463,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037464,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037465,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_array.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037466,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.basic_array.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037467,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_array.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037468,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_array.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037469,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_array.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037470,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_array.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037471,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_array.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037472,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.basic_array.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037473,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_array.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037474,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.basic_array.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037475,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.basic_array.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037476,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_array.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037477,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_array.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037478,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.basic_array.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037479,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_array.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037480,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_array.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037481,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.basic_array.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037482,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_array.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037483,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037484,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037485,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic_array.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037912,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037913,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037914,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037915,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037916,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037917,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037918,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037919,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037920,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037921,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037922,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037923,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037924,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037925,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037926,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037927,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037928,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037929,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037930,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_array.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037931,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.basic_array.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037932,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_array.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037933,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_array.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037934,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_array.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037935,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic_array.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037936,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_array.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037937,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.basic_array.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037938,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_array.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037939,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.basic_array.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037940,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_v",
        "alue.get_uniform.basic_array.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037941,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_array.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037942,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_array.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037943,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.basic_array.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037944,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_array.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037945,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_array.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037946,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.basic_array.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037947,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_array.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037948,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037949,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037950,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic_array.sampler2D_both");
