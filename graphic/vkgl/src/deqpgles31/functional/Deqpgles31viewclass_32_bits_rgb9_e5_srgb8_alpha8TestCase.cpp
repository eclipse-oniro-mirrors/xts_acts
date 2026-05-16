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
#include "../ActsDeqpgles310032TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031156,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb9_e5_srgb8_alpha8.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031157,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb9_e5_srgb8_alpha8.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031158,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_srgb8_alpha8.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031159,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb9_e5_srgb8_alpha8.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031160,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb9_e5_srgb8_alpha8.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031161,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb9_e5_srgb8_alpha8.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031162,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb9_e5_srgb8_alpha8.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031163,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_srgb8_alpha8.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031164,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb9_e5_srgb8_alpha8.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031165,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb9_e5_srgb8_alpha8.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031166,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_srgb8_alpha8.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031167,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_srgb8_alpha8.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031168,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb9_e5_srgb8_alpha8.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031169,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb9_e5_srgb8_alpha8.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031170,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb9_e5_srgb8_alpha8.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031171,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb9_e5_srgb8_alpha8.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031172,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb9_e5_srgb8_alpha8.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031173,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb9_e5_srgb8_alpha8.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031174,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32",
        "_bits.rgb9_e5_srgb8_alpha8.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031175,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.rgb9_e5_srgb8_alpha8.texture2d_array_to_renderbuffer");
