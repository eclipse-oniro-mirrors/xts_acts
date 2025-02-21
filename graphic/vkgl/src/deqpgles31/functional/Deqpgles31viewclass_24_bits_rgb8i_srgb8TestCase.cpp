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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031365,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8i_srgb8.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031366,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8i_srgb8.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031367,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.rgb8i_srgb8.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031368,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8i_srgb8.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031369,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8i_srgb8.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031370,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8i_srgb8.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031371,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.rgb8i_srgb8.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031372,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8i_srgb8.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031373,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.rgb8i_srgb8.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031374,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.rgb8i_srgb8.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031375,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_24_bits.rgb8i_srgb8.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031376,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8i_srgb8.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031377,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8i_srgb8.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031378,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8i_srgb8.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031379,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8i_srgb8.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031380,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8i_srgb8.texture2d_array_to_texture2d_array");
