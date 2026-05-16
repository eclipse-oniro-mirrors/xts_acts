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
#include "../ActsDeqpgles310026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025644,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32f_rgba16i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025645,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32f_rgba16i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025646,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32f_rgba16i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025647,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rg32f_rgba16i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025648,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32f_rgba16i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025649,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32f_rgba16i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025650,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32f_rgba16i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025651,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32f_rgba16i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025652,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rg32f_rgba16i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025653,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32f_rgba16i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025654,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32f_rgba16i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025655,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32f_rgba16i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025656,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_64_bits.rg32f_rgba16i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025657,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32f_rgba16i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025658,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rg32f_rgba16i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025659,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rg32f_rgba16i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025660,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rg32f_rgba16i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025661,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32f_rgba16i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025662,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_64_bits.rg32f_rgba16i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025663,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rg32f_rgba16i.texture2d_array_to_renderbuffer");
