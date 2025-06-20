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

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007804,
    "KHR-GL46.sepshaderobjs.CreateShadProgApi");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007805,
    "KHR-GL46.sepshaderobjs.UseProgStagesApi");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007806,
    "KHR-GL46.sepshaderobjs.PipelineApi");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007807,
    "KHR-GL46.sepshaderobjs.ProgUniformAPI");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007808,
    "KHR-GL46.sepshaderobjs.StateInteraction");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007809,
    "KHR-GL46.sepshaderobjs.InterfacePrecisionMatchingFloat");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007810,
    "KHR-GL46.sepshaderobjs.InterfacePrecisionMatchingInt");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007811,
    "KHR-GL46.sepshaderobjs.InterfacePrecisionMatchingUInt");
