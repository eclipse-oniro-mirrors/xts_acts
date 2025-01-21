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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031617,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.srgb8_srgb8.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031618,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.srgb8_srgb8.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031619,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.srgb8_srgb8.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031620,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.srgb8_srgb8.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031621,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.srgb8_srgb8.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031622,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.srgb8_srgb8.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031623,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.srgb8_srgb8.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031624,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.srgb8_srgb8.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031625,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.srgb8_srgb8.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031626,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.srgb8_srgb8.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031627,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_24_bits.srgb8_srgb8.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031628,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.srgb8_srgb8.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031629,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.srgb8_srgb8.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031630,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.srgb8_srgb8.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031631,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.srgb8_srgb8.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031632,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.srgb8_srgb8.texture2d_array_to_texture2d_array");
