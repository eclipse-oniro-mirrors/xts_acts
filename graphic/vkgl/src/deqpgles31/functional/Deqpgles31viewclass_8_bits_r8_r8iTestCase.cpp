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

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032747,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8_r8i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032748,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8_r8i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032749,
        "dEQP-GLES31.functional.copy_image.non_compress",
        "ed.viewclass_8_bits.r8_r8i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032750,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8_r8i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032751,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_r8i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032752,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8_r8i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032753,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8_r8i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032754,
        "dEQP-GLES31.functional.copy_image.non_compress",
        "ed.viewclass_8_bits.r8_r8i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032755,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8_r8i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032756,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_r8i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032757,
        "dEQP-GLES31.functional.copy_image.non_compress",
        "ed.viewclass_8_bits.r8_r8i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032758,
        "dEQP-GLES31.functional.copy_image.non_compress",
        "ed.viewclass_8_bits.r8_r8i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032759,
        "dEQP-GLES31.functional.copy_image.non_compres",
        "sed.viewclass_8_bits.r8_r8i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032760,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_r8i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032761,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8_r8i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032762,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8_r8i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032763,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8_r8i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032764,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_r8i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032765,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8_r8i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032766,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_r8i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032767,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_r8i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032768,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_r8i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032769,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8_r8i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032770,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_r8i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032771,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8_r8i.renderbuffer_to_renderbuffer");
