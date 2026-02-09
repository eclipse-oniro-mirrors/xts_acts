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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003970,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.parameter.unnamed.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003971,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.parameter.unnamed.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003972,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.parameter.unnamed.int_2x2x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003973,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.parameter.unnamed.int_2x2x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003974,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.parameter.unnamed.bool_3x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003975,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.parameter.unnamed.bool_3x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003976,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.parameter.unnamed.vec3_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003977,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.parameter.unnamed.vec3_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003978,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.parameter.unnamed.struct_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003979,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.parameter.unnamed.struct_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003980,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.parameter.unnamed.ivec3_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003981,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.parameter.unnamed.ivec3_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003982,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.parameter.unnamed.bvec4_4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003983,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.parameter.unnamed.bvec4_4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003984,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.parameter.unnamed.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003985,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.parameter.unnamed.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003986,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.parameter.unnamed.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003987,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.parameter.unnamed.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003988,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.parameter.unnamed.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003989,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.parameter.unnamed.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004262,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.parameter.unnamed.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004263,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.parameter.unnamed.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004264,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.parameter.unnamed.int_2x2x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004265,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.parameter.unnamed.int_2x2x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004266,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.parameter.unnamed.bool_3x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004267,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.parameter.unnamed.bool_3x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004268,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.parameter.unnamed.vec3_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004269,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.parameter.unnamed.vec3_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004270,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.parameter.unnamed.struct_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004271,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.parameter.unnamed.struct_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004272,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.parameter.unnamed.ivec3_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004273,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.parameter.unnamed.ivec3_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004274,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.parameter.unnamed.bvec4_4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004275,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.parameter.unnamed.bvec4_4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004276,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.parameter.unnamed.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004277,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.parameter.unnamed.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004278,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.parameter.unnamed.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004279,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.parameter.unnamed.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004280,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.parameter.unnamed.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004281,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.parameter.unnamed.mat3_3x4_fragment");
