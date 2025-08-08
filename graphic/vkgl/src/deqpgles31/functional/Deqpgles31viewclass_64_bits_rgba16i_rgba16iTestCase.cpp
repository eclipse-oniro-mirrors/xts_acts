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

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026150,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16i_rgba16i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026151,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16i_rgba16i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026152,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16i_rgba16i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026153,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16i_rgba16i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026154,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16i_rgba16i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026155,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16i_rgba16i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026156,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16i_rgba16i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026157,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16i_rgba16i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026158,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16i_rgba16i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026159,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16i_rgba16i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026160,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16i_rgba16i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026161,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16i_rgba16i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026162,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rgba16i_rgba16i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026163,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16i_rgba16i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026164,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16i_rgba16i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026165,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16i_rgba16i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026166,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16i_rgba16i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026167,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16i_rgba16i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026168,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_64_bits.rgba16i_rgba16i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026169,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_64_bits.rgba16i_rgba16i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026170,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16i_rgba16i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026171,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16i_rgba16i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026172,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16i_rgba16i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026173,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_64_bits.rgba16i_rgba16i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026174,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16i_rgba16i.renderbuffer_to_renderbuffer");
