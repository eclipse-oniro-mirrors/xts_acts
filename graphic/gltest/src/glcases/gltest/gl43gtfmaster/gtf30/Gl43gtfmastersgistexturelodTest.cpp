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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001349,
    "GTF-GL43.gtf30.GL3Tests.sgis_texture_lod.sgis_texture_lod_basic_initial");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001350,
    "GTF-GL43.gtf30.GL3Tests.sgis_texture_lod.sgis_texture_lod_basic_error");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001351,
    "GTF-GL43.gtf30.GL3Tests.sgis_texture_lod.sgis_texture_lod_basic_getter");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001352,
    "GTF-GL43.gtf30.GL3Tests.sgis_texture_lod.sgis_texture_lod_basic_completeness");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001353,
    "GTF-GL43.gtf30.GL3Tests.sgis_texture_lod.sgis_texture_lod_basic_mipmap_generation");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001354,
    "GTF-GL43.gtf30.GL3Tests.sgis_texture_lod.sgis_texture_lod_basic_lod_selection");
