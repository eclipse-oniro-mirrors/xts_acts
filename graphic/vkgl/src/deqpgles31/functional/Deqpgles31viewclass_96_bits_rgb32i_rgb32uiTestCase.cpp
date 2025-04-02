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
#include "../ActsDeqpgles310026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025524,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_96_bits.rgb32i_rgb32ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025525,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_96_bits.rgb32i_rgb32ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025526,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_96_bits.rgb32i_rgb32ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025527,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_96_bits.rgb32i_rgb32ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025528,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_96_bits.rgb32i_rgb32ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025529,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_96_bits.rgb32i_rgb32ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025530,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_96_bits.rgb32i_rgb32ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025531,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_96_bits.rgb32i_rgb32ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025532,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_96_bits.rgb32i_rgb32ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025533,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_96_bits.rgb32i_rgb32ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025534,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_96_bits.rgb32i_rgb32ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025535,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_96_bits.rgb32i_rgb32ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025536,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_96_bits.rgb32i_rgb32ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025537,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_96_bits.rgb32i_rgb32ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025538,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_96_bits.rgb32i_rgb32ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025539,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_96_bits.rgb32i_rgb32ui.texture2d_array_to_texture2d_array");
