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

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032405,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8i_rg8_snorm.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032406,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8i_rg8_snorm.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032407,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8i_rg8_snorm.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032408,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8i_rg8_snorm.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032409,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8i_rg8_snorm.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032410,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8i_rg8_snorm.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032411,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8i_rg8_snorm.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032412,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8i_rg8_snorm.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032413,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8i_rg8_snorm.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032414,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8i_rg8_snorm.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032415,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.rg8i_rg8_snorm.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032416,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8i_rg8_snorm.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032417,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8i_rg8_snorm.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032418,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8i_rg8_snorm.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032419,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8i_rg8_snorm.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032420,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_16_bits.rg8i_rg8_snorm.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032421,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.rg8i_rg8_snorm.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032422,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.rg8i_rg8_snorm.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032423,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8i_rg8_snorm.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032424,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_16_bits.rg8i_rg8_snorm.renderbuffer_to_texture2d_array");
