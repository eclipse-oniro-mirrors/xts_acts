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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005675,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.input_before_field.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005676,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005677,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.input_before_field.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005678,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005679,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.input_before_field.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005680,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005681,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.input_before_field.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005682,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005683,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.input_before_field.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005684,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005685,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.input_before_field.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005686,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005687,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.input_before_field.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005688,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005689,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.input_before_field.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005690,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005691,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005692,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.input_before_field.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005693,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.input_before_field.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005694,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005695,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.input_before_field.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005696,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005697,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.input_before_field.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005698,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005699,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005700,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.input_before_field.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005701,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005702,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.input_before_field.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005703,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005704,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.input_before_field.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005705,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005706,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.input_before_field.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005707,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005708,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.input_before_field.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005709,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005710,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.input_before_field.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005711,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005712,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.input_before_field.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005713,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005714,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.input_before_field.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005715,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.input_before_field.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005716,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.input_before_field.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006709,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.input_before_field.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006710,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006711,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.input_before_field.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006712,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006713,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.input_before_field.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006714,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006715,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.input_before_field.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006716,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006717,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.input_before_field.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006718,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006719,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.input_before_field.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006720,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006721,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.input_before_field.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006722,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006723,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.input_before_field.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006724,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006725,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006726,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.input_before_field.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006727,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.input_before_field.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006728,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006729,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.input_before_field.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006730,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006731,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.input_before_field.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006732,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006733,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006734,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.input_before_field.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006735,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006736,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.input_before_field.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006737,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006738,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.input_before_field.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006739,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006740,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.input_before_field.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006741,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006742,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.input_before_field.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006743,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006744,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.input_before_field.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006745,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006746,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.input_before_field.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006747,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006748,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.input_before_field.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006749,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.input_before_field.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006750,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.input_before_field.uvec4_to_vec4_fragment");
