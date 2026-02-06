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
#include "../ActsDeqpgles310014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013049,
        "dEQP-GLES31.functional.texture.multisample.neg",
        "ative.fbo_attach_different_sample_count_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013050,
        "dEQP-GLES31.functional.texture.multisample.neg",
        "ative.fbo_attach_different_sample_count_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013051,
        "dEQP-GLES31.functional.texture.multisample.neg",
        "ative.fbo_attach_different_fixed_state_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013052,
        "dEQP-GLES31.functional.texture.multisample.neg",
        "ative.fbo_attach_different_fixed_state_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013053,
        "dEQP-GLES31.functional.texture.multisa",
        "mple.negative.fbo_attach_non_zero_level");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013054,
        "dEQP-GLES31.functional.texture.mult",
        "isample.negative.texture_min_filter");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013055,
        "dEQP-GLES31.functional.texture.mult",
        "isample.negative.texture_mag_filter");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013056,
        "dEQP-GLES31.functional.texture.mu",
        "ltisample.negative.texture_wrap_s");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013057,
        "dEQP-GLES31.functional.texture.mu",
        "ltisample.negative.texture_wrap_t");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013058,
        "dEQP-GLES31.functional.texture.mu",
        "ltisample.negative.texture_wrap_r");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013059,
        "dEQP-GLES31.functional.texture.mu",
        "ltisample.negative.texture_min_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013060,
        "dEQP-GLES31.functional.texture.mu",
        "ltisample.negative.texture_max_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013061,
        "dEQP-GLES31.functional.texture.multi",
        "sample.negative.texture_compare_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013062,
        "dEQP-GLES31.functional.texture.multi",
        "sample.negative.texture_compare_func");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013063,
        "dEQP-GLES31.functional.texture.mult",
        "isample.negative.texture_base_level");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013064,
        "dEQP-GLES31.functional.texture.multisa",
        "mple.negative.texture_high_sample_count");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013065,
        "dEQP-GLES31.functional.texture.multisa",
        "mple.negative.texture_zero_sample_count");
