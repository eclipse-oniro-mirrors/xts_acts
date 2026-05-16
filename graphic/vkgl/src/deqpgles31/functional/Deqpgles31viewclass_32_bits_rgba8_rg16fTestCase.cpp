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
#include "../ActsDeqpgles310029TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028418,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8_rg16f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028419,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8_rg16f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028420,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgba8_rg16f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028421,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8_rg16f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028422,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8_rg16f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028423,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8_rg16f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028424,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgba8_rg16f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028425,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8_rg16f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028426,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgba8_rg16f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028427,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgba8_rg16f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028428,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_32_bits.rgba8_rg16f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028429,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8_rg16f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028430,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8_rg16f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028431,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8_rg16f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028432,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8_rg16f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028433,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgba8_rg16f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028434,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8_rg16f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028435,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8_rg16f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028436,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8_rg16f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028437,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgba8_rg16f.renderbuffer_to_texture2d_array");
