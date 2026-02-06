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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003950,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.out.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003951,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.out.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003952,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.out.int_2x2x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003953,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.out.int_2x2x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003954,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.out.bool_3x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003955,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.parameter.out.bool_3x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003956,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.out.vec3_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003957,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.out.vec3_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003958,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.parameter.out.struct_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003959,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.parameter.out.struct_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003960,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.out.ivec3_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003961,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.out.ivec3_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003962,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.out.bvec4_4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003963,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.out.bvec4_4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003964,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.out.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003965,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.out.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003966,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.out.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003967,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.parameter.out.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003968,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.out.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003969,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.out.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004242,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.out.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004243,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.out.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004244,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.out.int_2x2x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004245,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.out.int_2x2x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004246,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.out.bool_3x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004247,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.parameter.out.bool_3x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004248,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.out.vec3_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004249,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.out.vec3_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004250,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.parameter.out.struct_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004251,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.parameter.out.struct_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004252,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.out.ivec3_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004253,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.out.ivec3_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004254,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.out.bvec4_4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004255,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.out.bvec4_4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004256,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.out.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004257,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.out.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004258,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.out.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004259,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.parameter.out.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004260,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.out.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004261,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.out.mat3_3x4_fragment");
