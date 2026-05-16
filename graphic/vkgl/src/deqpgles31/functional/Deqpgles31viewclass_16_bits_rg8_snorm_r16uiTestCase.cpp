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

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032626,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8_snorm_r16ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032627,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8_snorm_r16ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032628,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8_snorm_r16ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032629,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8_snorm_r16ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032630,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8_snorm_r16ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032631,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8_snorm_r16ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032632,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8_snorm_r16ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032633,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8_snorm_r16ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032634,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8_snorm_r16ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032635,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8_snorm_r16ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032636,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8_snorm_r16ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032637,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8_snorm_r16ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032638,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.rg8_snorm_r16ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032639,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8_snorm_r16ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032640,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.rg8_snorm_r16ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032641,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8_snorm_r16ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032642,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8_snorm_r16ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032643,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8_snorm_r16ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032644,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_16_bits.rg8_snorm_r16ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032645,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_16_bits.rg8_snorm_r16ui.texture2d_array_to_renderbuffer");
