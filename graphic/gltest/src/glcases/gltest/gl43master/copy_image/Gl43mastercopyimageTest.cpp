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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005535,
    "KHR-GL43.copy_image.functional");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005536,
    "KHR-GL43.copy_image.incomplete_tex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005537,
    "KHR-GL43.copy_image.invalid_object");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005538,
    "KHR-GL43.copy_image.smoke_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005539,
    "KHR-GL43.copy_image.invalid_target");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005540,
    "KHR-GL43.copy_image.target_miss_match");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005541,
    "KHR-GL43.copy_image.incompatible_formats");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005542,
    "KHR-GL43.copy_image.samples_mismatch");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005543,
    "KHR-GL43.copy_image.incompatible_formats_compression");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005544,
    "KHR-GL43.copy_image.non_existent_mipmap");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005545,
    "KHR-GL43.copy_image.exceeding_boundaries");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005546,
    "KHR-GL43.copy_image.invalid_alignment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005547,
    "KHR-GL43.copy_image.integer_tex");
