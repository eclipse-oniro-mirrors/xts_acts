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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003545,
    "KHR-GL42.shaders.shader_integer_mix.define");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003546,
    "KHR-GL42.shaders.shader_integer_mix.prototypes-extension");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003547,
    "KHR-GL42.shaders.shader_integer_mix.prototypes");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003548,
    "KHR-GL42.shaders.shader_integer_mix.prototypes-negative");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003549,
    "KHR-GL42.shaders.shader_integer_mix.mix-ivec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003550,
    "KHR-GL42.shaders.shader_integer_mix.mix-uvec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003551,
    "KHR-GL42.shaders.shader_integer_mix.mix-bvec4");
