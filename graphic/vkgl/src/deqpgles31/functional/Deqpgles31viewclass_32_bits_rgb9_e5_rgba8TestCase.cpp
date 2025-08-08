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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031040,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_rgba8.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031041,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_rgba8.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031042,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb9_e5_rgba8.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031043,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_rgba8.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031044,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb9_e5_rgba8.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031045,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_rgba8.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031046,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_rgba8.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031047,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb9_e5_rgba8.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031048,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_rgba8.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031049,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb9_e5_rgba8.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031050,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb9_e5_rgba8.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031051,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb9_e5_rgba8.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031052,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgb9_e5_rgba8.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031053,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb9_e5_rgba8.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031054,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb9_e5_rgba8.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031055,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_rgba8.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031056,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_rgba8.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031057,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb9_e5_rgba8.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031058,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb9_e5_rgba8.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031059,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb9_e5_rgba8.texture2d_array_to_renderbuffer");
