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

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026040,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16f_rgba16ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026041,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16f_rgba16ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026042,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16f_rgba16ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026043,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rgba16f_rgba16ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026044,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16f_rgba16ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026045,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16f_rgba16ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026046,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16f_rgba16ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026047,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16f_rgba16ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026048,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rgba16f_rgba16ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026049,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16f_rgba16ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026050,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16f_rgba16ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026051,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16f_rgba16ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026052,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16f_rgba16ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026053,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16f_rgba16ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026054,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16f_rgba16ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026055,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rgba16f_rgba16ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026056,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rgba16f_rgba16ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026057,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16f_rgba16ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026058,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "64_bits.rgba16f_rgba16ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026059,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_64_bits.rgba16f_rgba16ui.texture2d_array_to_renderbuffer");
