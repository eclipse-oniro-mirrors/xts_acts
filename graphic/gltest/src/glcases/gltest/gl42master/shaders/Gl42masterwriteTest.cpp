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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001280,
    "KHR-GL42.shaders.fragdepth.write.no_write");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001281,
    "KHR-GL42.shaders.fragdepth.write.const");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001282,
    "KHR-GL42.shaders.fragdepth.write.uniform");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001283,
    "KHR-GL42.shaders.fragdepth.write.dynamic");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001284,
    "KHR-GL42.shaders.fragdepth.write.fragcoord_z");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001285,
    "KHR-GL42.shaders.fragdepth.write.uniform_conditional_write");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001286,
    "KHR-GL42.shaders.fragdepth.write.dynamic_conditional_write");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001287,
    "KHR-GL42.shaders.fragdepth.write.uniform_loop_write");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001288,
    "KHR-GL42.shaders.fragdepth.write.write_in_function");
