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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310032TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031549,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.srgb8_rgb8.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031550,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.srgb8_rgb8.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031551,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.srgb8_rgb8.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031552,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.srgb8_rgb8.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031553,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.srgb8_rgb8.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031554,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.srgb8_rgb8.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031555,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.srgb8_rgb8.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031556,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.srgb8_rgb8.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031557,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.srgb8_rgb8.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031558,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.srgb8_rgb8.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031559,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.srgb8_rgb8.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031560,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.srgb8_rgb8.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031561,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_24_bits.srgb8_rgb8.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031562,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.srgb8_rgb8.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031563,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.srgb8_rgb8.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031564,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.srgb8_rgb8.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031565,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.srgb8_rgb8.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031566,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.srgb8_rgb8.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031567,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.srgb8_rgb8.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031568,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.srgb8_rgb8.texture2d_array_to_renderbuffer");
