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
#include "../Gl43gtfmasterBaseFunc.h"
#include "../ActsGl43gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001680,
    "GTF-GL43.gtf40.GL3Tests.transform_feedback2.transform_feedback2_init_defaults");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001681,
    "GTF-GL43.gtf40.GL3Tests.transform_feedback2.transform_feedback2_api");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001682,
    "GTF-GL43.gtf40.GL3Tests.transform_feedback2.transform_feedback2_basic");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001683,
    "GTF-GL43.gtf40.GL3Tests.transform_feedback2.transform_feedback2_states");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001684,
    "GTF-GL43.gtf40.GL3Tests.transform_feedback2.transform_feedback2_pause_resume");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001685,
    "GTF-GL43.gtf40.GL3Tests.transform_feedback2.transform_feedback2_framebuffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001686,
    "GTF-GL43.gtf40.GL3Tests.transform_feedback2.transform_feedback2_two_buffers");
