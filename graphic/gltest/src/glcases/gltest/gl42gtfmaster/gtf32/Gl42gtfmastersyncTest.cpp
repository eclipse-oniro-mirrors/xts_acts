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

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001563,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_coverage_creation");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001564,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_coverage_issync");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001565,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_coverage_getsynciv_defaults");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001566,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_coverage_clientwaitsync");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001567,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_coverage_waitsync");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001568,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_coverage_max_server_wait_timeout");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001569,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_coverage_deletesync");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001570,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_coverage_getsynciv_fence");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001571,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_error_fencesync_condition");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001572,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_error_fencesync_flags");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001573,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_error_deletesync");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001574,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_error_getsynciv_sync");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001575,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_error_getsynciv_pname");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001576,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_error_clientwaitsync_sync");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001577,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_error_clientwaitsync_flags");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001578,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_error_waitsync_sync");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001579,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_error_waitsync_flags");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001580,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_error_waitsync_timeout");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001581,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_functionality_clientwaitsync_signaled");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001582,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_functionality_clientwaitsync_immediate");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001583,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_functionality_clientwaitsync_flush");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001584,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_functionality_clientwaitsync_timeout");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001585,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_functionality_issync");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001586,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_advanced_multi");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001587,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_advanced_reuse");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001588,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_advanced_shared_multi");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001589,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_advanced_shared_delete");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001590,
    "GTF-GL42.gtf32.GL3Tests.sync.sync_advanced_delete");
