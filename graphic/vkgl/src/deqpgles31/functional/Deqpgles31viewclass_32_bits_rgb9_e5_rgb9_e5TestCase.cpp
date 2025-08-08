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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031176,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb9_e5_rgb9_e5.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031177,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb9_e5_rgb9_e5.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031178,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_rgb9_e5.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031179,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb9_e5_rgb9_e5.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031180,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb9_e5_rgb9_e5.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031181,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb9_e5_rgb9_e5.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031182,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_rgb9_e5.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031183,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb9_e5_rgb9_e5.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031184,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_rgb9_e5.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031185,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_rgb9_e5.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031186,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb9_e5_rgb9_e5.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031187,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_rgb9_e5.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031188,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb9_e5_rgb9_e5.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031189,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb9_e5_rgb9_e5.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031190,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_rgb9_e5.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031191,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb9_e5_rgb9_e5.texture2d_array_to_texture2d_array");
