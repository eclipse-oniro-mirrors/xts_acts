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

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004050,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_explicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004051,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_explicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004052,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s31.assignment.implicit_to_explicit.int_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004053,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_explicit.int_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004054,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_explicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004055,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.implicit_to_explicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004056,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.implicit_to_explicit.struct_5x5x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004057,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31.",
        "assignment.implicit_to_explicit.struct_5x5x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004058,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_explicit.vec3_1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004059,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_explicit.vec3_1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004060,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_explicit.ivec3_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004061,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.implicit_to_explicit.ivec3_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004062,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_explicit.bvec3_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004063,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_explicit.bvec3_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004064,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_explicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004065,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_explicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004066,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_explicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004067,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.implicit_to_explicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004068,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.implicit_to_explicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004069,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.implicit_to_explicit.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004342,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_explicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004343,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_explicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004344,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s32.assignment.implicit_to_explicit.int_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004345,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_explicit.int_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004346,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_explicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004347,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.implicit_to_explicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004348,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.implicit_to_explicit.struct_5x5x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004349,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32.",
        "assignment.implicit_to_explicit.struct_5x5x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004350,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_explicit.vec3_1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004351,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_explicit.vec3_1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004352,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_explicit.ivec3_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004353,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.implicit_to_explicit.ivec3_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004354,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_explicit.bvec3_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004355,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_explicit.bvec3_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004356,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_explicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004357,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_explicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004358,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_explicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004359,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.implicit_to_explicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004360,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.implicit_to_explicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004361,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.implicit_to_explicit.mat3_3x4_fragment");
