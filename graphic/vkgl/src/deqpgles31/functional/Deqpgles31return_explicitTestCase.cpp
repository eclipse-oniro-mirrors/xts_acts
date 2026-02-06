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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003890,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.explicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003891,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.explicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003892,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.explicit.int_2x2x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003893,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.explicit.int_2x2x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003894,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.explicit.bool_3x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003895,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.return.explicit.bool_3x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003896,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.explicit.vec3_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003897,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.explicit.vec3_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003898,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.return.explicit.struct_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003899,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es31.return.explicit.struct_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003900,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.explicit.ivec3_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003901,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.explicit.ivec3_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003902,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.explicit.bvec4_4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003903,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.explicit.bvec4_4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003904,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.explicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003905,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.explicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003906,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.explicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003907,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.return.explicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003908,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es31.return.explicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003909,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.return.explicit.mat3_3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004182,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.explicit.float_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004183,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.explicit.float_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004184,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.explicit.int_2x2x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004185,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.explicit.int_2x2x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004186,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.explicit.bool_3x2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004187,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.return.explicit.bool_3x2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004188,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.explicit.vec3_2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004189,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.explicit.vec3_2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004190,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.return.explicit.struct_3x1x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004191,
        "dEQP-GLES31.functional.shaders.arrays_of_arra",
        "ys.es32.return.explicit.struct_3x1x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004192,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.explicit.ivec3_3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004193,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.explicit.ivec3_3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004194,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.explicit.bvec4_4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004195,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.explicit.bvec4_4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004196,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.explicit.mat3_3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004197,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.explicit.mat3_3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004198,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.explicit.mat3_3x3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004199,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.return.explicit.mat3_3x3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004200,
        "dEQP-GLES31.functional.shaders.arrays_of_a",
        "rrays.es32.return.explicit.mat3_3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004201,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.return.explicit.mat3_3x4_fragment");
