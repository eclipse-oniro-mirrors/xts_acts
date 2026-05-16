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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027444,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.color_endpoint_modes.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027445,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.color_endpoint_modes.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027446,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.color_endpoint_modes.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027447,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.color_endpoint_modes.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027448,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.color_endpoint_modes.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027449,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.color_endpoint_modes.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027450,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.color_endpoint_modes.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027451,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.color_endpoint_modes.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027452,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.color_endpoint_modes.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027453,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.color_endpoint_modes.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027454,
        "dEQP-GLES3.functional.texture.compr",
        "essed.astc.color_endpoint_modes.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027455,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.color_endpoint_modes.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027456,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.color_endpoint_modes.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027457,
        "dEQP-GLES3.functional.texture.compre",
        "ssed.astc.color_endpoint_modes.12x12");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027458,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_endpoint_modes.4x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027459,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_endpoint_modes.5x4_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027460,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_endpoint_modes.5x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027461,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_endpoint_modes.6x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027462,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_endpoint_modes.6x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027463,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_endpoint_modes.8x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027464,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_endpoint_modes.8x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027465,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.color_endpoint_modes.8x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027466,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.color_endpoint_modes.10x5_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027467,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.color_endpoint_modes.10x6_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027468,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.color_endpoint_modes.10x8_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027469,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.color_endpoint_modes.10x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027470,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.color_endpoint_modes.12x10_srgb");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027471,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.color_endpoint_modes.12x12_srgb");
