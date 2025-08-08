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

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026716,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_r32f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026717,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_r32f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026718,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_32_bits.r32i_r32f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026719,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32i_r32f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026720,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_r32f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026721,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32i_r32f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026722,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_32_bits.r32i_r32f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026723,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32i_r32f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026724,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_32_bits.r32i_r32f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026725,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_32_bits.r32i_r32f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026726,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_32_bits.r32i_r32f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026727,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32i_r32f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026728,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32i_r32f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026729,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32i_r32f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026730,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32i_r32f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026731,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r32i_r32f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026732,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32i_r32f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026733,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32i_r32f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026734,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32i_r32f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026735,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32i_r32f.renderbuffer_to_texture2d_array");
