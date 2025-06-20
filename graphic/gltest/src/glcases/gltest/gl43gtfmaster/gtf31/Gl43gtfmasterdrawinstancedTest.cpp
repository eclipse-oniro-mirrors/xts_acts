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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001389,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_basic");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001390,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_zero_id");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001391,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_mode");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001392,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_count");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001393,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_first");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001394,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_type");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001395,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_primcount");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001396,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_primcount_maxint");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001397,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_expressions");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001398,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_max_vertex_attribs");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001399,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_attrib_size");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001400,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_vertex_attrib_stride");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001401,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_vertex_attrib_pointer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001402,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_invalid");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001403,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_compilation_error");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001404,
    "GTF-GL43.gtf31.GL3Tests.draw_instanced.draw_instanced_tessellation_compilation_error");
