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
#include "../SubgroupsBaseFunc.h"
#include "../ActsSubgroups0011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsSubgroups0011TS, TCComputeSubgroupclusteredorbvec3, "dEQP-VK.subgroups.clustered.compute.subgroupclusteredor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0011TS, TCComputeSubgroupclusteredorbvec3requiredsubgroupsize, "dEQP-VK.subgroups.clustered.compute.subgroupclusteredor_bvec3_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0011TS, TCComputeSubgroupclusteredxorbvec3, "dEQP-VK.subgroups.clustered.compute.subgroupclusteredxor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0011TS, TCComputeSubgroupclusteredxorbvec3requiredsubgroupsize, "dEQP-VK.subgroups.clustered.compute.subgroupclusteredxor_bvec3_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0011TS, TCComputeSubgroupclusteredandbvec4, "dEQP-VK.subgroups.clustered.compute.subgroupclusteredand_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0011TS, TCComputeSubgroupclusteredandbvec4requiredsubgroupsize, "dEQP-VK.subgroups.clustered.compute.subgroupclusteredand_bvec4_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0011TS, TCComputeSubgroupclusteredorbvec4, "dEQP-VK.subgroups.clustered.compute.subgroupclusteredor_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0011TS, TCComputeSubgroupclusteredorbvec4requiredsubgroupsize, "dEQP-VK.subgroups.clustered.compute.subgroupclusteredor_bvec4_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0011TS, TCComputeSubgroupclusteredxorbvec4, "dEQP-VK.subgroups.clustered.compute.subgroupclusteredxor_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0011TS, TCComputeSubgroupclusteredxorbvec4requiredsubgroupsize, "dEQP-VK.subgroups.clustered.compute.subgroupclusteredxor_bvec4_requiredsubgroupsize*");