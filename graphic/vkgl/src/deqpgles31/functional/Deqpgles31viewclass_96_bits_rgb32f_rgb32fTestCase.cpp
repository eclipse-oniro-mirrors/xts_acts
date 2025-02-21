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
#include "../ActsDeqpgles310026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025444,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_96_bits.rgb32f_rgb32f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025445,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_96_bits.rgb32f_rgb32f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025446,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_96_bits.rgb32f_rgb32f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025447,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_96_bits.rgb32f_rgb32f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025448,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_96_bits.rgb32f_rgb32f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025449,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_96_bits.rgb32f_rgb32f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025450,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_96_bits.rgb32f_rgb32f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025451,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_96_bits.rgb32f_rgb32f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025452,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_96_bits.rgb32f_rgb32f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025453,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_96_bits.rgb32f_rgb32f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025454,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_96_bits.rgb32f_rgb32f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025455,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_96_bits.rgb32f_rgb32f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025456,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_96_bits.rgb32f_rgb32f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025457,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_96_bits.rgb32f_rgb32f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025458,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_96_bits.rgb32f_rgb32f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025459,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_96_bits.rgb32f_rgb32f.texture2d_array_to_texture2d_array");
