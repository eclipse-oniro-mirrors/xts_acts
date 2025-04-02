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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30034TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033199,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_byte.components2_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033200,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components2_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033201,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_byte.components3_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033202,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components3_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033203,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_byte.components4_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033204,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components4_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033205,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_byte.components2_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033206,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components2_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033207,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_byte.components3_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033208,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components3_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033209,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_byte.components4_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033210,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components4_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033211,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_byte.components2_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033212,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components2_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033213,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_byte.components3_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033214,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components3_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033215,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_byte.components4_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033216,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components4_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033217,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components2_uvec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033218,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_byte.components2_uvec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033219,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components3_uvec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033220,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_byte.components3_uvec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033221,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components4_uvec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033222,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_byte.components4_uvec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033223,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components2_uvec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033224,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_byte.components2_uvec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033225,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components3_uvec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033226,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_byte.components3_uvec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033227,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components4_uvec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033228,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_byte.components4_uvec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033229,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components2_uvec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033230,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_byte.components2_uvec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033231,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components3_uvec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033232,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_byte.components3_uvec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033233,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_byte.components4_uvec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033234,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_byte.components4_uvec4_quads256");
