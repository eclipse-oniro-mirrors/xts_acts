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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000011,
    "KHR-GL43.transform_feedback.api_errors_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000012,
    "KHR-GL43.transform_feedback.linking_errors_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000013,
    "KHR-GL43.transform_feedback.limits_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000014,
    "KHR-GL43.transform_feedback.capture_vertex_interleaved_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000015,
    "KHR-GL43.transform_feedback.capture_geometry_interleaved_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000016,
    "KHR-GL43.transform_feedback.capture_vertex_separate_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000017,
    "KHR-GL43.transform_feedback.capture_geometry_separate_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000018,
    "KHR-GL43.transform_feedback.get_xfb_varying");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000019,
    "KHR-GL43.transform_feedback.query_vertex_interleaved_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000020,
    "KHR-GL43.transform_feedback.query_geometry_interleaved_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000021,
    "KHR-GL43.transform_feedback.query_vertex_separate_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000022,
    "KHR-GL43.transform_feedback.query_geometry_separate_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000023,
    "KHR-GL43.transform_feedback.discard_vertex_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000024,
    "KHR-GL43.transform_feedback.discard_geometry_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000025,
    "KHR-GL43.transform_feedback.draw_xfb_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000026,
    "KHR-GL43.transform_feedback.draw_xfb_feedbackk_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000027,
    "KHR-GL43.transform_feedback.draw_xfb_stream_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000028,
    "KHR-GL43.transform_feedback.capture_special_interleaved_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000029,
    "KHR-GL43.transform_feedback.draw_xfb_instanced_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000030,
    "KHR-GL43.transform_feedback.draw_xfb_stream_instanced_test");
