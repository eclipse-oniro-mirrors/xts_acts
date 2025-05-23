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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003112,
        "dEQP-GLES31.functional.shaders.sample_variables.sam",
        "ple_mask.inverse_per_two_samples.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003113,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask.inverse_per_two_samples.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003114,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask.inverse_per_two_samples.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003115,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask.inverse_per_two_samples.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003116,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask.inverse_per_two_samples.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003117,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask.inverse_per_two_samples.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003118,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask.inverse_per_two_samples.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003119,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.inverse_per_two_samples.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003120,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.inverse_per_two_samples.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003121,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.inverse_per_two_samples.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003122,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.inverse_per_two_samples.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003123,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.inverse_per_two_samples.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003124,
        "dEQP-GLES31.functional.shaders.sample_variables.sam",
        "ple_mask.inverse_per_two_samples.multisample_rbo_16");
