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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30041TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040542,
        "dEQP-GLES3.functional.transform_f",
        "eedback.point_size.points_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040543,
        "dEQP-GLES3.functional.transform_fee",
        "dback.point_size.points_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040544,
        "dEQP-GLES3.functional.transform_f",
        "eedback.point_size.lines_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040545,
        "dEQP-GLES3.functional.transform_fe",
        "edback.point_size.lines_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040546,
        "dEQP-GLES3.functional.transform_fee",
        "dback.point_size.triangles_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040547,
        "dEQP-GLES3.functional.transform_feed",
        "back.point_size.triangles_interleaved");
