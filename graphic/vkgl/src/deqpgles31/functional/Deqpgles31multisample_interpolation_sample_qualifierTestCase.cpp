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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003125,
        "dEQP-GLES31.functional.shaders.multisample_int",
        "erpolation.sample_qualifier.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003126,
        "dEQP-GLES31.functional.shaders.multisample_inte",
        "rpolation.sample_qualifier.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003127,
        "dEQP-GLES31.functional.shaders.multisample_inte",
        "rpolation.sample_qualifier.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003128,
        "dEQP-GLES31.functional.shaders.multisample_inte",
        "rpolation.sample_qualifier.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003129,
        "dEQP-GLES31.functional.shaders.multisample_inte",
        "rpolation.sample_qualifier.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003130,
        "dEQP-GLES31.functional.shaders.multisample_inte",
        "rpolation.sample_qualifier.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003131,
        "dEQP-GLES31.functional.shaders.multisample_inter",
        "polation.sample_qualifier.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003132,
        "dEQP-GLES31.functional.shaders.multisample_in",
        "terpolation.sample_qualifier.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003133,
        "dEQP-GLES31.functional.shaders.multisample_in",
        "terpolation.sample_qualifier.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003134,
        "dEQP-GLES31.functional.shaders.multisample_in",
        "terpolation.sample_qualifier.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003135,
        "dEQP-GLES31.functional.shaders.multisample_in",
        "terpolation.sample_qualifier.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003136,
        "dEQP-GLES31.functional.shaders.multisample_in",
        "terpolation.sample_qualifier.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003137,
        "dEQP-GLES31.functional.shaders.multisample_int",
        "erpolation.sample_qualifier.multisample_rbo_16");
