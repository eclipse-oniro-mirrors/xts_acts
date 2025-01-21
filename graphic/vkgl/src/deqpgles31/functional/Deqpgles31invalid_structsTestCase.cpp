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

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006125,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.structs.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006126,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.structs.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006127,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es31.invalid.structs.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006128,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.structs.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006129,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.structs.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006130,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.structs.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006131,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.structs.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006132,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.structs.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006133,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.structs.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006134,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.structs.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006135,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.structs.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006136,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.structs.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006137,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.structs.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006138,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.structs.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006139,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.structs.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006140,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.structs.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006141,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.structs.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006142,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.structs.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006143,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.structs.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006144,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es31.invalid.structs.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006145,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.structs.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006146,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.structs.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006147,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es31.invalid.structs.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006148,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es31.invalid.structs.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007159,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.structs.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007160,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.structs.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007161,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es32.invalid.structs.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007162,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.structs.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007163,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.structs.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007164,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.structs.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007165,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.structs.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007166,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.structs.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007167,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.structs.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007168,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.structs.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007169,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.structs.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007170,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.structs.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007171,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.structs.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007172,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.structs.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007173,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.structs.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007174,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.structs.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007175,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.structs.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007176,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.structs.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007177,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.structs.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007178,
        "dEQP-GLES31.functional.shaders.implicit_conversi",
        "ons.es32.invalid.structs.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007179,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.structs.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007180,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.structs.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007181,
        "dEQP-GLES31.functional.shaders.implicit_conver",
        "sions.es32.invalid.structs.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_007182,
        "dEQP-GLES31.functional.shaders.implicit_convers",
        "ions.es32.invalid.structs.uvec4_to_vec4_fragment");
