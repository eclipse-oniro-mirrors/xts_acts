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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30028TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027584,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_component_selector.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027585,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_component_selector.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027586,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_component_selector.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027587,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_component_selector.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027588,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_component_selector.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027589,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_component_selector.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027590,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_component_selector.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027591,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_component_selector.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027592,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_component_selector.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027593,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_component_selector.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027594,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_component_selector.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027595,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.color_component_selector.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027596,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.color_component_selector.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027597,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.color_component_selector.12x12");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027598,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.color_component_selector.4x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027599,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.color_component_selector.5x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027600,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.color_component_selector.5x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027601,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.color_component_selector.6x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027602,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.color_component_selector.6x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027603,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.color_component_selector.8x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027604,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.color_component_selector.8x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027605,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.color_component_selector.8x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027606,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.color_component_selector.10x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027607,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.color_component_selector.10x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027608,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.color_component_selector.10x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027609,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.color_component_selector.10x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027610,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.color_component_selector.12x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027611,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.color_component_selector.12x12_srgb");
