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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031465,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8_snorm_rgb8.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031466,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8_snorm_rgb8.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031467,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8_snorm_rgb8.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031468,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8_snorm_rgb8.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031469,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8_snorm_rgb8.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031470,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8_snorm_rgb8.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031471,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_24_bits.rgb8_snorm_rgb8.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031472,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8_snorm_rgb8.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031473,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8_snorm_rgb8.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031474,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8_snorm_rgb8.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031475,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8_snorm_rgb8.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031476,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_24_bits.rgb8_snorm_rgb8.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031477,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_24_bits.rgb8_snorm_rgb8.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031478,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8_snorm_rgb8.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031479,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8_snorm_rgb8.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031480,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8_snorm_rgb8.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031481,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8_snorm_rgb8.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031482,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8_snorm_rgb8.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031483,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_24_bits.rgb8_snorm_rgb8.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031484,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_24_bits.rgb8_snorm_rgb8.texture2d_array_to_renderbuffer");
