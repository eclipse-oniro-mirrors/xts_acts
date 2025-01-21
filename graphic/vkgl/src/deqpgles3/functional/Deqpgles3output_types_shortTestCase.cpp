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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033091,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.short.components2_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033092,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components2_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033093,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.short.components3_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033094,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components3_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033095,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.short.components4_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033096,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components4_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033097,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.short.components2_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033098,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components2_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033099,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.short.components3_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033100,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components3_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033101,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.short.components4_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033102,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components4_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033103,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.short.components2_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033104,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components2_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033105,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.short.components3_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033106,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components3_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033107,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.short.components4_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033108,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components4_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033109,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components2_ivec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033110,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.output_types.short.components2_ivec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033111,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components3_ivec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033112,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.output_types.short.components3_ivec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033113,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components4_ivec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033114,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.output_types.short.components4_ivec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033115,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components2_ivec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033116,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.output_types.short.components2_ivec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033117,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components3_ivec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033118,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.output_types.short.components3_ivec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033119,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components4_ivec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033120,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.output_types.short.components4_ivec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033121,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components2_ivec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033122,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.output_types.short.components2_ivec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033123,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components3_ivec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033124,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.output_types.short.components3_ivec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033125,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.short.components4_ivec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033126,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.output_types.short.components4_ivec4_quads256");
