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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003073,
        "dEQP-GLES31.functional.shaders.sample_variables.sample",
        "_mask.discard_half_per_two_samples.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003074,
        "dEQP-GLES31.functional.shaders.sample_variables.sample",
        "_mask.discard_half_per_two_samples.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003075,
        "dEQP-GLES31.functional.shaders.sample_variables.sample_",
        "mask.discard_half_per_two_samples.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003076,
        "dEQP-GLES31.functional.shaders.sample_variables.sample_",
        "mask.discard_half_per_two_samples.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003077,
        "dEQP-GLES31.functional.shaders.sample_variables.sample_",
        "mask.discard_half_per_two_samples.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003078,
        "dEQP-GLES31.functional.shaders.sample_variables.sample_",
        "mask.discard_half_per_two_samples.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003079,
        "dEQP-GLES31.functional.shaders.sample_variables.sample_",
        "mask.discard_half_per_two_samples.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003080,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask.discard_half_per_two_samples.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003081,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask.discard_half_per_two_samples.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003082,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask.discard_half_per_two_samples.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003083,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask.discard_half_per_two_samples.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003084,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask.discard_half_per_two_samples.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003085,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask.discard_half_per_two_samples.multisample_rbo_16");
