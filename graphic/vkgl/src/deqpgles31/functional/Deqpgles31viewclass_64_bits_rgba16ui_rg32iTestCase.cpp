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

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026220,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16ui_rg32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026221,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16ui_rg32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026222,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16ui_rg32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026223,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16ui_rg32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026224,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16ui_rg32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026225,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16ui_rg32i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026226,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16ui_rg32i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026227,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16ui_rg32i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026228,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16ui_rg32i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026229,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16ui_rg32i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026230,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16ui_rg32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026231,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16ui_rg32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026232,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rgba16ui_rg32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026233,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16ui_rg32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026234,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16ui_rg32i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026235,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16ui_rg32i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026236,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16ui_rg32i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026237,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16ui_rg32i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026238,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_64_bits.rgba16ui_rg32i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026239,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rgba16ui_rg32i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026240,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16ui_rg32i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026241,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16ui_rg32i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026242,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16ui_rg32i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026243,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rgba16ui_rg32i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026244,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16ui_rg32i.renderbuffer_to_renderbuffer");
