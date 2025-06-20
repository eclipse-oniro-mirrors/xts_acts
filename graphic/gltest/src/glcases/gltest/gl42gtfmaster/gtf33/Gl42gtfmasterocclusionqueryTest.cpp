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
#include "../Gl42gtfmasterBaseFunc.h"
#include "../ActsGl42gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001636,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_clear");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001637,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_custom_framebuffer");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001638,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_discarded_fragments");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001639,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_distinct_queries");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001640,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_draw_any_samples_passed");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001641,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_draw_occluded");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001642,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_draw_outside_of_query_scope");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001643,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_draw_scissors_test");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001644,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_genqueries");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001645,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_invalid_beginquery");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001646,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_invalid_endquery");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001647,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_invalid_queries");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001648,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_is_query_nonzero");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001649,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_is_query_zero");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001650,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_no_active_query");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001651,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_query_order");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001652,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_queryobjectuiv");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001653,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_stencil_test");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001654,
    "GTF-GL42.gtf33.GL3Tests.occlusion_query.occlusion_query_suppressed_pixels");
