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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002185,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_ident_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002186,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_ident_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002187,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_whitespace_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002188,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_whitespace_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002189,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_op_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002190,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_op_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002191,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_floatval_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002192,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_floatval_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002193,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_floatval_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002194,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_floatval_2_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002195,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_intval_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002196,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_intval_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002197,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_intval_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002198,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.invalid_object_intval_2_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002199,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002200,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002201,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_ifdef_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002202,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_ifdef_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002203,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_undef_ifdef_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002204,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_undef_ifdef_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002205,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_ifndef_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002206,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_ifndef_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002207,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_defined_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002208,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_defined_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002209,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_defined_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002210,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_defined_2_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002211,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_comment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002212,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_comment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002213,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_multiline_comment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002214,
    "KHR-GL42.shaders.preprocessor.object_redefinitions.redefine_object_multiline_comment_fragment");
