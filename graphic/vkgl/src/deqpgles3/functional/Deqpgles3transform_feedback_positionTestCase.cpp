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

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040536,
        "dEQP-GLES3.functional.transform_",
        "feedback.position.points_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040537,
        "dEQP-GLES3.functional.transform_fe",
        "edback.position.points_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040538,
        "dEQP-GLES3.functional.transform_",
        "feedback.position.lines_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040539,
        "dEQP-GLES3.functional.transform_f",
        "eedback.position.lines_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040540,
        "dEQP-GLES3.functional.transform_fe",
        "edback.position.triangles_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040541,
        "dEQP-GLES3.functional.transform_fee",
        "dback.position.triangles_interleaved");
