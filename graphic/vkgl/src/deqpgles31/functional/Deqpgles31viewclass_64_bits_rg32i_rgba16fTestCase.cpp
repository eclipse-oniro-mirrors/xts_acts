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

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025754,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32i_rgba16f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025755,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32i_rgba16f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025756,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32i_rgba16f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025757,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rg32i_rgba16f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025758,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32i_rgba16f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025759,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32i_rgba16f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025760,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32i_rgba16f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025761,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rg32i_rgba16f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025762,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32i_rgba16f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025763,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32i_rgba16f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025764,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_64_bits.rg32i_rgba16f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025765,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32i_rgba16f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025766,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rg32i_rgba16f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025767,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rg32i_rgba16f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025768,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32i_rgba16f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025769,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_64_bits.rg32i_rgba16f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025770,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32i_rgba16f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025771,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32i_rgba16f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025772,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rg32i_rgba16f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025773,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rg32i_rgba16f.renderbuffer_to_texture2d_array");
