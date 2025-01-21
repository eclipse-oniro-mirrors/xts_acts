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

static SHRINK_HWTEST_F(ActsCompute0001TS, TCEmptyshader, "dEQP-VK.compute.basic.empty_shader*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCConcurrentcompute, "dEQP-VK.compute.basic.concurrent_compute*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCEmptyworkgroupx, "dEQP-VK.compute.basic.empty_workgroup_x*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCEmptyworkgroupy, "dEQP-VK.compute.basic.empty_workgroup_y*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCEmptyworkgroupz, "dEQP-VK.compute.basic.empty_workgroup_z*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCEmptyworkgroupall, "dEQP-VK.compute.basic.empty_workgroup_all*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCMaxlocalsizex, "dEQP-VK.compute.basic.max_local_size_x*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCMaxlocalsizey, "dEQP-VK.compute.basic.max_local_size_y*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCMaxlocalsizez, "dEQP-VK.compute.basic.max_local_size_z*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUbotossbosingleinvocation, "dEQP-VK.compute.basic.ubo_to_ssbo_single_invocation*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUbotossbosinglegroup, "dEQP-VK.compute.basic.ubo_to_ssbo_single_group*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUbotossbomultipleinvocations, "dEQP-VK.compute.basic.ubo_to_ssbo_multiple_invocations*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUbotossbomultiplegroups, "dEQP-VK.compute.basic.ubo_to_ssbo_multiple_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCCopyssbosingleinvocation, "dEQP-VK.compute.basic.copy_ssbo_single_invocation*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCCopyssbomultipleinvocations, "dEQP-VK.compute.basic.copy_ssbo_multiple_invocations*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCCopyssbomultiplegroups, "dEQP-VK.compute.basic.copy_ssbo_multiple_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSsborwsingleinvocation, "dEQP-VK.compute.basic.ssbo_rw_single_invocation*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSsborwmultiplegroups, "dEQP-VK.compute.basic.ssbo_rw_multiple_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSsbounsizedarrsingleinvocation, "dEQP-VK.compute.basic.ssbo_unsized_arr_single_invocation*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSsbounsizedarrmultiplegroups, "dEQP-VK.compute.basic.ssbo_unsized_arr_multiple_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCWritemultiplearrsingleinvocation, "dEQP-VK.compute.basic.write_multiple_arr_single_invocation*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCWritemultiplearrmultiplegroups, "dEQP-VK.compute.basic.write_multiple_arr_multiple_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCWritemultipleunsizedarrsingleinvocation, "dEQP-VK.compute.basic.write_multiple_unsized_arr_single_invocation*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCWritemultipleunsizedarrmultiplegroups, "dEQP-VK.compute.basic.write_multiple_unsized_arr_multiple_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSsbolocalbarriersingleinvocation, "dEQP-VK.compute.basic.ssbo_local_barrier_single_invocation*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSsbolocalbarriersinglegroup, "dEQP-VK.compute.basic.ssbo_local_barrier_single_group*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSsbolocalbarriermultiplegroups, "dEQP-VK.compute.basic.ssbo_local_barrier_multiple_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSsbocmdbarriersingle, "dEQP-VK.compute.basic.ssbo_cmd_barrier_single*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSsbocmdbarriermultiple, "dEQP-VK.compute.basic.ssbo_cmd_barrier_multiple*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSharedvarsingleinvocation, "dEQP-VK.compute.basic.shared_var_single_invocation*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSharedvarsinglegroup, "dEQP-VK.compute.basic.shared_var_single_group*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSharedvarmultipleinvocations, "dEQP-VK.compute.basic.shared_var_multiple_invocations*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSharedvarmultiplegroups, "dEQP-VK.compute.basic.shared_var_multiple_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSharedatomicopsingleinvocation, "dEQP-VK.compute.basic.shared_atomic_op_single_invocation*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSharedatomicopsinglegroup, "dEQP-VK.compute.basic.shared_atomic_op_single_group*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSharedatomicopmultipleinvocations, "dEQP-VK.compute.basic.shared_atomic_op_multiple_invocations*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCSharedatomicopmultiplegroups, "dEQP-VK.compute.basic.shared_atomic_op_multiple_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCCopyimagetossbosmall, "dEQP-VK.compute.basic.copy_image_to_ssbo_small*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCCopyimagetossbolarge, "dEQP-VK.compute.basic.copy_image_to_ssbo_large*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCCopyssbotoimagesmall, "dEQP-VK.compute.basic.copy_ssbo_to_image_small*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCCopyssbotoimagelarge, "dEQP-VK.compute.basic.copy_ssbo_to_image_large*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCImageatomicoplocalsize1, "dEQP-VK.compute.basic.image_atomic_op_local_size_1*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCImageatomicoplocalsize8, "dEQP-VK.compute.basic.image_atomic_op_local_size_8*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCImagebarriersingle, "dEQP-VK.compute.basic.image_barrier_single*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCImagebarriermultiple, "dEQP-VK.compute.basic.image_barrier_multiple*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCWritessboarray, "dEQP-VK.compute.basic.write_ssbo_array*");