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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027346,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.void_extent_ldr.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027347,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.void_extent_ldr.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027348,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.void_extent_ldr.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027349,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.void_extent_ldr.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027350,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.void_extent_ldr.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027351,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.void_extent_ldr.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027352,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.void_extent_ldr.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027353,
        "dEQP-GLES3.functional.texture.co",
        "mpressed.astc.void_extent_ldr.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027354,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.void_extent_ldr.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027355,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.void_extent_ldr.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027356,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.void_extent_ldr.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027357,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.void_extent_ldr.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027358,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.void_extent_ldr.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027359,
        "dEQP-GLES3.functional.texture.com",
        "pressed.astc.void_extent_ldr.12x12");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027360,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.void_extent_ldr.4x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027361,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.void_extent_ldr.5x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027362,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.void_extent_ldr.5x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027363,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.void_extent_ldr.6x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027364,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.void_extent_ldr.6x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027365,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.void_extent_ldr.8x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027366,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.void_extent_ldr.8x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027367,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.void_extent_ldr.8x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027368,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.void_extent_ldr.10x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027369,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.void_extent_ldr.10x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027370,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.void_extent_ldr.10x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027371,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.void_extent_ldr.10x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027372,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.void_extent_ldr.12x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027373,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.void_extent_ldr.12x12_srgb");
