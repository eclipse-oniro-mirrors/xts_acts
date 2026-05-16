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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033127,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components2_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033128,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components2_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033129,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components3_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033130,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components3_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033131,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components4_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033132,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components4_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033133,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components2_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033134,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components2_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033135,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components3_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033136,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components3_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033137,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components4_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033138,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components4_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033139,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components2_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033140,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components2_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033141,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components3_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033142,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components3_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033143,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components4_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033144,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components4_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033145,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components2_ivec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033146,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components2_ivec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033147,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components3_ivec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033148,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components3_ivec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033149,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components4_ivec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033150,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components4_ivec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033151,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components2_ivec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033152,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components2_ivec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033153,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components3_ivec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033154,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components3_ivec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033155,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components4_ivec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033156,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components4_ivec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033157,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components2_ivec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033158,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components2_ivec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033159,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components3_ivec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033160,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components3_ivec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033161,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.byte.components4_ivec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033162,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.byte.components4_ivec4_quads256");
