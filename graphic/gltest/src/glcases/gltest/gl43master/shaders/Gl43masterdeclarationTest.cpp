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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001226,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001227,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001228,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_int_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001229,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_int_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001230,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_bool_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001231,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_bool_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001232,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_struct_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001233,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_struct_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001234,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_float_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001235,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_float_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001236,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_int_ivec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001237,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_int_ivec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001238,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_bool_bvec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001239,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_bool_bvec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001240,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_float_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001241,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_float_mat3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001242,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_int_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001243,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_int_mat3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001244,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_bool_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001245,
    "KHR-GL43.shaders.arrays.declaration.implicit_size_bool_mat3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001246,
    "KHR-GL43.shaders.arrays.declaration.constant_expression_array_size_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001247,
    "KHR-GL43.shaders.arrays.declaration.constant_expression_array_size_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001248,
    "KHR-GL43.shaders.arrays.declaration.constant_expression_array_access_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001249,
    "KHR-GL43.shaders.arrays.declaration.constant_expression_array_access_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001250,
    "KHR-GL43.shaders.arrays.declaration.dynamic_expression_array_access_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001251,
    "KHR-GL43.shaders.arrays.declaration.dynamic_expression_array_access_fragment");
