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

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032666,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8_snorm_rg8i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032667,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8_snorm_rg8i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032668,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8_snorm_rg8i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032669,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8_snorm_rg8i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032670,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.rg8_snorm_rg8i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032671,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8_snorm_rg8i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032672,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8_snorm_rg8i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032673,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8_snorm_rg8i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032674,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8_snorm_rg8i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032675,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.rg8_snorm_rg8i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032676,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8_snorm_rg8i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032677,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8_snorm_rg8i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032678,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.rg8_snorm_rg8i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032679,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8_snorm_rg8i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032680,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8_snorm_rg8i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032681,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8_snorm_rg8i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032682,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8_snorm_rg8i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032683,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8_snorm_rg8i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032684,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_16_bits.rg8_snorm_rg8i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032685,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_16_bits.rg8_snorm_rg8i.texture2d_array_to_renderbuffer");
