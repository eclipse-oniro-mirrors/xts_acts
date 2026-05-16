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
#include "../ActsDeqpgles310027TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026806,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_rg16i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026807,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_rg16i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026808,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_rg16i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026809,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32i_rg16i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026810,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32i_rg16i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026811,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_rg16i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026812,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_rg16i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026813,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_rg16i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026814,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32i_rg16i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026815,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32i_rg16i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026816,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_rg16i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026817,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_rg16i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026818,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_32_bits.r32i_rg16i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026819,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32i_rg16i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026820,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_rg16i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026821,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32i_rg16i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026822,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32i_rg16i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026823,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32i_rg16i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026824,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r32i_rg16i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026825,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32i_rg16i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026826,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32i_rg16i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026827,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32i_rg16i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026828,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_rg16i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026829,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32i_rg16i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026830,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32i_rg16i.renderbuffer_to_renderbuffer");
