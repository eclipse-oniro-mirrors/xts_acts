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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003910,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.implicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003911,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.implicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003912,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.implicit.int_2x2x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003913,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.implicit.int_2x2x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003914,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.implicit.bool_3x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003915,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.return.implicit.bool_3x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003916,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.implicit.vec3_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003917,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.implicit.vec3_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003918,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.return.implicit.struct_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003919,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.return.implicit.struct_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003920,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.implicit.ivec3_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003921,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.implicit.ivec3_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003922,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.implicit.bvec4_4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003923,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.implicit.bvec4_4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003924,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.implicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003925,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.implicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003926,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.implicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003927,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.return.implicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003928,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.implicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003929,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.implicit.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004202,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.implicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004203,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.implicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004204,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.implicit.int_2x2x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004205,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.implicit.int_2x2x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004206,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.implicit.bool_3x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004207,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.return.implicit.bool_3x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004208,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.implicit.vec3_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004209,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.implicit.vec3_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004210,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.return.implicit.struct_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004211,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.return.implicit.struct_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004212,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.implicit.ivec3_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004213,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.implicit.ivec3_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004214,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.implicit.bvec4_4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004215,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.implicit.bvec4_4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004216,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.implicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004217,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.implicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004218,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.implicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004219,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.return.implicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004220,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.implicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004221,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.implicit.mat3_3x4_fragment");
