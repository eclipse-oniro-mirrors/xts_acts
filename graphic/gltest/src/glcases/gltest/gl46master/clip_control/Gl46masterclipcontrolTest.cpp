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
#include "../Gl46masterBaseFunc.h"
#include "../ActsGl46master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008428,
    "KHR-GL46.clip_control.initial");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008429,
    "KHR-GL46.clip_control.modify_get");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008430,
    "KHR-GL46.clip_control.errors");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008431,
    "KHR-GL46.clip_control.origin");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008432,
    "KHR-GL46.clip_control.depth_mode_zero_to_one");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008433,
    "KHR-GL46.clip_control.depth_mode_one_to_one");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008434,
    "KHR-GL46.clip_control.face_culling");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008435,
    "KHR-GL46.clip_control.viewport_bounds");
