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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027640,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.block_size_remainder.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027641,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.block_size_remainder.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027642,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.block_size_remainder.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027643,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.block_size_remainder.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027644,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.block_size_remainder.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027645,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.block_size_remainder.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027646,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.block_size_remainder.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027647,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.block_size_remainder.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027648,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.block_size_remainder.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027649,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.block_size_remainder.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027650,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.block_size_remainder.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027651,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.block_size_remainder.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027652,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.block_size_remainder.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027653,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.block_size_remainder.12x12");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027654,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.block_size_remainder.4x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027655,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.block_size_remainder.5x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027656,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.block_size_remainder.5x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027657,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.block_size_remainder.6x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027658,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.block_size_remainder.6x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027659,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.block_size_remainder.8x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027660,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.block_size_remainder.8x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027661,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.block_size_remainder.8x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027662,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.block_size_remainder.10x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027663,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.block_size_remainder.10x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027664,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.block_size_remainder.10x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027665,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.block_size_remainder.10x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027666,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.block_size_remainder.12x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027667,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.block_size_remainder.12x12_srgb");
