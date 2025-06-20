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
#include "../Gl45masterBaseFunc.h"
#include "../ActsGl45master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008996,
    "KHR-GL45.shader_group_vote.availability");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008997,
    "KHR-GL45.shader_group_vote.all_invocations");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008998,
    "KHR-GL45.shader_group_vote.any_invocation");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008999,
    "KHR-GL45.shader_group_vote.all_invocations_equal");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_009000,
    "KHR-GL45.shader_group_vote.invocations_with_variables");
