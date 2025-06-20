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

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014809,
        "dEQP-GLES31.functional.texture.",
        "border_clamp.unused_channels.r8");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014810,
        "dEQP-GLES31.functional.texture.bor",
        "der_clamp.unused_channels.rg8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014811,
        "dEQP-GLES31.functional.texture.b",
        "order_clamp.unused_channels.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014812,
        "dEQP-GLES31.functional.texture.b",
        "order_clamp.unused_channels.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014813,
        "dEQP-GLES31.functional.texture.b",
        "order_clamp.unused_channels.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014814,
        "dEQP-GLES31.functional.texture.bor",
        "der_clamp.unused_channels.luminance");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014815,
        "dEQP-GLES31.functional.texture.b",
        "order_clamp.unused_channels.alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014816,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.unused_channels.luminance_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014817,
        "dEQP-GLES31.functional.texture.border_",
        "clamp.unused_channels.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014818,
        "dEQP-GLES31.functional.texture.border_c",
        "lamp.unused_channels.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014819,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.unused_channels.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014820,
        "dEQP-GLES31.functional.texture.border_clamp.u",
        "nused_channels.depth32f_stencil8_sample_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014821,
        "dEQP-GLES31.functional.texture.border_clamp.un",
        "used_channels.depth32f_stencil8_sample_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014822,
        "dEQP-GLES31.functional.texture.border_clamp.",
        "unused_channels.depth24_stencil8_sample_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014823,
        "dEQP-GLES31.functional.texture.border_clamp.u",
        "nused_channels.depth24_stencil8_sample_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014824,
        "dEQP-GLES31.functional.texture.border_c",
        "lamp.unused_channels.compressed_r11_eac");
