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
#include "../ActsDeqpgles310005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004070,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_implicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004071,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_implicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004072,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s31.assignment.implicit_to_implicit.int_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004073,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_implicit.int_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004074,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_implicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004075,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.implicit_to_implicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004076,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.implicit_to_implicit.struct_5x5x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004077,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31.",
        "assignment.implicit_to_implicit.struct_5x5x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004078,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_implicit.vec3_1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004079,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_implicit.vec3_1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004080,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_implicit.ivec3_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004081,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.implicit_to_implicit.ivec3_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004082,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_implicit.bvec3_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004083,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_implicit.bvec3_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004084,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_implicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004085,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_implicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004086,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_implicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004087,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.implicit_to_implicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004088,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_implicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004089,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_implicit.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004362,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_implicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004363,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_implicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004364,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s32.assignment.implicit_to_implicit.int_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004365,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_implicit.int_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004366,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_implicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004367,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.implicit_to_implicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004368,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.implicit_to_implicit.struct_5x5x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004369,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32.",
        "assignment.implicit_to_implicit.struct_5x5x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004370,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_implicit.vec3_1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004371,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_implicit.vec3_1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004372,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_implicit.ivec3_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004373,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.implicit_to_implicit.ivec3_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004374,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_implicit.bvec3_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004375,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_implicit.bvec3_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004376,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_implicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004377,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_implicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004378,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_implicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004379,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.implicit_to_implicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004380,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_implicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004381,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_implicit.mat3_3x4_fragment");
