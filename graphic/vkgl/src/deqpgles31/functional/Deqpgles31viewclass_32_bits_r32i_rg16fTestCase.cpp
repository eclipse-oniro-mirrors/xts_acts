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

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026786,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_rg16f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026787,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_rg16f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026788,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_rg16f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026789,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32i_rg16f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026790,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_rg16f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026791,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_rg16f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026792,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_rg16f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026793,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32i_rg16f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026794,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_rg16f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026795,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_rg16f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026796,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_32_bits.r32i_rg16f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026797,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32i_rg16f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026798,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32i_rg16f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026799,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32i_rg16f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026800,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32i_rg16f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026801,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r32i_rg16f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026802,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32i_rg16f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026803,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32i_rg16f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026804,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_rg16f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026805,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32i_rg16f.renderbuffer_to_texture2d_array");
