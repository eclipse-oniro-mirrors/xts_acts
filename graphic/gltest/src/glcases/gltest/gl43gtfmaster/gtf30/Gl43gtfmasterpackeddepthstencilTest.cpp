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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001337,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_init");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001338,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_error");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001339,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_readpixels");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001340,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_getteximage");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001341,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_copyteximage");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001342,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_partialattachments");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001343,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_mixedattachments");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001344,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_parameters");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001345,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_renderbuffers");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001346,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_stencilsize");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001347,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_clearbuffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001348,
    "GTF-GL43.gtf30.GL3Tests.packed_depth_stencil.packed_depth_stencil_blit");
