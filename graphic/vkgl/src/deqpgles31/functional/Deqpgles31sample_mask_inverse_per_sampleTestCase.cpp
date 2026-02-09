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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003099,
        "dEQP-GLES31.functional.shaders.sample_variables.s",
        "ample_mask.inverse_per_sample.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003100,
        "dEQP-GLES31.functional.shaders.sample_variables.s",
        "ample_mask.inverse_per_sample.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003101,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.inverse_per_sample.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003102,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.inverse_per_sample.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003103,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.inverse_per_sample.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003104,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.inverse_per_sample.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003105,
        "dEQP-GLES31.functional.shaders.sample_variables.sa",
        "mple_mask.inverse_per_sample.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003106,
        "dEQP-GLES31.functional.shaders.sample_variables",
        ".sample_mask.inverse_per_sample.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003107,
        "dEQP-GLES31.functional.shaders.sample_variables.",
        "sample_mask.inverse_per_sample.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003108,
        "dEQP-GLES31.functional.shaders.sample_variables.",
        "sample_mask.inverse_per_sample.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003109,
        "dEQP-GLES31.functional.shaders.sample_variables.",
        "sample_mask.inverse_per_sample.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003110,
        "dEQP-GLES31.functional.shaders.sample_variables.",
        "sample_mask.inverse_per_sample.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003111,
        "dEQP-GLES31.functional.shaders.sample_variables.",
        "sample_mask.inverse_per_sample.multisample_rbo_16");
