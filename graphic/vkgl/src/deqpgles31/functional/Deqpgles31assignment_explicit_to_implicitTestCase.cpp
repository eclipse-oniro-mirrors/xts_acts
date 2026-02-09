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

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004030,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_implicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004031,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_implicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004032,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s31.assignment.explicit_to_implicit.int_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004033,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_implicit.int_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004034,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_implicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004035,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.explicit_to_implicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004036,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.explicit_to_implicit.struct_5x5x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004037,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31.",
        "assignment.explicit_to_implicit.struct_5x5x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004038,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_implicit.vec3_1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004039,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_implicit.vec3_1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004040,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_implicit.ivec3_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004041,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.explicit_to_implicit.ivec3_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004042,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_implicit.bvec3_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004043,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_implicit.bvec3_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004044,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_implicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004045,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_implicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004046,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_implicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004047,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.explicit_to_implicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004048,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_implicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004049,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_implicit.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004322,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_implicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004323,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_implicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004324,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s32.assignment.explicit_to_implicit.int_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004325,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_implicit.int_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004326,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_implicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004327,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.explicit_to_implicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004328,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.explicit_to_implicit.struct_5x5x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004329,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32.",
        "assignment.explicit_to_implicit.struct_5x5x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004330,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_implicit.vec3_1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004331,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_implicit.vec3_1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004332,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_implicit.ivec3_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004333,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.explicit_to_implicit.ivec3_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004334,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_implicit.bvec3_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004335,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_implicit.bvec3_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004336,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_implicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004337,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_implicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004338,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_implicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004339,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.explicit_to_implicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004340,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_implicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004341,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_implicit.mat3_3x4_fragment");
