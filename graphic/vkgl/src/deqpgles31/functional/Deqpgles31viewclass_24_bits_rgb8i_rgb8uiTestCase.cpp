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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031333,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8i_rgb8ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031334,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8i_rgb8ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031335,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8i_rgb8ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031336,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8i_rgb8ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031337,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8i_rgb8ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031338,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8i_rgb8ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031339,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8i_rgb8ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031340,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8i_rgb8ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031341,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8i_rgb8ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031342,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8i_rgb8ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031343,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.rgb8i_rgb8ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031344,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8i_rgb8ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031345,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8i_rgb8ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031346,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8i_rgb8ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031347,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8i_rgb8ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031348,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_24_bits.rgb8i_rgb8ui.texture2d_array_to_texture2d_array");
