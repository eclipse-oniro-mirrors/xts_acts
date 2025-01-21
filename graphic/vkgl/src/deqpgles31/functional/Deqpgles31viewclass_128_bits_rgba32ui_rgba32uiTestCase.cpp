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

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025419,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32ui_rgba32ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025420,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32ui_rgba32ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025421,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32ui_rgba32ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025422,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_128_bits.rgba32ui_rgba32ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025423,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32ui_rgba32ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025424,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32ui_rgba32ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025425,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32ui_rgba32ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025426,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32ui_rgba32ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025427,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_128_bits.rgba32ui_rgba32ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025428,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32ui_rgba32ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025429,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32ui_rgba32ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025430,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32ui_rgba32ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025431,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32ui_rgba32ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025432,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32ui_rgba32ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025433,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32ui_rgba32ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025434,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_128_bits.rgba32ui_rgba32ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025435,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_128_bits.rgba32ui_rgba32ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025436,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32ui_rgba32ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025437,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_1",
        "28_bits.rgba32ui_rgba32ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025438,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_128_bits.rgba32ui_rgba32ui.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025439,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32ui_rgba32ui.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025440,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32ui_rgba32ui.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025441,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32ui_rgba32ui.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025442,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_128_bits.rgba32ui_rgba32ui.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025443,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_128_bits.rgba32ui_rgba32ui.renderbuffer_to_renderbuffer");
