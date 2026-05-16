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

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025394,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32ui_rgba32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025395,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32ui_rgba32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025396,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32ui_rgba32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025397,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32ui_rgba32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025398,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32ui_rgba32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025399,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32ui_rgba32i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025400,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32ui_rgba32i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025401,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32ui_rgba32i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025402,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32ui_rgba32i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025403,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32ui_rgba32i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025404,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32ui_rgba32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025405,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32ui_rgba32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025406,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_128_bits.rgba32ui_rgba32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025407,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32ui_rgba32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025408,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32ui_rgba32i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025409,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32ui_rgba32i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025410,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32ui_rgba32i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025411,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32ui_rgba32i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025412,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "128_bits.rgba32ui_rgba32i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025413,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_128_bits.rgba32ui_rgba32i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025414,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32ui_rgba32i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025415,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32ui_rgba32i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025416,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32ui_rgba32i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025417,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_128_bits.rgba32ui_rgba32i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025418,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32ui_rgba32i.renderbuffer_to_renderbuffer");
