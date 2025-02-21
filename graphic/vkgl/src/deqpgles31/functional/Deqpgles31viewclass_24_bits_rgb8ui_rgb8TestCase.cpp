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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031381,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8ui_rgb8.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031382,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8ui_rgb8.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031383,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.rgb8ui_rgb8.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031384,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8ui_rgb8.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031385,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8ui_rgb8.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031386,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8ui_rgb8.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031387,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8ui_rgb8.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031388,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.rgb8ui_rgb8.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031389,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8ui_rgb8.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031390,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8ui_rgb8.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031391,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.rgb8ui_rgb8.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031392,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_24_bits.rgb8ui_rgb8.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031393,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_24_bits.rgb8ui_rgb8.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031394,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8ui_rgb8.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031395,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8ui_rgb8.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031396,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8ui_rgb8.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031397,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8ui_rgb8.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031398,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8ui_rgb8.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031399,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8ui_rgb8.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031400,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8ui_rgb8.texture2d_array_to_renderbuffer");
