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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016344,
        "dEQP-GLES31.functional.geometry_sha",
        "ding.conversion.triangles_to_points");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016345,
        "dEQP-GLES31.functional.geometry_s",
        "hading.conversion.lines_to_points");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016346,
        "dEQP-GLES31.functional.geometry_s",
        "hading.conversion.points_to_lines");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016347,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.conversion.triangles_to_lines");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016348,
        "dEQP-GLES31.functional.geometry_sha",
        "ding.conversion.points_to_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016349,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.conversion.lines_to_triangles");
