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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031433,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8ui_rgb8_snorm.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031434,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8ui_rgb8_snorm.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031435,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8ui_rgb8_snorm.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031436,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8ui_rgb8_snorm.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031437,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8ui_rgb8_snorm.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031438,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8ui_rgb8_snorm.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031439,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8ui_rgb8_snorm.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031440,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8ui_rgb8_snorm.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031441,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8ui_rgb8_snorm.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031442,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8ui_rgb8_snorm.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031443,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8ui_rgb8_snorm.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031444,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8ui_rgb8_snorm.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031445,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8ui_rgb8_snorm.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031446,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8ui_rgb8_snorm.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031447,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8ui_rgb8_snorm.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031448,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "24_bits.rgb8ui_rgb8_snorm.texture2d_array_to_texture2d_array");