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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000870,
    "KHR-GL42.transform_feedback_overflow_query_ARB.implementation-dependent-state");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000871,
    "KHR-GL42.transform_feedback_overflow_query_ARB.default-context-state");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000872,
    "KHR-GL42.transform_feedback_overflow_query_ARB.context-state-update");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000873,
    "KHR-GL42.transform_feedback_overflow_query_ARB.error-invalid-index");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000874,
    "KHR-GL42.transform_feedback_overflow_query_ARB.error-already-active");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000875,
    "KHR-GL42.transform_feedback_overflow_query_ARB.error-incompatible-target");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000876,
    "KHR-GL42.transform_feedback_overflow_query_ARB.error-no-active-query");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000877,
    "KHR-GL42.transform_feedback_overflow_query_ARB.basic-single-stream-interleaved-attribs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000878,
    "KHR-GL42.transform_feedback_overflow_query_ARB.basic-single-stream-separate-attribs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000879,
    "KHR-GL42.transform_feedback_overflow_query_ARB.advanced-single-stream-interleaved-attribs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000880,
    "KHR-GL42.transform_feedback_overflow_query_ARB.advanced-single-stream-separate-attribs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000881,
    "KHR-GL42.transform_feedback_overflow_query_ARB.multiple-streams-one-buffer-per-stream");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000882,
    "KHR-GL42.transform_feedback_overflow_query_ARB.multiple-streams-multiple-buffers-per-stream");
