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

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042274,
        "dEQP-GLES3.functional.multisample.",
        "fbo_max_samples.num_samples_polygon");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042275,
        "dEQP-GLES3.functional.multisample",
        ".fbo_max_samples.num_samples_line");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042276,
        "dEQP-GLES3.functional.multisample.fb",
        "o_max_samples.common_edge_small_quads");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042277,
        "dEQP-GLES3.functional.multisample.f",
        "bo_max_samples.common_edge_big_quad");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042278,
        "dEQP-GLES3.functional.multisample.fbo",
        "_max_samples.common_edge_viewport_quad");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042279,
        "dEQP-GLES3.functional.multi",
        "sample.fbo_max_samples.depth");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042280,
        "dEQP-GLES3.functional.multis",
        "ample.fbo_max_samples.stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042281,
        "dEQP-GLES3.functional.multisample.fb",
        "o_max_samples.sample_coverage_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042282,
        "dEQP-GLES3.functional.multisample.fbo_max",
        "_samples.proportionality_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042283,
        "dEQP-GLES3.functional.multisample.fbo_ma",
        "x_samples.proportionality_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042284,
        "dEQP-GLES3.functional.multisample.fbo_max_sam",
        "ples.proportionality_sample_coverage_inverted");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042285,
        "dEQP-GLES3.functional.multisample.fbo_",
        "max_samples.constancy_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042286,
        "dEQP-GLES3.functional.multisample.fbo",
        "_max_samples.constancy_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042287,
        "dEQP-GLES3.functional.multisample.fbo_max_",
        "samples.constancy_sample_coverage_inverted");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042288,
        "dEQP-GLES3.functional.multisampl",
        "e.fbo_max_samples.constancy_both");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042289,
        "dEQP-GLES3.functional.multisample.fb",
        "o_max_samples.constancy_both_inverted");
