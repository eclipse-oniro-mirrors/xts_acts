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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027500,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_value_ldr.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027501,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_value_ldr.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027502,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_value_ldr.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027503,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_value_ldr.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027504,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_value_ldr.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027505,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_value_ldr.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027506,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_value_ldr.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027507,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_value_ldr.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027508,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_value_ldr.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027509,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_value_ldr.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027510,
        "dEQP-GLES3.functional.texture.comp",
        "ressed.astc.endpoint_value_ldr.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027511,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.endpoint_value_ldr.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027512,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.endpoint_value_ldr.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027513,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.endpoint_value_ldr.12x12");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027514,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.endpoint_value_ldr.4x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027515,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.endpoint_value_ldr.5x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027516,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.endpoint_value_ldr.5x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027517,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.endpoint_value_ldr.6x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027518,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.endpoint_value_ldr.6x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027519,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.endpoint_value_ldr.8x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027520,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.endpoint_value_ldr.8x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027521,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.endpoint_value_ldr.8x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027522,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_ldr.10x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027523,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_ldr.10x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027524,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_ldr.10x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027525,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_ldr.10x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027526,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_ldr.12x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027527,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_ldr.12x12_srgb");
