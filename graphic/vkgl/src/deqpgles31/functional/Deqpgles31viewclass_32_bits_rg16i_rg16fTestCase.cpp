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

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027718,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16i_rg16f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027719,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16i_rg16f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027720,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16i_rg16f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027721,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16i_rg16f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027722,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16i_rg16f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027723,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16i_rg16f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027724,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16i_rg16f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027725,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16i_rg16f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027726,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16i_rg16f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027727,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16i_rg16f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027728,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_32_bits.rg16i_rg16f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027729,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16i_rg16f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027730,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16i_rg16f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027731,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16i_rg16f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027732,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16i_rg16f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027733,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rg16i_rg16f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027734,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16i_rg16f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027735,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16i_rg16f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027736,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rg16i_rg16f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027737,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rg16i_rg16f.renderbuffer_to_texture2d_array");
