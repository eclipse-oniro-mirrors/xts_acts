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
#include "../Gl44masterBaseFunc.h"
#include "../ActsGl44master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005346,
    "KHR-GL44.shader_subroutine.min_maxes");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005347,
    "KHR-GL44.shader_subroutine.name_getters");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005348,
    "KHR-GL44.shader_subroutine.two_subroutines_single_subroutine_uniform");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005349,
    "KHR-GL44.shader_subroutine.four_subroutines_with_two_uniforms");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005350,
    "KHR-GL44.shader_subroutine.eight_subroutines_four_uniforms");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005351,
    "KHR-GL44.shader_subroutine.static_subroutine_call");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005352,
    "KHR-GL44.shader_subroutine.arrayed_subroutine_uniforms");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005353,
    "KHR-GL44.shader_subroutine.subroutines_3_subroutine_types_and_subroutine_uniforms_one_function");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005354,
    "KHR-GL44.shader_subroutine.arrays_of_arrays_of_uniforms");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005355,
    "KHR-GL44.shader_subroutine.globals_sampling_output_discard_function_calls");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005356,
    "KHR-GL44.shader_subroutine.ssbo_atomic_image_load_store");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005357,
    "KHR-GL44.shader_subroutine.subroutines_with_separate_shader_objects");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005358,
    "KHR-GL44.shader_subroutine.structure_parameters_program_binary");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005359,
    "KHR-GL44.shader_subroutine.subroutine_uniform_reset");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005360,
    "KHR-GL44.shader_subroutine.same_subroutine_and_subroutine_uniform_but_different_type_used_in_all_stages");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005361,
    "KHR-GL44.shader_subroutine.control_flow_and_returned_subroutine_values_used_as_subroutine_input");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005362,
    "KHR-GL44.shader_subroutine.subroutine_errors");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005363,
    "KHR-GL44.shader_subroutine.subroutine_uniform_scope");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005364,
    "KHR-GL44.shader_subroutine.missing_subroutine_keyword");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005365,
    "KHR-GL44.shader_subroutine.subroutines_incompatible_with_subroutine_type");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005366,
    "KHR-GL44.shader_subroutine.subroutine_uniform_wo_matching_subroutines");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005367,
    "KHR-GL44.shader_subroutine.two_duplicate_functions_one_being_a_subroutine");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005368,
    "KHR-GL44.shader_subroutine.recursion");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005369,
    "KHR-GL44.shader_subroutine.subroutine_wo_body");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005370,
    "KHR-GL44.shader_subroutine.subroutines_cannot_be_assigned_float_int_values_or_be_compared");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005371,
    "KHR-GL44.shader_subroutine.function_overloading_forbidden_for_subroutines");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005372,
    "KHR-GL44.shader_subroutine.subroutine_uniforms_used_for_sampling_atomic_image_functions");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005373,
    "KHR-GL44.shader_subroutine.subroutines_not_allowed_as_variables_constructors_and_argument_or_return_types");
