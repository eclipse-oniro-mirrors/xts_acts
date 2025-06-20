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
#include "../Gl33masterBaseFunc.h"
#include "../ActsGl33master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002687,
    "KHR-GL33.shaders.struct.uniform.basic_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002688,
    "KHR-GL33.shaders.struct.uniform.basic_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002689,
    "KHR-GL33.shaders.struct.uniform.nested_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002690,
    "KHR-GL33.shaders.struct.uniform.nested_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002691,
    "KHR-GL33.shaders.struct.uniform.array_member_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002692,
    "KHR-GL33.shaders.struct.uniform.array_member_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002693,
    "KHR-GL33.shaders.struct.uniform.array_member_dynamic_index_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002694,
    "KHR-GL33.shaders.struct.uniform.array_member_dynamic_index_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002695,
    "KHR-GL33.shaders.struct.uniform.struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002696,
    "KHR-GL33.shaders.struct.uniform.struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002697,
    "KHR-GL33.shaders.struct.uniform.struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002698,
    "KHR-GL33.shaders.struct.uniform.struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002699,
    "KHR-GL33.shaders.struct.uniform.nested_struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002700,
    "KHR-GL33.shaders.struct.uniform.nested_struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002701,
    "KHR-GL33.shaders.struct.uniform.nested_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002702,
    "KHR-GL33.shaders.struct.uniform.nested_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002703,
    "KHR-GL33.shaders.struct.uniform.loop_struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002704,
    "KHR-GL33.shaders.struct.uniform.loop_struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002705,
    "KHR-GL33.shaders.struct.uniform.loop_nested_struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002706,
    "KHR-GL33.shaders.struct.uniform.loop_nested_struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002707,
    "KHR-GL33.shaders.struct.uniform.dynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002708,
    "KHR-GL33.shaders.struct.uniform.dynamic_loop_struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002709,
    "KHR-GL33.shaders.struct.uniform.dynamic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002710,
    "KHR-GL33.shaders.struct.uniform.dynamic_loop_nested_struct_array_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002711,
    "KHR-GL33.shaders.struct.uniform.sampler_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002712,
    "KHR-GL33.shaders.struct.uniform.sampler_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002713,
    "KHR-GL33.shaders.struct.uniform.sampler_nested_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002714,
    "KHR-GL33.shaders.struct.uniform.sampler_nested_fragment");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002715,
    "KHR-GL33.shaders.struct.uniform.sampler_array_vertex");

static SHRINK_HWTEST_SF(ActsGl33master0001TestSuite, TestCase_002716,
    "KHR-GL33.shaders.struct.uniform.sampler_array_fragment");
