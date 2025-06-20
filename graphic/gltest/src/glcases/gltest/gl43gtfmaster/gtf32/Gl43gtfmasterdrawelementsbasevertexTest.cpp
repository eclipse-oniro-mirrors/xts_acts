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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001507,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_basic");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001508,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_basevertex");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001509,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_mode");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001510,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_type");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001511,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_count");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001512,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_start");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001513,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_end");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001514,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_primcount");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001515,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_attrib_size");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001516,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_upconvert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001517,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_overflow");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001518,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_range");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001519,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_stride");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001520,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_pointer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001521,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_invalid_mode");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001522,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_invalid_count");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001523,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_invalid_type");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001524,
    "GTF-GL43.gtf32.GL3Tests.draw_elements_base_vertex.draw_elements_base_vertex_invalid_start_end");
