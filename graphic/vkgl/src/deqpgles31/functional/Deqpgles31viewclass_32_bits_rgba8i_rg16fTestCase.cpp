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

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028768,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rg16f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028769,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rg16f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028770,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8i_rg16f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028771,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rg16f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028772,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rg16f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028773,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rg16f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028774,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8i_rg16f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028775,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rg16f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028776,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8i_rg16f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028777,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8i_rg16f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028778,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgba8i_rg16f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028779,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8i_rg16f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028780,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rg16f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028781,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rg16f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028782,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8i_rg16f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028783,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgba8i_rg16f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028784,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8i_rg16f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028785,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8i_rg16f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028786,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rg16f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028787,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgba8i_rg16f.renderbuffer_to_texture2d_array");
