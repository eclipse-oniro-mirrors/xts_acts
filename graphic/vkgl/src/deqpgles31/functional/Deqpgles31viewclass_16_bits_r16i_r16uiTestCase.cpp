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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031810,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_r16ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031811,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_r16ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031812,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16i_r16ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031813,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16i_r16ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031814,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16i_r16ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031815,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_r16ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031816,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_r16ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031817,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16i_r16ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031818,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16i_r16ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031819,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16i_r16ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031820,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16i_r16ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031821,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16i_r16ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031822,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.r16i_r16ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031823,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.r16i_r16ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031824,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_r16ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031825,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16i_r16ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031826,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16i_r16ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031827,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.r16i_r16ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031828,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_16_bits.r16i_r16ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031829,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.r16i_r16ui.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031830,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16i_r16ui.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031831,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16i_r16ui.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031832,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_r16ui.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031833,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.r16i_r16ui.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031834,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16i_r16ui.renderbuffer_to_renderbuffer");
