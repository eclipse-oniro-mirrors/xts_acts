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

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001216,
    "GTF-GL42.gtf21.GL3Tests.texture_lod_bias.texture_lod_bias_init");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001217,
    "GTF-GL42.gtf21.GL3Tests.texture_lod_bias.texture_lod_bias_getter");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001218,
    "GTF-GL42.gtf21.GL3Tests.texture_lod_bias.texture_lod_bias_basic");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001219,
    "GTF-GL42.gtf21.GL3Tests.texture_lod_bias.texture_lod_bias_negative");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001220,
    "GTF-GL42.gtf21.GL3Tests.texture_lod_bias.texture_lod_bias_clamp_m_le_M");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001221,
    "GTF-GL42.gtf21.GL3Tests.texture_lod_bias.texture_lod_bias_clamp_m_g_M");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001222,
    "GTF-GL42.gtf21.GL3Tests.texture_lod_bias.texture_lod_bias_clamp_4");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001223,
    "GTF-GL42.gtf21.GL3Tests.texture_lod_bias.texture_lod_bias_all");
