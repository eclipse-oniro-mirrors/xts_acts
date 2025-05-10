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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016026,
        "dEQP-GLES31.functional.state_query.interna",
        "l_format.texture_2d_multisample.r8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016027,
        "dEQP-GLES31.functional.state_query.interna",
        "l_format.texture_2d_multisample.rg8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016028,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.rgb8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016029,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.texture_2d_multisample.rgb565_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016030,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.rgba4_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016031,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.texture_2d_multisample.rgb5_a1_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016032,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.rgba8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016033,
        "dEQP-GLES31.functional.state_query.internal_f",
        "ormat.texture_2d_multisample.rgb10_a2_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016034,
        "dEQP-GLES31.functional.state_query.internal_fo",
        "rmat.texture_2d_multisample.rgb10_a2ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016035,
        "dEQP-GLES31.functional.state_query.internal_for",
        "mat.texture_2d_multisample.srgb8_alpha8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016036,
        "dEQP-GLES31.functional.state_query.interna",
        "l_format.texture_2d_multisample.r8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016037,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.r8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016038,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.r16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016039,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.r16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016040,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.r32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016041,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.r32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016042,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.rg8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016043,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.rg8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016044,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.rg16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016045,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.texture_2d_multisample.rg16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016046,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.rg32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016047,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.texture_2d_multisample.rg32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016048,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.texture_2d_multisample.rgba8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016049,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.texture_2d_multisample.rgba8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016050,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.texture_2d_multisample.rgba16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016051,
        "dEQP-GLES31.functional.state_query.internal_f",
        "ormat.texture_2d_multisample.rgba16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016052,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.texture_2d_multisample.rgba32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016053,
        "dEQP-GLES31.functional.state_query.internal_f",
        "ormat.texture_2d_multisample.rgba32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016054,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.r16f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016055,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.rg16f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016056,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.texture_2d_multisample.rgba16f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016057,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.r32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016058,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.texture_2d_multisample.rg32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016059,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.texture_2d_multisample.rgba32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016060,
        "dEQP-GLES31.functional.state_query.internal_form",
        "at.texture_2d_multisample.r11f_g11f_b10f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016061,
        "dEQP-GLES31.functional.state_query.internal_forma",
        "t.texture_2d_multisample.depth_component16_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016062,
        "dEQP-GLES31.functional.state_query.internal_forma",
        "t.texture_2d_multisample.depth_component24_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016063,
        "dEQP-GLES31.functional.state_query.internal_format",
        ".texture_2d_multisample.depth_component32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016064,
        "dEQP-GLES31.functional.state_query.internal_forma",
        "t.texture_2d_multisample.depth24_stencil8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016065,
        "dEQP-GLES31.functional.state_query.internal_forma",
        "t.texture_2d_multisample.depth32f_stencil8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016066,
        "dEQP-GLES31.functional.state_query.internal_form",
        "at.texture_2d_multisample.stencil_index8_samples");
