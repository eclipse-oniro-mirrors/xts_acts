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
#include "../ActsDeqpgles310033TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032892,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8i_r8_snorm.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032893,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8i_r8_snorm.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032894,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8i_r8_snorm.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032895,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8i_r8_snorm.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032896,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8i_r8_snorm.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032897,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8i_r8_snorm.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032898,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8i_r8_snorm.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032899,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8i_r8_snorm.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032900,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8i_r8_snorm.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032901,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8i_r8_snorm.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032902,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8i_r8_snorm.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032903,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8i_r8_snorm.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032904,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8i_r8_snorm.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032905,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8i_r8_snorm.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032906,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8i_r8_snorm.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032907,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_8_bits.r8i_r8_snorm.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032908,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8i_r8_snorm.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032909,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8i_r8_snorm.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032910,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8i_r8_snorm.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032911,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_8_bits.r8i_r8_snorm.renderbuffer_to_texture2d_array");
