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

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025684,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32i_rg32f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025685,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32i_rg32f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025686,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_64_bits.rg32i_rg32f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025687,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32i_rg32f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025688,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32i_rg32f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025689,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32i_rg32f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025690,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_64_bits.rg32i_rg32f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025691,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32i_rg32f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025692,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_64_bits.rg32i_rg32f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025693,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_64_bits.rg32i_rg32f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025694,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_64_bits.rg32i_rg32f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025695,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rg32i_rg32f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025696,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32i_rg32f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025697,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32i_rg32f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025698,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rg32i_rg32f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025699,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rg32i_rg32f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025700,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rg32i_rg32f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025701,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rg32i_rg32f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025702,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32i_rg32f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025703,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rg32i_rg32f.renderbuffer_to_texture2d_array");
