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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012979,
        "dEQP-GLES31.functional.texture.mul",
        "tisample.samples_10.sample_position");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012980,
        "dEQP-GLES31.functional.texture.mult",
        "isample.samples_10.sample_mask_only");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012981,
        "dEQP-GLES31.functional.texture.multisample.",
        "samples_10.sample_mask_and_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012982,
        "dEQP-GLES31.functional.texture.multisample",
        ".samples_10.sample_mask_and_sample_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012983,
        "dEQP-GLES31.functional.texture.multisample.samples_10",
        ".sample_mask_and_sample_coverage_and_alpha_to_coverage");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012984,
        "dEQP-GLES31.functional.texture.multisample",
        ".samples_10.sample_mask_non_effective_bits");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012985,
        "dEQP-GLES31.functional.texture.multis",
        "ample.samples_10.use_texture_color_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012986,
        "dEQP-GLES31.functional.texture.multisamp",
        "le.samples_10.use_texture_color_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012987,
        "dEQP-GLES31.functional.texture.multi",
        "sample.samples_10.use_texture_int_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012988,
        "dEQP-GLES31.functional.texture.multisam",
        "ple.samples_10.use_texture_int_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012989,
        "dEQP-GLES31.functional.texture.multi",
        "sample.samples_10.use_texture_uint_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012990,
        "dEQP-GLES31.functional.texture.multisam",
        "ple.samples_10.use_texture_uint_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012991,
        "dEQP-GLES31.functional.texture.multis",
        "ample.samples_10.use_texture_depth_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012992,
        "dEQP-GLES31.functional.texture.multisamp",
        "le.samples_10.use_texture_depth_2d_array");
