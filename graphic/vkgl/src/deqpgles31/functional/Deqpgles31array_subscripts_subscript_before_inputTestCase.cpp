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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005609,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005610,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005611,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "array_subscripts.subscript_before_input.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005612,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005613,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "array_subscripts.subscript_before_input.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005614,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005615,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "array_subscripts.subscript_before_input.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005616,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005617,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "array_subscripts.subscript_before_input.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005618,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005619,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005620,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005621,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005622,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005623,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005624,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005625,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005626,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005627,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005628,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005629,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005630,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005631,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005632,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005633,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005634,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.arr",
        "ay_subscripts.subscript_before_input.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005635,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005636,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005637,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005638,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005639,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005640,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.arr",
        "ay_subscripts.subscript_before_input.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005641,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005642,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005643,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005644,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005645,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005646,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.arr",
        "ay_subscripts.subscript_before_input.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005647,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005648,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005649,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rray_subscripts.subscript_before_input.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005650,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.ar",
        "ray_subscripts.subscript_before_input.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006643,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006644,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006645,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "array_subscripts.subscript_before_input.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006646,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006647,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "array_subscripts.subscript_before_input.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006648,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006649,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "array_subscripts.subscript_before_input.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006650,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006651,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "array_subscripts.subscript_before_input.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006652,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006653,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006654,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006655,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006656,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006657,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006658,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006659,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006660,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006661,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006662,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006663,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006664,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006665,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006666,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006667,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006668,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.arr",
        "ay_subscripts.subscript_before_input.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006669,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006670,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006671,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006672,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006673,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006674,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.arr",
        "ay_subscripts.subscript_before_input.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006675,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006676,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006677,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006678,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006679,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006680,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.arr",
        "ay_subscripts.subscript_before_input.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006681,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006682,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006683,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rray_subscripts.subscript_before_input.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006684,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.ar",
        "ray_subscripts.subscript_before_input.uvec4_to_vec4_fragment");
