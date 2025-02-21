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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013976,
        "dEQP-GLES2.functional.mult",
        "isample.num_samples_polygon");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013977,
        "dEQP-GLES2.functional.mul",
        "tisample.num_samples_line");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013978,
        "dEQP-GLES2.functional.multis",
        "ample.common_edge_small_quads");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013979,
        "dEQP-GLES2.functional.multi",
        "sample.common_edge_big_quad");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013980,
        "dEQP-GLES2.functional.multisa",
        "mple.common_edge_viewport_quad");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013981,
        "dEQP-GLES2.function",
        "al.multisample.depth");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013982,
        "dEQP-GLES2.functiona",
        "l.multisample.stencil");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013983,
        "dEQP-GLES2.functional.multis",
        "ample.sample_coverage_invert");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013984,
        "dEQP-GLES2.functional.multisample",
        ".proportionality_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013985,
        "dEQP-GLES2.functional.multisampl",
        "e.proportionality_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013986,
        "dEQP-GLES2.functional.multisample.pro",
        "portionality_sample_coverage_inverted");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013987,
        "dEQP-GLES2.functional.multisam",
        "ple.constancy_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013988,
        "dEQP-GLES2.functional.multisa",
        "mple.constancy_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013989,
        "dEQP-GLES2.functional.multisample.",
        "constancy_sample_coverage_inverted");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013990,
        "dEQP-GLES2.functional.mu",
        "ltisample.constancy_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013991,
        "dEQP-GLES2.functional.multis",
        "ample.constancy_both_inverted");
