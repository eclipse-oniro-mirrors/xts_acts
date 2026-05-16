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

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025664,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rg32f_rgba16ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025665,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rg32f_rgba16ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025666,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32f_rgba16ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025667,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rg32f_rgba16ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025668,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32f_rgba16ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025669,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rg32f_rgba16ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025670,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rg32f_rgba16ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025671,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32f_rgba16ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025672,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rg32f_rgba16ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025673,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rg32f_rgba16ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025674,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32f_rgba16ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025675,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rg32f_rgba16ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025676,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rg32f_rgba16ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025677,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rg32f_rgba16ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025678,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rg32f_rgba16ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025679,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rg32f_rgba16ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025680,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rg32f_rgba16ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025681,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rg32f_rgba16ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025682,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_64_bits.rg32f_rgba16ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025683,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_64_bits.rg32f_rgba16ui.texture2d_array_to_renderbuffer");
