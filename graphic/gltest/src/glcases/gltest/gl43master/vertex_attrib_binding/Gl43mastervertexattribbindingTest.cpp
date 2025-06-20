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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005759,
    "KHR-GL43.vertex_attrib_binding.basic-usage");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005760,
    "KHR-GL43.vertex_attrib_binding.basic-input-case1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005761,
    "KHR-GL43.vertex_attrib_binding.basic-input-case2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005762,
    "KHR-GL43.vertex_attrib_binding.basic-input-case3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005763,
    "KHR-GL43.vertex_attrib_binding.basic-input-case4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005764,
    "KHR-GL43.vertex_attrib_binding.basic-input-case5");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005765,
    "KHR-GL43.vertex_attrib_binding.basic-input-case6");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005766,
    "KHR-GL43.vertex_attrib_binding.basic-input-case7");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005767,
    "KHR-GL43.vertex_attrib_binding.basic-input-case8");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005768,
    "KHR-GL43.vertex_attrib_binding.basic-input-case9");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005769,
    "KHR-GL43.vertex_attrib_binding.basic-input-case10");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005770,
    "KHR-GL43.vertex_attrib_binding.basic-input-case11");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005771,
    "KHR-GL43.vertex_attrib_binding.basic-input-case12");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005772,
    "KHR-GL43.vertex_attrib_binding.basic-inputI-case1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005773,
    "KHR-GL43.vertex_attrib_binding.basic-inputI-case2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005774,
    "KHR-GL43.vertex_attrib_binding.basic-inputI-case3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005775,
    "KHR-GL43.vertex_attrib_binding.basic-inputL-case1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005776,
    "KHR-GL43.vertex_attrib_binding.basic-inputL-case2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005777,
    "KHR-GL43.vertex_attrib_binding.basic-state1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005778,
    "KHR-GL43.vertex_attrib_binding.basic-state2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005779,
    "KHR-GL43.vertex_attrib_binding.basic-state3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005780,
    "KHR-GL43.vertex_attrib_binding.basic-state4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005781,
    "KHR-GL43.vertex_attrib_binding.advanced-bindingUpdate");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005782,
    "KHR-GL43.vertex_attrib_binding.advanced-instancing");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005783,
    "KHR-GL43.vertex_attrib_binding.advanced-iterations");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005784,
    "KHR-GL43.vertex_attrib_binding.advanced-largeStrideAndOffsetsNewAndLegacyAPI");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005785,
    "KHR-GL43.vertex_attrib_binding.negative-bindVertexBuffer");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005786,
    "KHR-GL43.vertex_attrib_binding.negative-vertexAttribFormat");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005787,
    "KHR-GL43.vertex_attrib_binding.negative-vertexAttribBinding");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005788,
    "KHR-GL43.vertex_attrib_binding.negative-vertexAttribDivisor");
