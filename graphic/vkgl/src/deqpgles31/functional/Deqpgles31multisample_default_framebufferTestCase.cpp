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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016165,
        "dEQP-GLES31.functional.multisample.",
        "default_framebuffer.sample_position");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016166,
        "dEQP-GLES31.functional.multisample.defaul",
        "t_framebuffer.sample_mask_sum_of_inverses");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016167,
        "dEQP-GLES31.functional.multisample.defaul",
        "t_framebuffer.proportionality_sample_mask");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016168,
        "dEQP-GLES31.functional.multisample.def",
        "ault_framebuffer.constancy_sample_mask");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016169,
        "dEQP-GLES31.functional.multisample.default_fram",
        "ebuffer.constancy_alpha_to_coverage_sample_mask");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016170,
        "dEQP-GLES31.functional.multisample.default_fra",
        "mebuffer.constancy_sample_coverage_sample_mask");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016171,
        "dEQP-GLES31.functional.multisample.default_framebuffer.",
        "constancy_alpha_to_coverage_sample_coverage_sample_mask");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016172,
        "dEQP-GLES31.functional.multisample.default",
        "_framebuffer.sample_mask_non_effective_bits");
