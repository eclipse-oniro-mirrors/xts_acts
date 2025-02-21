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
#include "../ActsDeqpgles310007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006101,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es31.invalid.arrays.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006102,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006103,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es31.invalid.arrays.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006104,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006105,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006106,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.arrays.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006107,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006108,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.arrays.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006109,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006110,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.arrays.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006111,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006112,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.arrays.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006113,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006114,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.arrays.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006115,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006116,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.arrays.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006117,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006118,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.arrays.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006119,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006120,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.arrays.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006121,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006122,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.arrays.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006123,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.arrays.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006124,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.arrays.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007135,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es32.invalid.arrays.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007136,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007137,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es32.invalid.arrays.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007138,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007139,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007140,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.arrays.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007141,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007142,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.arrays.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007143,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007144,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.arrays.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007145,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007146,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.arrays.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007147,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007148,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.arrays.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007149,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007150,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.arrays.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007151,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007152,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.arrays.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007153,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007154,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.arrays.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007155,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007156,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.arrays.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007157,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.arrays.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007158,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.arrays.uvec4_to_vec4_fragment");
