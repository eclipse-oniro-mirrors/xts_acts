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
#include "../ActsDeqpgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002983,
        "dEQP-GLES31.functional.shaders.sample_variables",
        ".sample_mask_in.sample_mask.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002984,
        "dEQP-GLES31.functional.shaders.sample_variables",
        ".sample_mask_in.sample_mask.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002985,
        "dEQP-GLES31.functional.shaders.sample_variables.",
        "sample_mask_in.sample_mask.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002986,
        "dEQP-GLES31.functional.shaders.sample_variables.",
        "sample_mask_in.sample_mask.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002987,
        "dEQP-GLES31.functional.shaders.sample_variables.",
        "sample_mask_in.sample_mask.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002988,
        "dEQP-GLES31.functional.shaders.sample_variables.",
        "sample_mask_in.sample_mask.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002989,
        "dEQP-GLES31.functional.shaders.sample_variables.",
        "sample_mask_in.sample_mask.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002990,
        "dEQP-GLES31.functional.shaders.sample_variabl",
        "es.sample_mask_in.sample_mask.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002991,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_mask_in.sample_mask.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002992,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_mask_in.sample_mask.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002993,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_mask_in.sample_mask.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002994,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_mask_in.sample_mask.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002995,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_mask_in.sample_mask.multisample_rbo_16");
