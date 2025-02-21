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
#include "../ActsDeqpgles310015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014581,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.range_clamp.nearest_unorm_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014582,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.range_clamp.linear_unorm_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014583,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.range_clamp.nearest_snorm_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014584,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.range_clamp.linear_snorm_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014585,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.range_clamp.nearest_float_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014586,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.range_clamp.nearest_srgb_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014587,
        "dEQP-GLES31.functional.texture.borde",
        "r_clamp.range_clamp.linear_srgb_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014588,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.range_clamp.nearest_unorm_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014589,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.range_clamp.nearest_float_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014590,
        "dEQP-GLES31.functional.texture.border_clamp.range_",
        "clamp.nearest_float_depth_uint_stencil_sample_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014591,
        "dEQP-GLES31.functional.texture.border_clamp.range_",
        "clamp.nearest_unorm_depth_uint_stencil_sample_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014592,
        "dEQP-GLES31.functional.texture.border_cl",
        "amp.range_clamp.nearest_compressed_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014593,
        "dEQP-GLES31.functional.texture.border_c",
        "lamp.range_clamp.linear_compressed_color");
