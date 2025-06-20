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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005338,
    "KHR-GL42.clip_control_ARB.initial");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005339,
    "KHR-GL42.clip_control_ARB.modify_get");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005340,
    "KHR-GL42.clip_control_ARB.errors");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005341,
    "KHR-GL42.clip_control_ARB.origin");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005342,
    "KHR-GL42.clip_control_ARB.depth_mode_zero_to_one");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005343,
    "KHR-GL42.clip_control_ARB.depth_mode_one_to_one");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005344,
    "KHR-GL42.clip_control_ARB.face_culling");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005345,
    "KHR-GL42.clip_control_ARB.viewport_bounds");
