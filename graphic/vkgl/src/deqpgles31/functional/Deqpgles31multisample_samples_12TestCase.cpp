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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012993,
        "dEQP-GLES31.functional.texture.mul",
        "tisample.samples_12.sample_position");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012994,
        "dEQP-GLES31.functional.texture.mult",
        "isample.samples_12.sample_mask_only");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012995,
        "dEQP-GLES31.functional.texture.multisample.",
        "samples_12.sample_mask_and_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012996,
        "dEQP-GLES31.functional.texture.multisample",
        ".samples_12.sample_mask_and_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012997,
        "dEQP-GLES31.functional.texture.multisample.samples_12",
        ".sample_mask_and_sample_coverage_and_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012998,
        "dEQP-GLES31.functional.texture.multisample",
        ".samples_12.sample_mask_non_effective_bits");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012999,
        "dEQP-GLES31.functional.texture.multis",
        "ample.samples_12.use_texture_color_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_013000,
        "dEQP-GLES31.functional.texture.multisamp",
        "le.samples_12.use_texture_color_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_013001,
        "dEQP-GLES31.functional.texture.multi",
        "sample.samples_12.use_texture_int_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_013002,
        "dEQP-GLES31.functional.texture.multisam",
        "ple.samples_12.use_texture_int_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_013003,
        "dEQP-GLES31.functional.texture.multi",
        "sample.samples_12.use_texture_uint_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_013004,
        "dEQP-GLES31.functional.texture.multisam",
        "ple.samples_12.use_texture_uint_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_013005,
        "dEQP-GLES31.functional.texture.multis",
        "ample.samples_12.use_texture_depth_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_013006,
        "dEQP-GLES31.functional.texture.multisamp",
        "le.samples_12.use_texture_depth_2d_array");
