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
#include "../ComputeBaseFunc.h"
#include "../ActsCompute0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsCompute0001TS, TCMaxworkgroupmemory1, "dEQP-VK.compute.zero_initialize_workgroup_memory.max_workgroup_memory.1*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCMaxworkgroupmemory2, "dEQP-VK.compute.zero_initialize_workgroup_memory.max_workgroup_memory.2*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCMaxworkgroupmemory4, "dEQP-VK.compute.zero_initialize_workgroup_memory.max_workgroup_memory.4*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCMaxworkgroupmemory16, "dEQP-VK.compute.zero_initialize_workgroup_memory.max_workgroup_memory.16*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCMaxworkgroupmemory64, "dEQP-VK.compute.zero_initialize_workgroup_memory.max_workgroup_memory.64*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCMaxworkgroupmemory128, "dEQP-VK.compute.zero_initialize_workgroup_memory.max_workgroup_memory.128*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesBool, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.bool*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesBvec2, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.bvec2*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesBvec3, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.bvec3*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesBvec4, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.bvec4*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesUint32t, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.uint32_t*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesUvec2, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.uvec2*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesUvec3, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.uvec3*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesUvec4, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.uvec4*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesInt32t, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.int32_t*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesIvec2, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.ivec2*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesIvec3, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.ivec3*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesIvec4, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.ivec4*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesUint8t, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.uint8_t*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesU8vec2, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.u8vec2*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesU8vec3, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.u8vec3*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCTypesU8vec4, "dEQP-VK.compute.zero_initialize_workgroup_memory.types.u8vec4*");