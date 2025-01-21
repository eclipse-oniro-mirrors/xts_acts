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

static SHRINK_HWTEST_F(ActsCompute0001TS, TCNumworkgroups, "dEQP-VK.compute.builtin_var.num_work_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCWorkgroupsize, "dEQP-VK.compute.builtin_var.work_group_size*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCWorkgroupid, "dEQP-VK.compute.builtin_var.work_group_id*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCLocalinvocationid, "dEQP-VK.compute.builtin_var.local_invocation_id*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCGlobalinvocationid, "dEQP-VK.compute.builtin_var.global_invocation_id*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCNumworkgroupscomponent, "dEQP-VK.compute.builtin_var.num_work_groups_component*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCWorkgroupsizecomponent, "dEQP-VK.compute.builtin_var.work_group_size_component*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCWorkgroupidcomponent, "dEQP-VK.compute.builtin_var.work_group_id_component*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCLocalinvocationidcomponent, "dEQP-VK.compute.builtin_var.local_invocation_id_component*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCGlobalinvocationidcomponent, "dEQP-VK.compute.builtin_var.global_invocation_id_component*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCLocalinvocationindex, "dEQP-VK.compute.builtin_var.local_invocation_index*");