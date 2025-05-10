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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027556,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.endpoint_ise.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027557,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.endpoint_ise.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027558,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.endpoint_ise.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027559,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.endpoint_ise.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027560,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.endpoint_ise.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027561,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.endpoint_ise.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027562,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.endpoint_ise.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027563,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.endpoint_ise.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027564,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.endpoint_ise.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027565,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.endpoint_ise.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027566,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.endpoint_ise.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027567,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.endpoint_ise.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027568,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.endpoint_ise.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027569,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.endpoint_ise.12x12");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027570,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.endpoint_ise.4x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027571,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.endpoint_ise.5x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027572,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.endpoint_ise.5x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027573,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.endpoint_ise.6x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027574,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.endpoint_ise.6x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027575,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.endpoint_ise.8x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027576,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.endpoint_ise.8x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027577,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.endpoint_ise.8x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027578,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_ise.10x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027579,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_ise.10x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027580,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_ise.10x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027581,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_ise.10x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027582,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_ise.12x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027583,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_ise.12x12_srgb");
