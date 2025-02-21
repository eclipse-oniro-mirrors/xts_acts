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
#include "../ActsDeqpgles310013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012923,
        "dEQP-GLES31.functional.texture.mul",
        "tisample.samples_2.sample_position");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012924,
        "dEQP-GLES31.functional.texture.mul",
        "tisample.samples_2.sample_mask_only");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012925,
        "dEQP-GLES31.functional.texture.multisample.",
        "samples_2.sample_mask_and_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012926,
        "dEQP-GLES31.functional.texture.multisample",
        ".samples_2.sample_mask_and_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012927,
        "dEQP-GLES31.functional.texture.multisample.samples_2.",
        "sample_mask_and_sample_coverage_and_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012928,
        "dEQP-GLES31.functional.texture.multisampl",
        "e.samples_2.sample_mask_non_effective_bits");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012929,
        "dEQP-GLES31.functional.texture.multi",
        "sample.samples_2.use_texture_color_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012930,
        "dEQP-GLES31.functional.texture.multisam",
        "ple.samples_2.use_texture_color_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012931,
        "dEQP-GLES31.functional.texture.mult",
        "isample.samples_2.use_texture_int_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012932,
        "dEQP-GLES31.functional.texture.multisa",
        "mple.samples_2.use_texture_int_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012933,
        "dEQP-GLES31.functional.texture.multi",
        "sample.samples_2.use_texture_uint_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012934,
        "dEQP-GLES31.functional.texture.multisam",
        "ple.samples_2.use_texture_uint_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012935,
        "dEQP-GLES31.functional.texture.multi",
        "sample.samples_2.use_texture_depth_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012936,
        "dEQP-GLES31.functional.texture.multisam",
        "ple.samples_2.use_texture_depth_2d_array");
