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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033253,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components2_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033254,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components2_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033255,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components3_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033256,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components3_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033257,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components4_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033258,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components4_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033259,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components2_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033260,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components2_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033261,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components3_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033262,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components3_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033263,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components4_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033264,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components4_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033265,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components2_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033266,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components2_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033267,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components3_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033268,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components3_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033269,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components4_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033270,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components4_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033271,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components2_uvec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033272,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components2_uvec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033273,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components3_uvec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033274,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components3_uvec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033275,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components4_uvec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033276,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components4_uvec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033277,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components2_uvec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033278,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components2_uvec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033279,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components3_uvec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033280,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components3_uvec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033281,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components4_uvec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033282,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components4_uvec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033283,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components2_uvec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033284,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components2_uvec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033285,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components3_uvec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033286,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components3_uvec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033287,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.output_types.unsigned_int.components4_uvec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033288,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".output_types.unsigned_int.components4_uvec4_quads256");
