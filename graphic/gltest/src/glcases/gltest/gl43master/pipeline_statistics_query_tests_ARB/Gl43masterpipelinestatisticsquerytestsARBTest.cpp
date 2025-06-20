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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003555,
    "KHR-GL43.pipeline_statistics_query_tests_ARB.api_coverage_invalid_glbeginquery_calls");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003556,
    "KHR-GL43.pipeline_statistics_query_tests_ARB.api_coverage_unsupported_calls");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003557,
    "KHR-GL43.pipeline_statistics_query_tests_ARB.functional_default_qo_values");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003558,
    "KHR-GL43.pipeline_statistics_query_tests_ARB.functional_non_rendering_commands_do_not_affect_queries");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003559,
    "KHR-GL43.pipeline_statistics_query_tests_ARB.functional_primi"
    "tives_vertices_submitted_and_clipping_input_output_primitives");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003560,
    "KHR-GL43.pipeline_statistics_query_tests_ARB.functional_vertex_shader_invocations");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003561,
    "KHR-GL43.pipeline_statistics_query_tests_ARB.functional_tess_queries");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003562,
    "KHR-GL43.pipeline_statistics_query_tests_ARB.functional_geometry_shader_queries");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003563,
    "KHR-GL43.pipeline_statistics_query_tests_ARB.functional_fragment_shader_invocations");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003564,
    "KHR-GL43.pipeline_statistics_query_tests_ARB.functional_compute_shader_invocations");
