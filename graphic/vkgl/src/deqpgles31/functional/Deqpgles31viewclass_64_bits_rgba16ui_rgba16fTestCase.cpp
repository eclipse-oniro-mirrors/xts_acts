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

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026270,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16ui_rgba16f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026271,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16ui_rgba16f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026272,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16ui_rgba16f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026273,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rgba16ui_rgba16f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026274,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16ui_rgba16f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026275,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16ui_rgba16f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026276,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16ui_rgba16f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026277,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rgba16ui_rgba16f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026278,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16ui_rgba16f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026279,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16ui_rgba16f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026280,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16ui_rgba16f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026281,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16ui_rgba16f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026282,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rgba16ui_rgba16f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026283,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rgba16ui_rgba16f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026284,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16ui_rgba16f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026285,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "64_bits.rgba16ui_rgba16f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026286,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16ui_rgba16f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026287,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16ui_rgba16f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026288,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16ui_rgba16f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026289,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_64_bits.rgba16ui_rgba16f.renderbuffer_to_texture2d_array");
