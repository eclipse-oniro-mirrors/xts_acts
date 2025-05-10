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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033289,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.output_types.int.components2_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033290,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components2_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033291,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.output_types.int.components3_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033292,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components3_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033293,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.output_types.int.components4_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033294,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components4_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033295,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.output_types.int.components2_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033296,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components2_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033297,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.output_types.int.components3_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033298,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components3_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033299,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.output_types.int.components4_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033300,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components4_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033301,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.output_types.int.components2_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033302,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components2_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033303,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.output_types.int.components3_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033304,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components3_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033305,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.output_types.int.components4_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033306,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components4_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033307,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components2_ivec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033308,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.int.components2_ivec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033309,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components3_ivec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033310,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.int.components3_ivec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033311,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components4_ivec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033312,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.int.components4_ivec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033313,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components2_ivec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033314,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.int.components2_ivec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033315,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components3_ivec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033316,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.int.components3_ivec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033317,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components4_ivec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033318,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.int.components4_ivec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033319,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components2_ivec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033320,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.int.components2_ivec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033321,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components3_ivec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033322,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.int.components3_ivec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033323,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.int.components4_ivec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033324,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.int.components4_ivec4_quads256");
