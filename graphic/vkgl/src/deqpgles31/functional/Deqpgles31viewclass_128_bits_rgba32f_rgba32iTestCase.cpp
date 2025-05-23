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

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025264,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32f_rgba32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025265,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32f_rgba32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025266,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32f_rgba32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025267,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32f_rgba32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025268,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32f_rgba32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025269,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32f_rgba32i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025270,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32f_rgba32i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025271,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32f_rgba32i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025272,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32f_rgba32i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025273,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32f_rgba32i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025274,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32f_rgba32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025275,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32f_rgba32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025276,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_128_bits.rgba32f_rgba32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025277,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32f_rgba32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025278,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32f_rgba32i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025279,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32f_rgba32i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025280,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32f_rgba32i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025281,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32f_rgba32i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025282,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "128_bits.rgba32f_rgba32i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025283,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_128_bits.rgba32f_rgba32i.texture2d_array_to_renderbuffer");
