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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002633,
    "KHR-GL42.shaders.struct.local.basic_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002634,
    "KHR-GL42.shaders.struct.local.basic_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002635,
    "KHR-GL42.shaders.struct.local.nested_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002636,
    "KHR-GL42.shaders.struct.local.nested_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002637,
    "KHR-GL42.shaders.struct.local.array_member_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002638,
    "KHR-GL42.shaders.struct.local.array_member_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002639,
    "KHR-GL42.shaders.struct.local.array_member_dynamic_index_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002640,
    "KHR-GL42.shaders.struct.local.array_member_dynamic_index_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002641,
    "KHR-GL42.shaders.struct.local.struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002642,
    "KHR-GL42.shaders.struct.local.struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002643,
    "KHR-GL42.shaders.struct.local.struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002644,
    "KHR-GL42.shaders.struct.local.struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002645,
    "KHR-GL42.shaders.struct.local.nested_struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002646,
    "KHR-GL42.shaders.struct.local.nested_struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002647,
    "KHR-GL42.shaders.struct.local.nested_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002648,
    "KHR-GL42.shaders.struct.local.nested_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002649,
    "KHR-GL42.shaders.struct.local.parameter_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002650,
    "KHR-GL42.shaders.struct.local.parameter_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002651,
    "KHR-GL42.shaders.struct.local.parameter_nested_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002652,
    "KHR-GL42.shaders.struct.local.parameter_nested_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002653,
    "KHR-GL42.shaders.struct.local.return_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002654,
    "KHR-GL42.shaders.struct.local.return_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002655,
    "KHR-GL42.shaders.struct.local.return_nested_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002656,
    "KHR-GL42.shaders.struct.local.return_nested_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002657,
    "KHR-GL42.shaders.struct.local.conditional_assignment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002658,
    "KHR-GL42.shaders.struct.local.conditional_assignment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002659,
    "KHR-GL42.shaders.struct.local.loop_assignment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002660,
    "KHR-GL42.shaders.struct.local.loop_assignment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002661,
    "KHR-GL42.shaders.struct.local.dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002662,
    "KHR-GL42.shaders.struct.local.dynamic_loop_assignment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002663,
    "KHR-GL42.shaders.struct.local.nested_conditional_assignment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002664,
    "KHR-GL42.shaders.struct.local.nested_conditional_assignment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002665,
    "KHR-GL42.shaders.struct.local.nested_loop_assignment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002666,
    "KHR-GL42.shaders.struct.local.nested_loop_assignment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002667,
    "KHR-GL42.shaders.struct.local.nested_dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002668,
    "KHR-GL42.shaders.struct.local.nested_dynamic_loop_assignment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002669,
    "KHR-GL42.shaders.struct.local.loop_struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002670,
    "KHR-GL42.shaders.struct.local.loop_struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002671,
    "KHR-GL42.shaders.struct.local.loop_nested_struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002672,
    "KHR-GL42.shaders.struct.local.loop_nested_struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002673,
    "KHR-GL42.shaders.struct.local.dynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002674,
    "KHR-GL42.shaders.struct.local.dynamic_loop_struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002675,
    "KHR-GL42.shaders.struct.local.dynamic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002676,
    "KHR-GL42.shaders.struct.local.dynamic_loop_nested_struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002677,
    "KHR-GL42.shaders.struct.local.basic_equal_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002678,
    "KHR-GL42.shaders.struct.local.basic_equal_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002679,
    "KHR-GL42.shaders.struct.local.basic_not_equal_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002680,
    "KHR-GL42.shaders.struct.local.basic_not_equal_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002681,
    "KHR-GL42.shaders.struct.local.nested_equal_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002682,
    "KHR-GL42.shaders.struct.local.nested_equal_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002683,
    "KHR-GL42.shaders.struct.local.nested_not_equal_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002684,
    "KHR-GL42.shaders.struct.local.nested_not_equal_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002685,
    "KHR-GL42.shaders.struct.local.array_member_equality_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002686,
    "KHR-GL42.shaders.struct.local.array_member_equality_fragment");
