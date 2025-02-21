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
#include "../ActsSubgroups0021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge00, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge00*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge01, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge01*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge02, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge02*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge03, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge03*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge04, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge04*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge05, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge05*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge06, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge06*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge07, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge07*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge08, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge08*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge09, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge09*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge10, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge10*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge11, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge11*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge12, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge12*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge13, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge13*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge14, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge14*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge15, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge15*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge16, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge16*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge17, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge17*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge18, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge18*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge19, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge19*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullSubgroupreconverge20, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full.subgroup_reconverge20*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial00, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial00*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial01, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial01*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial02, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial02*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial03, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial03*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial04, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial04*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial05, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial05*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial06, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial06*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial07, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial07*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial08, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial08*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial09, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial09*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial10, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial10*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial11, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial11*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial12, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial12*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial13, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial13*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial14, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial14*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial15, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial15*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial16, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial16*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial17, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial17*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial18, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial18*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial19, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial19*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialSubgroupreconvergepartial20, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial.subgroup_reconverge_partial20*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge00, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge00*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge01, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge01*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge02, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge02*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge03, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge03*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge04, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge04*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge05, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge05*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge06, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge06*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge07, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge07*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge08, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge08*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge09, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge09*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge10, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge10*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge11, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge11*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge12, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge12*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge13, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge13*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge14, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge14*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge15, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge15*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge16, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge16*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge17, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge17*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge18, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge18*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge19, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge19*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargefullcontrolSubgroupreconverge20, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_full_control.subgroup_reconverge20*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial00, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial00*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial01, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial01*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial02, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial02*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial03, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial03*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial04, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial04*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial05, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial05*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial06, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial06*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial07, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial07*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial08, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial08*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial09, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial09*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial10, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial10*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial11, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial11*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial12, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial12*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial13, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial13*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial14, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial14*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial15, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial15*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial16, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial16*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial17, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial17*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial18, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial18*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial19, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial19*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCLargepartialcontrolSubgroupreconvergepartial20, "dEQP-VK.subgroups.subgroup_uniform_control_flow.large_partial_control.subgroup_reconverge_partial20*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge00, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge00*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge01, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge01*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge02, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge02*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge03, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge03*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge04, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge04*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge05, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge05*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge06, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge06*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge07, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge07*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge08, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge08*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge09, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge09*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge10, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge10*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge11, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge11*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge12, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge12*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge13, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge13*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge14, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge14*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge15, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge15*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge16, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge16*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCSmallfullSmallsubgroupreconverge17, "dEQP-VK.subgroups.subgroup_uniform_control_flow.small_full.small_subgroup_reconverge17*");