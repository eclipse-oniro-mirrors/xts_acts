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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003022,
        "dEQP-GLES31.functional.shaders.sample_variables.sample",
        "_mask_in.bit_count_per_two_samples.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003023,
        "dEQP-GLES31.functional.shaders.sample_variables.sample",
        "_mask_in.bit_count_per_two_samples.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003024,
        "dEQP-GLES31.functional.shaders.sample_variables.sample_",
        "mask_in.bit_count_per_two_samples.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003025,
        "dEQP-GLES31.functional.shaders.sample_variables.sample_",
        "mask_in.bit_count_per_two_samples.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003026,
        "dEQP-GLES31.functional.shaders.sample_variables.sample_",
        "mask_in.bit_count_per_two_samples.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003027,
        "dEQP-GLES31.functional.shaders.sample_variables.sample_",
        "mask_in.bit_count_per_two_samples.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003028,
        "dEQP-GLES31.functional.shaders.sample_variables.sample_",
        "mask_in.bit_count_per_two_samples.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003029,
        "dEQP-GLES31.functional.shaders.sample_variables.samp",
        "le_mask_in.bit_count_per_two_samples.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003030,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask_in.bit_count_per_two_samples.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003031,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask_in.bit_count_per_two_samples.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003032,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask_in.bit_count_per_two_samples.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003033,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask_in.bit_count_per_two_samples.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003034,
        "dEQP-GLES31.functional.shaders.sample_variables.sampl",
        "e_mask_in.bit_count_per_two_samples.multisample_rbo_16");
