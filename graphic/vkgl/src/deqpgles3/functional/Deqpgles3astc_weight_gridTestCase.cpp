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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027388,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_grid.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027389,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_grid.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027390,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_grid.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027391,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_grid.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027392,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_grid.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027393,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_grid.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027394,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_grid.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027395,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_grid.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027396,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.weight_grid.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027397,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.weight_grid.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027398,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.weight_grid.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027399,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.weight_grid.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027400,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.weight_grid.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027401,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.weight_grid.12x12");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027402,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_grid.4x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027403,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_grid.5x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027404,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_grid.5x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027405,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_grid.6x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027406,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_grid.6x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027407,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_grid.8x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027408,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_grid.8x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027409,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_grid.8x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027410,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_grid.10x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027411,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_grid.10x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027412,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_grid.10x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027413,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.weight_grid.10x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027414,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.weight_grid.12x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027415,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.weight_grid.12x12_srgb");
