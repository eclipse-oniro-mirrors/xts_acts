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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005567,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005568,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005569,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "array_subscripts.input_before_subscript.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005570,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005571,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "array_subscripts.input_before_subscript.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005572,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005573,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "array_subscripts.input_before_subscript.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005574,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005575,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "array_subscripts.input_before_subscript.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005576,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005577,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005578,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005579,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005580,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005581,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005582,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005583,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005584,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005585,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005586,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005587,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005588,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005589,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005590,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005591,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005592,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.arr",
        "ay_subscripts.input_before_subscript.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005593,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005594,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005595,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005596,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005597,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005598,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.arr",
        "ay_subscripts.input_before_subscript.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005599,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005600,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005601,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005602,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005603,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005604,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.arr",
        "ay_subscripts.input_before_subscript.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005605,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005606,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005607,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.input_before_subscript.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005608,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.input_before_subscript.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006601,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006602,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006603,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "array_subscripts.input_before_subscript.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006604,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006605,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "array_subscripts.input_before_subscript.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006606,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006607,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "array_subscripts.input_before_subscript.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006608,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006609,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "array_subscripts.input_before_subscript.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006610,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006611,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006612,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006613,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006614,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006615,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006616,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006617,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006618,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006619,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006620,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006621,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006622,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006623,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006624,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006625,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006626,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.arr",
        "ay_subscripts.input_before_subscript.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006627,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006628,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006629,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006630,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006631,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006632,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.arr",
        "ay_subscripts.input_before_subscript.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006633,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006634,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006635,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006636,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006637,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006638,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.arr",
        "ay_subscripts.input_before_subscript.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006639,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006640,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006641,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.input_before_subscript.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006642,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.input_before_subscript.uvec4_to_vec4_fragment");
