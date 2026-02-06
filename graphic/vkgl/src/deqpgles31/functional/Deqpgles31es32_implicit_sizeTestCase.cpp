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

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004282,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.implicit_size.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004283,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.implicit_size.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004284,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es32.implicit_size.int_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004285,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.implicit_size.int_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004286,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.implicit_size.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004287,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.implicit_size.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004288,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.implicit_size.struct_5x5x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004289,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.implicit_size.struct_5x5x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004290,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.implicit_size.vec3_1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004291,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.implicit_size.vec3_1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004292,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.implicit_size.ivec3_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004293,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.implicit_size.ivec3_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004294,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.implicit_size.bvec3_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004295,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.implicit_size.bvec3_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004296,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.implicit_size.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004297,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.implicit_size.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004298,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.implicit_size.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004299,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.implicit_size.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004300,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.implicit_size.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004301,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.implicit_size.mat3_3x4_fragment");
