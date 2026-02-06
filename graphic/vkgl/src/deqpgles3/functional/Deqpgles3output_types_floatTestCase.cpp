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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033073,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.float.components2_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033074,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.float.components2_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033075,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.float.components3_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033076,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.float.components3_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033077,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.float.components4_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033078,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.float.components4_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033079,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.float.components2_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033080,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.float.components2_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033081,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.float.components3_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033082,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.float.components3_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033083,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.float.components4_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033084,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.float.components4_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033085,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.float.components2_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033086,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.float.components2_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033087,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.float.components3_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033088,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.float.components3_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033089,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.float.components4_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033090,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.float.components4_vec4_quads256");
