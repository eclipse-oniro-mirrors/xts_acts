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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001487,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001488,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001489,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001490,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001491,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001492,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001493,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001494,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001495,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001496,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001497,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001498,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001499,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001500,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001501,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001502,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001503,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001504,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001505,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001506,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001507,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001508,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001509,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001510,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001511,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001512,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001513,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001514,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001515,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001516,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001517,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001518,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001519,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001520,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001521,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001522,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat2x4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001523,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001524,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001525,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001526,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001527,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001528,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001529,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001530,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001531,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001532,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001533,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001534,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001535,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001536,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001537,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001538,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001539,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001540,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001541,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001542,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001543,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001544,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001545,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001546,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001547,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001548,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001549,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001550,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001551,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001552,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001553,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001554,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001555,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001556,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001557,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001558,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat3x4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001559,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001560,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001561,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001562,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001563,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001564,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001565,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001566,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001567,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001568,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001569,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001570,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001571,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001572,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001573,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001574,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001575,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001576,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001577,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001578,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001579,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001580,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001581,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001582,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4x3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001583,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001584,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001585,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001586,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001587,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001588,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001589,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001590,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001591,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001592,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001593,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001594,
    "KHR-GL42.shaders.indexing.matrix_subscript.mat4_dynamic_loop_write_static_read_fragment");
