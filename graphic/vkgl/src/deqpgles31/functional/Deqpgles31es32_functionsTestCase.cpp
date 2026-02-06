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

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006685,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es32.functions.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006686,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es32.functions.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006687,
        "dEQP-GLES31.functional.shaders.implicit_co",
        "nversions.es32.functions.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006688,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es32.functions.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006689,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es32.functions.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006690,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es32.functions.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006691,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es32.functions.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006692,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es32.functions.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006693,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es32.functions.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006694,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es32.functions.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006695,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es32.functions.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006696,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es32.functions.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006697,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es32.functions.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006698,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es32.functions.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006699,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es32.functions.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006700,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es32.functions.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006701,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es32.functions.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006702,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es32.functions.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006703,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es32.functions.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006704,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es32.functions.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006705,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es32.functions.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006706,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es32.functions.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006707,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es32.functions.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006708,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es32.functions.uvec4_to_vec4_fragment");
