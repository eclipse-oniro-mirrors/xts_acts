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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013035,
        "dEQP-GLES31.functional.texture.mul",
        "tisample.samples_64.sample_position");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013036,
        "dEQP-GLES31.functional.texture.mult",
        "isample.samples_64.sample_mask_only");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013037,
        "dEQP-GLES31.functional.texture.multisample.",
        "samples_64.sample_mask_and_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013038,
        "dEQP-GLES31.functional.texture.multisample",
        ".samples_64.sample_mask_and_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013039,
        "dEQP-GLES31.functional.texture.multisample.samples_64",
        ".sample_mask_and_sample_coverage_and_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013040,
        "dEQP-GLES31.functional.texture.multisample",
        ".samples_64.sample_mask_non_effective_bits");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013041,
        "dEQP-GLES31.functional.texture.multis",
        "ample.samples_64.use_texture_color_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013042,
        "dEQP-GLES31.functional.texture.multisamp",
        "le.samples_64.use_texture_color_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013043,
        "dEQP-GLES31.functional.texture.multi",
        "sample.samples_64.use_texture_int_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013044,
        "dEQP-GLES31.functional.texture.multisam",
        "ple.samples_64.use_texture_int_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013045,
        "dEQP-GLES31.functional.texture.multi",
        "sample.samples_64.use_texture_uint_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013046,
        "dEQP-GLES31.functional.texture.multisam",
        "ple.samples_64.use_texture_uint_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013047,
        "dEQP-GLES31.functional.texture.multis",
        "ample.samples_64.use_texture_depth_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013048,
        "dEQP-GLES31.functional.texture.multisamp",
        "le.samples_64.use_texture_depth_2d_array");
