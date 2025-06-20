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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005483,
    "KHR-GL42.shading_language_420pack.binding_sampler_single");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005484,
    "KHR-GL42.shading_language_420pack.binding_image_single");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005485,
    "KHR-GL42.shading_language_420pack.utf8_characters");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005486,
    "KHR-GL42.shading_language_420pack.utf8_in_source");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005487,
    "KHR-GL42.shading_language_420pack.qualifier_order");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005488,
    "KHR-GL42.shading_language_420pack.qualifier_order_block");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005489,
    "KHR-GL42.shading_language_420pack.line_continuation");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005490,
    "KHR-GL42.shading_language_420pack.line_numbering");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005491,
    "KHR-GL42.shading_language_420pack.implicit_conversions");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005492,
    "KHR-GL42.shading_language_420pack.implicit_conversions_invalid");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005493,
    "KHR-GL42.shading_language_420pack.const_dynamic_value");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005494,
    "KHR-GL42.shading_language_420pack.const_assignment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005495,
    "KHR-GL42.shading_language_420pack.const_dynamic_value_as_const_expr");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005496,
    "KHR-GL42.shading_language_420pack.qualifier_order_uniform");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005497,
    "KHR-GL42.shading_language_420pack.qualifier_order_function_inout");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005498,
    "KHR-GL42.shading_language_420pack.qualifier_order_function_input");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005499,
    "KHR-GL42.shading_language_420pack.qualifier_order_function_output");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005500,
    "KHR-GL42.shading_language_420pack.qualifier_override_layout");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005501,
    "KHR-GL42.shading_language_420pack.binding_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005502,
    "KHR-GL42.shading_language_420pack.binding_uniform_single_block");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005503,
    "KHR-GL42.shading_language_420pack.binding_uniform_block_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005504,
    "KHR-GL42.shading_language_420pack.binding_uniform_default");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005505,
    "KHR-GL42.shading_language_420pack.binding_uniform_api_overirde");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005506,
    "KHR-GL42.shading_language_420pack.binding_uniform_global_block");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005507,
    "KHR-GL42.shading_language_420pack.binding_uniform_invalid");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005508,
    "KHR-GL42.shading_language_420pack.binding_samplers");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005509,
    "KHR-GL42.shading_language_420pack.binding_sampler_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005510,
    "KHR-GL42.shading_language_420pack.binding_sampler_default");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005511,
    "KHR-GL42.shading_language_420pack.binding_sampler_api_override");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005512,
    "KHR-GL42.shading_language_420pack.binding_sampler_invalid");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005513,
    "KHR-GL42.shading_language_420pack.binding_images");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005514,
    "KHR-GL42.shading_language_420pack.binding_image_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005515,
    "KHR-GL42.shading_language_420pack.binding_image_default");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005516,
    "KHR-GL42.shading_language_420pack.binding_image_api_override");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005517,
    "KHR-GL42.shading_language_420pack.binding_image_invalid");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005518,
    "KHR-GL42.shading_language_420pack.initializer_list");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005519,
    "KHR-GL42.shading_language_420pack.initializer_list_negative");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005520,
    "KHR-GL42.shading_language_420pack.length_of_vector_and_matrix");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005521,
    "KHR-GL42.shading_language_420pack.length_of_compute_result");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005522,
    "KHR-GL42.shading_language_420pack.scalar_swizzlers");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005523,
    "KHR-GL42.shading_language_420pack.scalar_swizzlers_invalid");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005524,
    "KHR-GL42.shading_language_420pack.built_in_values");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005525,
    "KHR-GL42.shading_language_420pack.built_in_assignment");
