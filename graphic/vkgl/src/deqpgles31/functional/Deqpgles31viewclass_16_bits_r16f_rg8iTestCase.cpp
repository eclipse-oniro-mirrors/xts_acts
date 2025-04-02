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

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031709,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16f_rg8i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031710,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16f_rg8i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031711,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.r16f_rg8i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031712,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.r16f_rg8i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031713,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16f_rg8i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031714,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16f_rg8i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031715,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.r16f_rg8i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031716,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.r16f_rg8i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031717,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.r16f_rg8i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031718,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16f_rg8i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031719,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.r16f_rg8i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031720,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.r16f_rg8i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031721,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_16_bits.r16f_rg8i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031722,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16f_rg8i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031723,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.r16f_rg8i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031724,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.r16f_rg8i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031725,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.r16f_rg8i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031726,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.r16f_rg8i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031727,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.r16f_rg8i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310032TestSuite, TestCase_031728,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.r16f_rg8i.texture2d_array_to_renderbuffer");
