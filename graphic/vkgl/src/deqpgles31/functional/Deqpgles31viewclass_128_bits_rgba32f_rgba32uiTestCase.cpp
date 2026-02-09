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

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025284,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32f_rgba32ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025285,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32f_rgba32ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025286,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32f_rgba32ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025287,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32f_rgba32ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025288,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32f_rgba32ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025289,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32f_rgba32ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025290,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32f_rgba32ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025291,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32f_rgba32ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025292,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32f_rgba32ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025293,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32f_rgba32ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025294,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32f_rgba32ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025295,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32f_rgba32ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025296,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_128_bits.rgba32f_rgba32ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025297,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32f_rgba32ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025298,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32f_rgba32ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025299,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32f_rgba32ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025300,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32f_rgba32ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025301,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32f_rgba32ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025302,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "128_bits.rgba32f_rgba32ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025303,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_128_bits.rgba32f_rgba32ui.texture2d_array_to_renderbuffer");
