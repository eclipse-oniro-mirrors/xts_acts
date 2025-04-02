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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043266,
        "dEQP-GLES3.functional.state_qu",
        "ery.internal_format.r8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043267,
        "dEQP-GLES3.functional.state_qu",
        "ery.internal_format.rg8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043268,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.rgb8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043269,
        "dEQP-GLES3.functional.state_quer",
        "y.internal_format.rgb565_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043270,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.rgba4_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043271,
        "dEQP-GLES3.functional.state_quer",
        "y.internal_format.rgb5_a1_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043272,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.rgba8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043273,
        "dEQP-GLES3.functional.state_query",
        ".internal_format.rgb10_a2_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043274,
        "dEQP-GLES3.functional.state_query.",
        "internal_format.rgb10_a2ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043275,
        "dEQP-GLES3.functional.state_query.i",
        "nternal_format.srgb8_alpha8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043276,
        "dEQP-GLES3.functional.state_qu",
        "ery.internal_format.r8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043277,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.r8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043278,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.r16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043279,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.r16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043280,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.r32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043281,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.r32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043282,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.rg8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043283,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.rg8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043284,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.rg16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043285,
        "dEQP-GLES3.functional.state_quer",
        "y.internal_format.rg16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043286,
        "dEQP-GLES3.functional.state_que",
        "ry.internal_format.rg32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043287,
        "dEQP-GLES3.functional.state_quer",
        "y.internal_format.rg32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043288,
        "dEQP-GLES3.functional.state_quer",
        "y.internal_format.rgba8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043289,
        "dEQP-GLES3.functional.state_quer",
        "y.internal_format.rgba8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043290,
        "dEQP-GLES3.functional.state_quer",
        "y.internal_format.rgba16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043291,
        "dEQP-GLES3.functional.state_query",
        ".internal_format.rgba16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043292,
        "dEQP-GLES3.functional.state_quer",
        "y.internal_format.rgba32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043293,
        "dEQP-GLES3.functional.state_query",
        ".internal_format.rgba32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043294,
        "dEQP-GLES3.functional.state_query.int",
        "ernal_format.depth_component16_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043295,
        "dEQP-GLES3.functional.state_query.int",
        "ernal_format.depth_component24_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043296,
        "dEQP-GLES3.functional.state_query.inte",
        "rnal_format.depth_component32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043297,
        "dEQP-GLES3.functional.state_query.int",
        "ernal_format.depth24_stencil8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043298,
        "dEQP-GLES3.functional.state_query.int",
        "ernal_format.depth32f_stencil8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043299,
        "dEQP-GLES3.functional.state_query.in",
        "ternal_format.stencil_index8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043300,
        "dEQP-GLES3.functional.state_query.i",
        "nternal_format.rgba8_samples_buffer");
