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
#include "../ActsDeqpgles310016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015985,
        "dEQP-GLES31.functional.state_query.in",
        "ternal_format.renderbuffer.r8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015986,
        "dEQP-GLES31.functional.state_query.in",
        "ternal_format.renderbuffer.rg8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015987,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.rgb8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015988,
        "dEQP-GLES31.functional.state_query.inte",
        "rnal_format.renderbuffer.rgb565_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015989,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.rgba4_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015990,
        "dEQP-GLES31.functional.state_query.inte",
        "rnal_format.renderbuffer.rgb5_a1_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015991,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.rgba8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015992,
        "dEQP-GLES31.functional.state_query.inter",
        "nal_format.renderbuffer.rgb10_a2_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015993,
        "dEQP-GLES31.functional.state_query.intern",
        "al_format.renderbuffer.rgb10_a2ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015994,
        "dEQP-GLES31.functional.state_query.interna",
        "l_format.renderbuffer.srgb8_alpha8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015995,
        "dEQP-GLES31.functional.state_query.in",
        "ternal_format.renderbuffer.r8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015996,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.r8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015997,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.r16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015998,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.r16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015999,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.r32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016000,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.r32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016001,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.rg8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016002,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.rg8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016003,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.rg16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016004,
        "dEQP-GLES31.functional.state_query.inte",
        "rnal_format.renderbuffer.rg16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016005,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.rg32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016006,
        "dEQP-GLES31.functional.state_query.inte",
        "rnal_format.renderbuffer.rg32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016007,
        "dEQP-GLES31.functional.state_query.inte",
        "rnal_format.renderbuffer.rgba8i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016008,
        "dEQP-GLES31.functional.state_query.inte",
        "rnal_format.renderbuffer.rgba8ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016009,
        "dEQP-GLES31.functional.state_query.inte",
        "rnal_format.renderbuffer.rgba16i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016010,
        "dEQP-GLES31.functional.state_query.inter",
        "nal_format.renderbuffer.rgba16ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016011,
        "dEQP-GLES31.functional.state_query.inte",
        "rnal_format.renderbuffer.rgba32i_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016012,
        "dEQP-GLES31.functional.state_query.inter",
        "nal_format.renderbuffer.rgba32ui_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016013,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.r16f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016014,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.rg16f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016015,
        "dEQP-GLES31.functional.state_query.inte",
        "rnal_format.renderbuffer.rgba16f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016016,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.r32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016017,
        "dEQP-GLES31.functional.state_query.int",
        "ernal_format.renderbuffer.rg32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016018,
        "dEQP-GLES31.functional.state_query.inte",
        "rnal_format.renderbuffer.rgba32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016019,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.renderbuffer.r11f_g11f_b10f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016020,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.renderbuffer.depth_component16_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016021,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.renderbuffer.depth_component24_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016022,
        "dEQP-GLES31.functional.state_query.internal_f",
        "ormat.renderbuffer.depth_component32f_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016023,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.renderbuffer.depth24_stencil8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016024,
        "dEQP-GLES31.functional.state_query.internal_",
        "format.renderbuffer.depth32f_stencil8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_016025,
        "dEQP-GLES31.functional.state_query.internal",
        "_format.renderbuffer.stencil_index8_samples");
