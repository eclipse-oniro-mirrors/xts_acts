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

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001703,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_texture_targets");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001704,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_texture_levels");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001705,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_texture_internal_formats");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001706,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_texture_dimensionality");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001707,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_texture_immutability");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001708,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_texture_sizes");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001709,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_texture_level_base_and_texture_level_max");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001710,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_default_texture_target");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001711,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_uncompressed_texture_data");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001712,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_compressed_texture_data");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001713,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_texture_as_framebuffer_attachment");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001714,
    "GTF-GL42.gtf42.GL3Tests.texture_storage.texture_storage_uninitialized_miplevels");
