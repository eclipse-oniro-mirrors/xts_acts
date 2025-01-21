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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033163,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components2_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033164,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components2_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033165,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components3_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033166,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components3_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033167,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components4_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033168,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components4_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033169,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components2_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033170,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components2_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033171,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components3_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033172,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components3_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033173,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components4_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033174,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components4_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033175,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components2_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033176,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components2_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033177,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components3_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033178,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components3_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033179,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components4_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033180,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components4_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033181,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components2_uvec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033182,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components2_uvec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033183,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components3_uvec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033184,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components3_uvec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033185,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components4_uvec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033186,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components4_uvec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033187,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components2_uvec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033188,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components2_uvec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033189,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components3_uvec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033190,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components3_uvec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033191,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components4_uvec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033192,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components4_uvec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033193,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components2_uvec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033194,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components2_uvec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033195,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components3_uvec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033196,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components3_uvec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033197,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_short.components4_uvec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033198,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.",
        "output_types.unsigned_short.components4_uvec4_quads256");
