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
#include "../ActsDeqpgles310030TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029028,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8i_rgb9_e5.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029029,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8i_rgb9_e5.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029030,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rgb9_e5.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029031,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgba8i_rgb9_e5.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029032,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8i_rgb9_e5.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029033,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8i_rgb9_e5.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029034,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rgb9_e5.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029035,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgba8i_rgb9_e5.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029036,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rgb9_e5.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029037,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rgb9_e5.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029038,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8i_rgb9_e5.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029039,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rgb9_e5.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029040,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgba8i_rgb9_e5.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029041,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgba8i_rgb9_e5.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029042,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rgb9_e5.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029043,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgba8i_rgb9_e5.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029044,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8i_rgb9_e5.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029045,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8i_rgb9_e5.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029046,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8i_rgb9_e5.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029047,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgba8i_rgb9_e5.renderbuffer_to_texture2d_array");
