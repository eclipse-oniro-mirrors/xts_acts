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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003060,
        "dEQP-GLES31.functional.shaders.sample_variables.sam",
        "ple_mask.discard_half_per_sample.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003061,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask.discard_half_per_sample.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003062,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask.discard_half_per_sample.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003063,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask.discard_half_per_sample.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003064,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask.discard_half_per_sample.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003065,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask.discard_half_per_sample.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003066,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask.discard_half_per_sample.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003067,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.discard_half_per_sample.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003068,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.discard_half_per_sample.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003069,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.discard_half_per_sample.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003070,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.discard_half_per_sample.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003071,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.discard_half_per_sample.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003072,
        "dEQP-GLES31.functional.shaders.sample_variables.sam",
        "ple_mask.discard_half_per_sample.multisample_rbo_16");
