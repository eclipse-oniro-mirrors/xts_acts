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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003990,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.implicit_size.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003991,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.implicit_size.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003992,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es31.implicit_size.int_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003993,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.implicit_size.int_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003994,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.implicit_size.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003995,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.implicit_size.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003996,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.implicit_size.struct_5x5x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003997,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.implicit_size.struct_5x5x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003998,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.implicit_size.vec3_1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003999,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.implicit_size.vec3_1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004000,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.implicit_size.ivec3_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004001,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.implicit_size.ivec3_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004002,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.implicit_size.bvec3_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004003,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.implicit_size.bvec3_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004004,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.implicit_size.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004005,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.implicit_size.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004006,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.implicit_size.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004007,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.implicit_size.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004008,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.implicit_size.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004009,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.implicit_size.mat3_3x4_fragment");
