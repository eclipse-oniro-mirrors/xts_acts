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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001536,
    "GTF-GL43.gtf32.GL3Tests.vertex_array_bgra.vertex_array_bgra_basic");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001537,
    "GTF-GL43.gtf32.GL3Tests.vertex_array_bgra.vertex_array_bgra_draw_calls");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001538,
    "GTF-GL43.gtf32.GL3Tests.vertex_array_bgra.vertex_array_bgra_primitive_types");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001539,
    "GTF-GL43.gtf32.GL3Tests.vertex_array_bgra.vertex_array_bgra_stride");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001540,
    "GTF-GL43.gtf32.GL3Tests.vertex_array_bgra.vertex_array_bgra_pointer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001541,
    "GTF-GL43.gtf32.GL3Tests.vertex_array_bgra.vertex_array_bgra_attrib_sizes");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001542,
    "GTF-GL43.gtf32.GL3Tests.vertex_array_bgra.vertex_array_bgra_primitive_restart");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001543,
    "GTF-GL43.gtf32.GL3Tests.vertex_array_bgra.vertex_array_bgra_invalid");
