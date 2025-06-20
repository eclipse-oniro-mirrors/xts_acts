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
#include "../Gl41gtfmasterBaseFunc.h"
#include "../ActsGl41gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001687,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_init_defaults");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001688,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_api");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001689,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_error");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001690,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_error_invalid_varyings");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001691,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_basic_outline");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001692,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_two_buffers");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001693,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_skip_components");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001694,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_skip_multiple_buffers");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001695,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_streams_queried");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001696,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_streams_overflow");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001697,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_stream_failure");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001698,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_draw_stream");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001699,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_geometry_instanced");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001700,
    "GTF-GL41.gtf40.GL3Tests.transform_feedback3.transform_feedback3_multiple_streams");
