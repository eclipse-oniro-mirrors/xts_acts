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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003270,
        "dEQP-GLES31.functional.shaders.multisample_interpolation",
        ".interpolate_at_offset.array_element.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003271,
        "dEQP-GLES31.functional.shaders.multisample_interpolation",
        ".interpolate_at_offset.array_element.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003272,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_offset.array_element.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003273,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_offset.array_element.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003274,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_offset.array_element.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003275,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_offset.array_element.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003276,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_offset.array_element.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003277,
        "dEQP-GLES31.functional.shaders.multisample_interpolati",
        "on.interpolate_at_offset.array_element.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003278,
        "dEQP-GLES31.functional.shaders.multisample_interpolatio",
        "n.interpolate_at_offset.array_element.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003279,
        "dEQP-GLES31.functional.shaders.multisample_interpolatio",
        "n.interpolate_at_offset.array_element.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003280,
        "dEQP-GLES31.functional.shaders.multisample_interpolatio",
        "n.interpolate_at_offset.array_element.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003281,
        "dEQP-GLES31.functional.shaders.multisample_interpolatio",
        "n.interpolate_at_offset.array_element.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003282,
        "dEQP-GLES31.functional.shaders.multisample_interpolatio",
        "n.interpolate_at_offset.array_element.multisample_rbo_16");
