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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033067,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8_snorm_r8_snorm.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033068,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8_snorm_r8_snorm.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033069,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_snorm_r8_snorm.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033070,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_8_bits.r8_snorm_r8_snorm.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033071,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8_snorm_r8_snorm.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033072,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8_snorm_r8_snorm.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033073,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_snorm_r8_snorm.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033074,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_8_bits.r8_snorm_r8_snorm.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033075,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_snorm_r8_snorm.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033076,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_snorm_r8_snorm.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033077,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8_snorm_r8_snorm.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033078,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_8_bits.r8_snorm_r8_snorm.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033079,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_8_bits.r8_snorm_r8_snorm.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033080,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_8_bits.r8_snorm_r8_snorm.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033081,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_8_bits.r8_snorm_r8_snorm.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033082,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "8_bits.r8_snorm_r8_snorm.texture2d_array_to_texture2d_array");
