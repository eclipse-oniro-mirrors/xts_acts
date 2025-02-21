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
#include "../ActsDeqpgles310006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005519,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.not_equal.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005520,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005521,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.not_equal.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005522,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005523,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005524,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.literal_before_input.not_equal.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005525,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005526,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.literal_before_input.not_equal.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005527,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005528,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.literal_before_input.not_equal.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005529,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005530,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.literal_before_input.not_equal.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005531,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005532,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.literal_before_input.not_equal.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005533,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005534,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.literal_before_input.not_equal.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005535,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005536,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.literal_before_input.not_equal.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005537,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005538,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.literal_before_input.not_equal.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005539,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005540,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.literal_before_input.not_equal.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005541,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.not_equal.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005542,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.literal_before_input.not_equal.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006553,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.not_equal.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006554,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006555,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.not_equal.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006556,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006557,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006558,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.literal_before_input.not_equal.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006559,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006560,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.literal_before_input.not_equal.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006561,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006562,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.literal_before_input.not_equal.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006563,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006564,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.literal_before_input.not_equal.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006565,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006566,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.literal_before_input.not_equal.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006567,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006568,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.literal_before_input.not_equal.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006569,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006570,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.literal_before_input.not_equal.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006571,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006572,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.literal_before_input.not_equal.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006573,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006574,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.literal_before_input.not_equal.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006575,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.not_equal.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006576,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.literal_before_input.not_equal.uvec4_to_vec4_fragment");
