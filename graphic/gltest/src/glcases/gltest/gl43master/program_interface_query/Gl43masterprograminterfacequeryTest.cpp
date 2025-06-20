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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005550,
    "KHR-GL43.program_interface_query.empty-shaders");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005551,
    "KHR-GL43.program_interface_query.simple-shaders");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005552,
    "KHR-GL43.program_interface_query.input-types");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005553,
    "KHR-GL43.program_interface_query.input-built-in");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005554,
    "KHR-GL43.program_interface_query.input-layout");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005555,
    "KHR-GL43.program_interface_query.output-types");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005556,
    "KHR-GL43.program_interface_query.output-location-index");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005557,
    "KHR-GL43.program_interface_query.output-built-in");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005558,
    "KHR-GL43.program_interface_query.output-layout");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005559,
    "KHR-GL43.program_interface_query.output-layout-index");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005560,
    "KHR-GL43.program_interface_query.uniform-simple");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005561,
    "KHR-GL43.program_interface_query.uniform-types");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005562,
    "KHR-GL43.program_interface_query.uniform-block-types");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005563,
    "KHR-GL43.program_interface_query.transform-feedback-types");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005564,
    "KHR-GL43.program_interface_query.atomic-counters");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005565,
    "KHR-GL43.program_interface_query.subroutines-vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005566,
    "KHR-GL43.program_interface_query.subroutines-tess-control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005567,
    "KHR-GL43.program_interface_query.subroutines-tess-eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005568,
    "KHR-GL43.program_interface_query.subroutines-geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005569,
    "KHR-GL43.program_interface_query.subroutines-fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005570,
    "KHR-GL43.program_interface_query.subroutines-compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005571,
    "KHR-GL43.program_interface_query.ssb-types");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005572,
    "KHR-GL43.program_interface_query.transform-feedback-built-in");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005573,
    "KHR-GL43.program_interface_query.null-length");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005574,
    "KHR-GL43.program_interface_query.arrays-of-arrays");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005575,
    "KHR-GL43.program_interface_query.top-level-array");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005576,
    "KHR-GL43.program_interface_query.separate-programs-vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005577,
    "KHR-GL43.program_interface_query.separate-programs-tess-control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005578,
    "KHR-GL43.program_interface_query.separate-programs-tess-eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005579,
    "KHR-GL43.program_interface_query.separate-programs-geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005580,
    "KHR-GL43.program_interface_query.separate-programs-fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005581,
    "KHR-GL43.program_interface_query.uniform-block");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005582,
    "KHR-GL43.program_interface_query.uniform-block-array");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005583,
    "KHR-GL43.program_interface_query.array-names");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005584,
    "KHR-GL43.program_interface_query.buff-length");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005585,
    "KHR-GL43.program_interface_query.no-locations");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005586,
    "KHR-GL43.program_interface_query.query-not-used");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005587,
    "KHR-GL43.program_interface_query.relink-failure");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005588,
    "KHR-GL43.program_interface_query.link-failure");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005589,
    "KHR-GL43.program_interface_query.compute-shader");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005590,
    "KHR-GL43.program_interface_query.invalid-value");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005591,
    "KHR-GL43.program_interface_query.invalid-operation");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005592,
    "KHR-GL43.program_interface_query.invalid-enum");
