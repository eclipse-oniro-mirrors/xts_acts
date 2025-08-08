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
#include "../ActsDeqpgles310028TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027416,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16f_r32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027417,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16f_r32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027418,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16f_r32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027419,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16f_r32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027420,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rg16f_r32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027421,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16f_r32i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027422,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16f_r32i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027423,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16f_r32i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027424,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16f_r32i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027425,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rg16f_r32i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027426,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16f_r32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027427,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16f_r32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027428,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_32_bits.rg16f_r32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027429,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16f_r32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027430,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16f_r32i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027431,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16f_r32i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027432,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16f_r32i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027433,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16f_r32i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027434,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rg16f_r32i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027435,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16f_r32i.texture2d_array_to_renderbuffer");
