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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031349,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8i_rgb8_snorm.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031350,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8i_rgb8_snorm.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031351,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8i_rgb8_snorm.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031352,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8i_rgb8_snorm.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031353,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8i_rgb8_snorm.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031354,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8i_rgb8_snorm.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031355,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8i_rgb8_snorm.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031356,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8i_rgb8_snorm.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031357,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8i_rgb8_snorm.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031358,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8i_rgb8_snorm.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031359,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8i_rgb8_snorm.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031360,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8i_rgb8_snorm.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031361,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8i_rgb8_snorm.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031362,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_24_bits.rgb8i_rgb8_snorm.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031363,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8i_rgb8_snorm.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031364,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "24_bits.rgb8i_rgb8_snorm.texture2d_array_to_texture2d_array");
