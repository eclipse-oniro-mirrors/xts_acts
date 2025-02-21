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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30043TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042226,
        "dEQP-GLES3.functional.multisample.de",
        "fault_framebuffer.num_samples_polygon");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042227,
        "dEQP-GLES3.functional.multisample.d",
        "efault_framebuffer.num_samples_line");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042228,
        "dEQP-GLES3.functional.multisample.defa",
        "ult_framebuffer.common_edge_small_quads");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042229,
        "dEQP-GLES3.functional.multisample.def",
        "ault_framebuffer.common_edge_big_quad");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042230,
        "dEQP-GLES3.functional.multisample.defau",
        "lt_framebuffer.common_edge_viewport_quad");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042231,
        "dEQP-GLES3.functional.multisa",
        "mple.default_framebuffer.depth");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042232,
        "dEQP-GLES3.functional.multisam",
        "ple.default_framebuffer.stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042233,
        "dEQP-GLES3.functional.multisample.defa",
        "ult_framebuffer.sample_coverage_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042234,
        "dEQP-GLES3.functional.multisample.default_f",
        "ramebuffer.proportionality_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042235,
        "dEQP-GLES3.functional.multisample.default_",
        "framebuffer.proportionality_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042236,
        "dEQP-GLES3.functional.multisample.default_frame",
        "buffer.proportionality_sample_coverage_inverted");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042237,
        "dEQP-GLES3.functional.multisample.defaul",
        "t_framebuffer.constancy_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042238,
        "dEQP-GLES3.functional.multisample.defau",
        "lt_framebuffer.constancy_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042239,
        "dEQP-GLES3.functional.multisample.default_fr",
        "amebuffer.constancy_sample_coverage_inverted");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042240,
        "dEQP-GLES3.functional.multisample.",
        "default_framebuffer.constancy_both");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042241,
        "dEQP-GLES3.functional.multisample.defa",
        "ult_framebuffer.constancy_both_inverted");
