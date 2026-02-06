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

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004010,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_explicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004011,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_explicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004012,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s31.assignment.explicit_to_explicit.int_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004013,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_explicit.int_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004014,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_explicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004015,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.explicit_to_explicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004016,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.explicit_to_explicit.struct_5x5x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004017,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31.",
        "assignment.explicit_to_explicit.struct_5x5x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004018,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_explicit.vec3_1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004019,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_explicit.vec3_1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004020,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_explicit.ivec3_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004021,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.explicit_to_explicit.ivec3_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004022,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_explicit.bvec3_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004023,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_explicit.bvec3_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004024,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_explicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004025,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_explicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004026,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_explicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004027,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es31",
        ".assignment.explicit_to_explicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004028,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.assignment.explicit_to_explicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004029,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "1.assignment.explicit_to_explicit.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004302,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_explicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004303,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_explicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004304,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s32.assignment.explicit_to_explicit.int_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004305,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_explicit.int_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004306,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_explicit.bool_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004307,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.explicit_to_explicit.bool_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004308,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.explicit_to_explicit.struct_5x5x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004309,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32.",
        "assignment.explicit_to_explicit.struct_5x5x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004310,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_explicit.vec3_1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004311,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_explicit.vec3_1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004312,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_explicit.ivec3_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004313,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.explicit_to_explicit.ivec3_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004314,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_explicit.bvec3_3x1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004315,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_explicit.bvec3_3x1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004316,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_explicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004317,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_explicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004318,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_explicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004319,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es32",
        ".assignment.explicit_to_explicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004320,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.assignment.explicit_to_explicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004321,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es3",
        "2.assignment.explicit_to_explicit.mat3_3x4_fragment");
