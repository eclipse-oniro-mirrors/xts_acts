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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005717,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.field_before_input.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005718,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005719,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.field_before_input.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005720,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005721,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.field_before_input.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005722,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005723,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.field_before_input.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005724,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005725,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.field_before_input.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005726,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005727,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.field_before_input.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005728,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005729,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.field_before_input.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005730,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005731,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.field_before_input.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005732,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005733,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005734,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.field_before_input.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005735,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.field_before_input.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005736,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005737,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.field_before_input.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005738,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005739,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "31.struct_fields.field_before_input.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005740,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005741,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005742,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.field_before_input.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005743,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005744,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.field_before_input.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005745,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005746,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.field_before_input.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005747,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005748,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.field_before_input.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005749,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005750,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.field_before_input.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005751,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005752,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.field_before_input.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005753,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005754,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.field_before_input.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005755,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005756,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.field_before_input.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005757,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.struct_fields.field_before_input.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005758,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".struct_fields.field_before_input.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006751,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.field_before_input.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006752,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006753,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.field_before_input.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006754,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006755,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.field_before_input.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006756,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006757,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.field_before_input.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006758,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006759,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.field_before_input.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006760,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006761,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.field_before_input.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006762,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006763,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.field_before_input.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006764,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006765,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.field_before_input.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006766,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006767,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006768,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.field_before_input.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006769,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.field_before_input.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006770,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006771,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.field_before_input.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006772,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006773,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es",
        "32.struct_fields.field_before_input.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006774,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006775,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006776,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.field_before_input.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006777,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006778,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.field_before_input.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006779,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006780,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.field_before_input.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006781,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006782,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.field_before_input.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006783,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006784,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.field_before_input.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006785,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006786,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.field_before_input.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006787,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006788,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.field_before_input.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006789,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006790,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.field_before_input.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006791,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.struct_fields.field_before_input.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006792,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".struct_fields.field_before_input.uvec4_to_vec4_fragment");
