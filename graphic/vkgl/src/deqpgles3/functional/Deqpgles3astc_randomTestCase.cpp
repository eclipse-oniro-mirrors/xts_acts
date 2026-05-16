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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027612,
        "dEQP-GLES3.functional.textur",
        "e.compressed.astc.random.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027613,
        "dEQP-GLES3.functional.textur",
        "e.compressed.astc.random.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027614,
        "dEQP-GLES3.functional.textur",
        "e.compressed.astc.random.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027615,
        "dEQP-GLES3.functional.textur",
        "e.compressed.astc.random.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027616,
        "dEQP-GLES3.functional.textur",
        "e.compressed.astc.random.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027617,
        "dEQP-GLES3.functional.textur",
        "e.compressed.astc.random.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027618,
        "dEQP-GLES3.functional.textur",
        "e.compressed.astc.random.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027619,
        "dEQP-GLES3.functional.textur",
        "e.compressed.astc.random.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027620,
        "dEQP-GLES3.functional.textur",
        "e.compressed.astc.random.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027621,
        "dEQP-GLES3.functional.textur",
        "e.compressed.astc.random.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027622,
        "dEQP-GLES3.functional.textur",
        "e.compressed.astc.random.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027623,
        "dEQP-GLES3.functional.texture",
        ".compressed.astc.random.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027624,
        "dEQP-GLES3.functional.texture",
        ".compressed.astc.random.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027625,
        "dEQP-GLES3.functional.texture",
        ".compressed.astc.random.12x12");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027626,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.random.4x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027627,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.random.5x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027628,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.random.5x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027629,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.random.6x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027630,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.random.6x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027631,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.random.8x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027632,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.random.8x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027633,
        "dEQP-GLES3.functional.texture.",
        "compressed.astc.random.8x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027634,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.random.10x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027635,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.random.10x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027636,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.random.10x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027637,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.random.10x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027638,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.random.12x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027639,
        "dEQP-GLES3.functional.texture.c",
        "ompressed.astc.random.12x12_srgb");
