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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003930,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.in.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003931,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.in.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003932,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.in.int_2x2x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003933,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.in.int_2x2x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003934,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.in.bool_3x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003935,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.in.bool_3x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003936,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es31.parameter.in.vec3_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003937,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.in.vec3_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003938,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.in.struct_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003939,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.parameter.in.struct_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003940,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.in.ivec3_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003941,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.in.ivec3_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003942,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.in.bvec4_4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003943,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.in.bvec4_4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003944,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es31.parameter.in.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003945,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.in.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003946,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.in.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003947,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.parameter.in.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003948,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es31.parameter.in.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003949,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.parameter.in.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004222,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.in.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004223,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.in.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004224,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.in.int_2x2x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004225,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.in.int_2x2x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004226,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.in.bool_3x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004227,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.in.bool_3x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004228,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es32.parameter.in.vec3_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004229,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.in.vec3_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004230,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.in.struct_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004231,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.parameter.in.struct_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004232,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.in.ivec3_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004233,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.in.ivec3_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004234,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.in.bvec4_4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004235,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.in.bvec4_4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004236,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es32.parameter.in.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004237,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.in.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004238,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.in.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004239,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.parameter.in.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004240,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es32.parameter.in.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004241,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.parameter.in.mat3_3x4_fragment");
