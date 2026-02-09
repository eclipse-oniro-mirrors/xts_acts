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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031517,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8_snorm_rgb8_snorm.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031518,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8_snorm_rgb8_snorm.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031519,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8_snorm_rgb8_snorm.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031520,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_24_bits.rgb8_snorm_rgb8_snorm.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031521,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8_snorm_rgb8_snorm.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031522,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_24_bits.rgb8_snorm_rgb8_snorm.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031523,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8_snorm_rgb8_snorm.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031524,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_24_bits.rgb8_snorm_rgb8_snorm.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031525,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8_snorm_rgb8_snorm.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031526,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_24_bits.rgb8_snorm_rgb8_snorm.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031527,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_24_bits.rgb8_snorm_rgb8_snorm.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031528,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_24_bits.rgb8_snorm_rgb8_snorm.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031529,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_24_bits.rgb8_snorm_rgb8_snorm.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031530,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_24_bits.rgb8_snorm_rgb8_snorm.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031531,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_24_bits.rgb8_snorm_rgb8_snorm.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031532,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_24",
        "_bits.rgb8_snorm_rgb8_snorm.texture2d_array_to_texture2d_array");
