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

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026468,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_48_bits.rgb16ui_rgb16ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026469,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_48_bits.rgb16ui_rgb16ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026470,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_48_bits.rgb16ui_rgb16ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026471,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_48_bits.rgb16ui_rgb16ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026472,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_48_bits.rgb16ui_rgb16ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026473,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_48_bits.rgb16ui_rgb16ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026474,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_48_bits.rgb16ui_rgb16ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026475,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_48_bits.rgb16ui_rgb16ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026476,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_48_bits.rgb16ui_rgb16ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026477,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_48_bits.rgb16ui_rgb16ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026478,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_48_bits.rgb16ui_rgb16ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026479,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_48_bits.rgb16ui_rgb16ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026480,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_48_bits.rgb16ui_rgb16ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026481,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_48_bits.rgb16ui_rgb16ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026482,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_48_bits.rgb16ui_rgb16ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026483,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_48_bits.rgb16ui_rgb16ui.texture2d_array_to_texture2d_array");
