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
#include "../ActsDeqpgles310028TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027456,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16f_rg16f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027457,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16f_rg16f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027458,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16f_rg16f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027459,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16f_rg16f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027460,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16f_rg16f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027461,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16f_rg16f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027462,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16f_rg16f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027463,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16f_rg16f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027464,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16f_rg16f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027465,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16f_rg16f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027466,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_32_bits.rg16f_rg16f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027467,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16f_rg16f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027468,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16f_rg16f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027469,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16f_rg16f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027470,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16f_rg16f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027471,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rg16f_rg16f.texture2d_array_to_texture2d_array");
