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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016067,
        "dEQP-GLES31.functional.state_query.internal_f",
        "ormat.texture_2d_multisample_array.r8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016068,
        "dEQP-GLES31.functional.state_query.internal_f",
        "ormat.texture_2d_multisample_array.rg8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016069,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.rgb8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016070,
        "dEQP-GLES31.functional.state_query.internal_for",
        "mat.texture_2d_multisample_array.rgb565_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016071,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.rgba4_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016072,
        "dEQP-GLES31.functional.state_query.internal_for",
        "mat.texture_2d_multisample_array.rgb5_a1_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016073,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.rgba8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016074,
        "dEQP-GLES31.functional.state_query.internal_form",
        "at.texture_2d_multisample_array.rgb10_a2_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016075,
        "dEQP-GLES31.functional.state_query.internal_forma",
        "t.texture_2d_multisample_array.rgb10_a2ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016076,
        "dEQP-GLES31.functional.state_query.internal_format",
        ".texture_2d_multisample_array.srgb8_alpha8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016077,
        "dEQP-GLES31.functional.state_query.internal_f",
        "ormat.texture_2d_multisample_array.r8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016078,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.r8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016079,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.r16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016080,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.r16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016081,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.r32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016082,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.r32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016083,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.rg8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016084,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.rg8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016085,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.rg16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016086,
        "dEQP-GLES31.functional.state_query.internal_for",
        "mat.texture_2d_multisample_array.rg16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016087,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.rg32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016088,
        "dEQP-GLES31.functional.state_query.internal_for",
        "mat.texture_2d_multisample_array.rg32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016089,
        "dEQP-GLES31.functional.state_query.internal_for",
        "mat.texture_2d_multisample_array.rgba8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016090,
        "dEQP-GLES31.functional.state_query.internal_for",
        "mat.texture_2d_multisample_array.rgba8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016091,
        "dEQP-GLES31.functional.state_query.internal_for",
        "mat.texture_2d_multisample_array.rgba16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016092,
        "dEQP-GLES31.functional.state_query.internal_form",
        "at.texture_2d_multisample_array.rgba16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016093,
        "dEQP-GLES31.functional.state_query.internal_for",
        "mat.texture_2d_multisample_array.rgba32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016094,
        "dEQP-GLES31.functional.state_query.internal_form",
        "at.texture_2d_multisample_array.rgba32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016095,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.r16f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016096,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.rg16f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016097,
        "dEQP-GLES31.functional.state_query.internal_for",
        "mat.texture_2d_multisample_array.rgba16f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016098,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.r32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016099,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample_array.rg32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016100,
        "dEQP-GLES31.functional.state_query.internal_for",
        "mat.texture_2d_multisample_array.rgba32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016101,
        "dEQP-GLES31.functional.state_query.internal_format.",
        "texture_2d_multisample_array.r11f_g11f_b10f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016102,
        "dEQP-GLES31.functional.state_query.internal_format.t",
        "exture_2d_multisample_array.depth_component16_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016103,
        "dEQP-GLES31.functional.state_query.internal_format.t",
        "exture_2d_multisample_array.depth_component24_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016104,
        "dEQP-GLES31.functional.state_query.internal_format.te",
        "xture_2d_multisample_array.depth_component32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016105,
        "dEQP-GLES31.functional.state_query.internal_format.t",
        "exture_2d_multisample_array.depth24_stencil8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016106,
        "dEQP-GLES31.functional.state_query.internal_format.t",
        "exture_2d_multisample_array.depth32f_stencil8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016107,
        "dEQP-GLES31.functional.state_query.internal_format.",
        "texture_2d_multisample_array.stencil_index8_samples");
