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

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042242,
        "dEQP-GLES3.functional.multisample",
        ".fbo_4_samples.num_samples_polygon");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042243,
        "dEQP-GLES3.functional.multisampl",
        "e.fbo_4_samples.num_samples_line");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042244,
        "dEQP-GLES3.functional.multisample.f",
        "bo_4_samples.common_edge_small_quads");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042245,
        "dEQP-GLES3.functional.multisample.",
        "fbo_4_samples.common_edge_big_quad");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042246,
        "dEQP-GLES3.functional.multisample.fb",
        "o_4_samples.common_edge_viewport_quad");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042247,
        "dEQP-GLES3.functional.mult",
        "isample.fbo_4_samples.depth");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042248,
        "dEQP-GLES3.functional.multi",
        "sample.fbo_4_samples.stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042249,
        "dEQP-GLES3.functional.multisample.f",
        "bo_4_samples.sample_coverage_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042250,
        "dEQP-GLES3.functional.multisample.fbo_4_",
        "samples.proportionality_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042251,
        "dEQP-GLES3.functional.multisample.fbo_4",
        "_samples.proportionality_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042252,
        "dEQP-GLES3.functional.multisample.fbo_4_samp",
        "les.proportionality_sample_coverage_inverted");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042253,
        "dEQP-GLES3.functional.multisample.fbo",
        "_4_samples.constancy_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042254,
        "dEQP-GLES3.functional.multisample.fb",
        "o_4_samples.constancy_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042255,
        "dEQP-GLES3.functional.multisample.fbo_4_s",
        "amples.constancy_sample_coverage_inverted");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042256,
        "dEQP-GLES3.functional.multisamp",
        "le.fbo_4_samples.constancy_both");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042257,
        "dEQP-GLES3.functional.multisample.f",
        "bo_4_samples.constancy_both_inverted");
