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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033235,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.fixed.components2_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033236,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.fixed.components2_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033237,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.fixed.components3_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033238,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.fixed.components3_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033239,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.fixed.components4_vec2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033240,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.fixed.components4_vec2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033241,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.fixed.components2_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033242,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.fixed.components2_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033243,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.fixed.components3_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033244,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.fixed.components3_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033245,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.fixed.components4_vec3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033246,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.fixed.components4_vec3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033247,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.fixed.components2_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033248,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.fixed.components2_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033249,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.fixed.components3_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033250,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.fixed.components3_vec4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033251,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.output_types.fixed.components4_vec4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033252,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.output_types.fixed.components4_vec4_quads256");
