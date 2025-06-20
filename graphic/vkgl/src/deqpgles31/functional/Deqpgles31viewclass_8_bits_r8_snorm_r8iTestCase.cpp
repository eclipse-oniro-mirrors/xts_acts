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
#include "../ActsDeqpgles310034TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033027,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8_snorm_r8i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033028,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8_snorm_r8i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033029,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_snorm_r8i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033030,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8_snorm_r8i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033031,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_snorm_r8i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033032,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8_snorm_r8i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033033,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8_snorm_r8i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033034,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_snorm_r8i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033035,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8_snorm_r8i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033036,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_snorm_r8i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033037,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_snorm_r8i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033038,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_snorm_r8i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033039,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8_snorm_r8i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033040,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_snorm_r8i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033041,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8_snorm_r8i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033042,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8_snorm_r8i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033043,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8_snorm_r8i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033044,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_snorm_r8i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033045,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_8_bits.r8_snorm_r8i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033046,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_8_bits.r8_snorm_r8i.texture2d_array_to_renderbuffer");
