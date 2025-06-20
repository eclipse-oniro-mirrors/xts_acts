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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005402,
    "KHR-GL42.shader_atomic_counters.advanced-usage-many-counters");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005403,
    "KHR-GL42.shader_atomic_counters.basic-buffer-operations");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005404,
    "KHR-GL42.shader_atomic_counters.basic-buffer-state");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005405,
    "KHR-GL42.shader_atomic_counters.basic-buffer-bind");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005406,
    "KHR-GL42.shader_atomic_counters.basic-program-max");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005407,
    "KHR-GL42.shader_atomic_counters.basic-program-query");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005408,
    "KHR-GL42.shader_atomic_counters.basic-usage-simple");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005409,
    "KHR-GL42.shader_atomic_counters.basic-usage-no-offset");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005410,
    "KHR-GL42.shader_atomic_counters.basic-usage-fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005411,
    "KHR-GL42.shader_atomic_counters.basic-usage-vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005412,
    "KHR-GL42.shader_atomic_counters.basic-usage-gs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005413,
    "KHR-GL42.shader_atomic_counters.basic-usage-tes");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005414,
    "KHR-GL42.shader_atomic_counters.basic-usage-cs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005415,
    "KHR-GL42.shader_atomic_counters.basic-glsl-built-in");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005416,
    "KHR-GL42.shader_atomic_counters.advanced-usage-multi-stage");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005417,
    "KHR-GL42.shader_atomic_counters.advanced-usage-draw-update-draw");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005418,
    "KHR-GL42.shader_atomic_counters.advanced-usage-switch-programs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005419,
    "KHR-GL42.shader_atomic_counters.advanced-usage-ubo");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005420,
    "KHR-GL42.shader_atomic_counters.advanced-usage-tbo");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005421,
    "KHR-GL42.shader_atomic_counters.advanced-usage-many-draw-calls");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005422,
    "KHR-GL42.shader_atomic_counters.advanced-usage-many-draw-calls2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005423,
    "KHR-GL42.shader_atomic_counters.advanced-usage-many-dispatches");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005424,
    "KHR-GL42.shader_atomic_counters.negative-api");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005425,
    "KHR-GL42.shader_atomic_counters.negative-glsl");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005426,
    "KHR-GL42.shader_atomic_counters.negative-ssbo");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005427,
    "KHR-GL42.shader_atomic_counters.negative-ubo");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005428,
    "KHR-GL42.shader_atomic_counters.negative-uniform");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005429,
    "KHR-GL42.shader_atomic_counters.negative-array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005430,
    "KHR-GL42.shader_atomic_counters.negative-arithmetic");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005431,
    "KHR-GL42.shader_atomic_counters.negative-large-offset");
