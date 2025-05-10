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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003830,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.explicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003831,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.explicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003832,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.explicit.float_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003833,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.explicit.float_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003834,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.constructor.explicit.int_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003835,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.explicit.int_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003836,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.explicit.int_4x4x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003837,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.explicit.int_4x4x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003838,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.explicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003839,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.explicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003840,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.explicit.bool_2x1x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003841,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.explicit.bool_2x1x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003842,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.explicit.struct_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003843,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.explicit.struct_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003844,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.explicit.struct_4x1x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003845,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es31.constructor.explicit.struct_4x1x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003846,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.constructor.explicit.vec3_4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003847,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.explicit.vec3_4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003848,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.explicit.ivec3_3x2x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003849,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es31.constructor.explicit.ivec3_3x2x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003850,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.explicit.bvec3_1x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003851,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es31.constructor.explicit.bvec3_1x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003852,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.constructor.explicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003853,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.explicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003854,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.explicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003855,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es31.constructor.explicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003856,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.constructor.explicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003857,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.constructor.explicit.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003858,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.constructor.explicit.high_dimensional_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003859,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".constructor.explicit.high_dimensional_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004122,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.explicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004123,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.explicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004124,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.explicit.float_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004125,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.explicit.float_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004126,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.constructor.explicit.int_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004127,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.explicit.int_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004128,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.explicit.int_4x4x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004129,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.explicit.int_4x4x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004130,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.explicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004131,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.explicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004132,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.explicit.bool_2x1x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004133,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.explicit.bool_2x1x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004134,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.explicit.struct_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004135,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.explicit.struct_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004136,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.explicit.struct_4x1x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004137,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es32.constructor.explicit.struct_4x1x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004138,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.constructor.explicit.vec3_4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004139,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.explicit.vec3_4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004140,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.explicit.ivec3_3x2x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004141,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es32.constructor.explicit.ivec3_3x2x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004142,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.explicit.bvec3_1x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004143,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays",
        ".es32.constructor.explicit.bvec3_1x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004144,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.constructor.explicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004145,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.explicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004146,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.explicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004147,
        "dEQP-GLES31.functional.shaders.arrays_of_array",
        "s.es32.constructor.explicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004148,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.constructor.explicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004149,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.constructor.explicit.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004150,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.constructor.explicit.high_dimensional_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004151,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".constructor.explicit.high_dimensional_array_fragment");
