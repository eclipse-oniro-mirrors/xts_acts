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
#include "../ActsDeqpgles310004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003860,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.implicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003861,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.implicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003862,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.implicit.float_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003863,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.implicit.float_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003864,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.constructor.implicit.int_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003865,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.implicit.int_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003866,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.implicit.int_4x4x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003867,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.implicit.int_4x4x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003868,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.implicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003869,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.implicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003870,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.implicit.bool_2x1x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003871,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.implicit.bool_2x1x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003872,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.implicit.struct_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003873,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.implicit.struct_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003874,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.implicit.struct_4x1x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003875,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es31.constructor.implicit.struct_4x1x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003876,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.constructor.implicit.vec3_4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003877,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.implicit.vec3_4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003878,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.implicit.ivec3_3x2x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003879,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es31.constructor.implicit.ivec3_3x2x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003880,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.implicit.bvec3_1x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003881,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es31.constructor.implicit.bvec3_1x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003882,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.constructor.implicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003883,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.implicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003884,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.implicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003885,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.implicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003886,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.constructor.implicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003887,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.implicit.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003888,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31.",
        "constructor.implicit.int_high_dimensional_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003889,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31.c",
        "onstructor.implicit.int_high_dimensional_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004152,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.implicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004153,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.implicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004154,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.implicit.float_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004155,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.implicit.float_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004156,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.constructor.implicit.int_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004157,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.implicit.int_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004158,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.implicit.int_4x4x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004159,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.implicit.int_4x4x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004160,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.implicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004161,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.implicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004162,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.implicit.bool_2x1x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004163,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.implicit.bool_2x1x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004164,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.implicit.struct_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004165,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.implicit.struct_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004166,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.implicit.struct_4x1x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004167,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es32.constructor.implicit.struct_4x1x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004168,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.constructor.implicit.vec3_4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004169,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.implicit.vec3_4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004170,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.implicit.ivec3_3x2x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004171,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es32.constructor.implicit.ivec3_3x2x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004172,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.implicit.bvec3_1x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004173,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es32.constructor.implicit.bvec3_1x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004174,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.constructor.implicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004175,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.implicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004176,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.implicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004177,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.implicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004178,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.constructor.implicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004179,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.implicit.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004180,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32.",
        "constructor.implicit.int_high_dimensional_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004181,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32.c",
        "onstructor.implicit.int_high_dimensional_array_fragment");
