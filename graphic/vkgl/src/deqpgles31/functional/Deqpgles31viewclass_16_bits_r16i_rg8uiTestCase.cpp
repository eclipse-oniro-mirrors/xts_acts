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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031885,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_rg8ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031886,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_rg8ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031887,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16i_rg8ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031888,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16i_rg8ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031889,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16i_rg8ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031890,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_rg8ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031891,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_rg8ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031892,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16i_rg8ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031893,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16i_rg8ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031894,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16i_rg8ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031895,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16i_rg8ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031896,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16i_rg8ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031897,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.r16i_rg8ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031898,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.r16i_rg8ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031899,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_rg8ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031900,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16i_rg8ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031901,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16i_rg8ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031902,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.r16i_rg8ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031903,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_16_bits.r16i_rg8ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031904,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.r16i_rg8ui.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031905,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16i_rg8ui.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031906,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16i_rg8ui.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031907,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16i_rg8ui.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031908,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.r16i_rg8ui.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031909,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16i_rg8ui.renderbuffer_to_renderbuffer");
