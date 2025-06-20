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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031501,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8_snorm_rgb8ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031502,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8_snorm_rgb8ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031503,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8_snorm_rgb8ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031504,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8_snorm_rgb8ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031505,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8_snorm_rgb8ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031506,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8_snorm_rgb8ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031507,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8_snorm_rgb8ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031508,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8_snorm_rgb8ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031509,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8_snorm_rgb8ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031510,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8_snorm_rgb8ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031511,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8_snorm_rgb8ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031512,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8_snorm_rgb8ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031513,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8_snorm_rgb8ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031514,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8_snorm_rgb8ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031515,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8_snorm_rgb8ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031516,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "24_bits.rgb8_snorm_rgb8ui.texture2d_array_to_texture2d_array");
