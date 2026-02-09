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
#include "../ActsDeqpgles310004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003170,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.i",
        "nterpolate_at_sample.centroid_qualified.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003171,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.in",
        "terpolate_at_sample.centroid_qualified.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003172,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.in",
        "terpolate_at_sample.centroid_qualified.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003173,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.in",
        "terpolate_at_sample.centroid_qualified.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003174,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.in",
        "terpolate_at_sample.centroid_qualified.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003175,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.in",
        "terpolate_at_sample.centroid_qualified.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003176,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.int",
        "erpolate_at_sample.centroid_qualified.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003177,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_sample.centroid_qualified.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003178,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_sample.centroid_qualified.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003179,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_sample.centroid_qualified.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003180,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_sample.centroid_qualified.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003181,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_sample.centroid_qualified.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003182,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.i",
        "nterpolate_at_sample.centroid_qualified.multisample_rbo_16");
