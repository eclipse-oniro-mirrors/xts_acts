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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027472,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.partition_pattern_index.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027473,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.partition_pattern_index.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027474,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.partition_pattern_index.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027475,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.partition_pattern_index.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027476,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.partition_pattern_index.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027477,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.partition_pattern_index.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027478,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.partition_pattern_index.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027479,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.partition_pattern_index.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027480,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.partition_pattern_index.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027481,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.partition_pattern_index.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027482,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.partition_pattern_index.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027483,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.partition_pattern_index.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027484,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.partition_pattern_index.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027485,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.partition_pattern_index.12x12");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027486,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.partition_pattern_index.4x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027487,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.partition_pattern_index.5x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027488,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.partition_pattern_index.5x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027489,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.partition_pattern_index.6x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027490,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.partition_pattern_index.6x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027491,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.partition_pattern_index.8x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027492,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.partition_pattern_index.8x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027493,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.partition_pattern_index.8x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027494,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.partition_pattern_index.10x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027495,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.partition_pattern_index.10x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027496,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.partition_pattern_index.10x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027497,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.partition_pattern_index.10x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027498,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.partition_pattern_index.12x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027499,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.partition_pattern_index.12x12_srgb");
