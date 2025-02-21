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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027416,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_ise.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027417,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_ise.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027418,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_ise.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027419,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_ise.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027420,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_ise.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027421,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_ise.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027422,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_ise.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027423,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_ise.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027424,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_ise.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027425,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_ise.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027426,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.weight_ise.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027427,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.weight_ise.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027428,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.weight_ise.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027429,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.weight_ise.12x12");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027430,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.weight_ise.4x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027431,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.weight_ise.5x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027432,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.weight_ise.5x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027433,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.weight_ise.6x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027434,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.weight_ise.6x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027435,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.weight_ise.8x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027436,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.weight_ise.8x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027437,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.weight_ise.8x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027438,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_ise.10x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027439,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_ise.10x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027440,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_ise.10x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027441,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_ise.10x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027442,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_ise.12x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027443,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.weight_ise.12x12_srgb");
