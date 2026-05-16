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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031930,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16ui_r16f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031931,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16ui_r16f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031932,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16ui_r16f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031933,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16ui_r16f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031934,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16ui_r16f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031935,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16ui_r16f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031936,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16ui_r16f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031937,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16ui_r16f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031938,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16ui_r16f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031939,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16ui_r16f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031940,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.r16ui_r16f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031941,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.r16ui_r16f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031942,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16ui_r16f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031943,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.r16ui_r16f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031944,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.r16ui_r16f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031945,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_16_bits.r16ui_r16f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031946,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16ui_r16f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031947,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16ui_r16f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031948,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16ui_r16f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031949,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.r16ui_r16f.renderbuffer_to_texture2d_array");
