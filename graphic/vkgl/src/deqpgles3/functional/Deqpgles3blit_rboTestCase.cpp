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
#include "../ActsDeqpgles30033TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032000,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.rbo.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032001,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.rbo.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032002,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.rbo.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032003,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.rbo.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032004,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032005,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.rbo.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032006,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.rbo.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032007,
        "dEQP-GLES3.functional.fbo.color.re",
        "peated_clear.blit.rbo.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032008,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.rbo.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032009,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.blit.rbo.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032010,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032011,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.rbo.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032012,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032013,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.rbo.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032014,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032015,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.rbo.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032016,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032017,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.rbo.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032018,
        "dEQP-GLES3.functional.fbo.col",
        "or.repeated_clear.blit.rbo.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032019,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032020,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032021,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032022,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032023,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032024,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032025,
        "dEQP-GLES3.functional.fbo.col",
        "or.repeated_clear.blit.rbo.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032026,
        "dEQP-GLES3.functional.fbo.col",
        "or.repeated_clear.blit.rbo.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032027,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032028,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.rbo.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032029,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.rbo.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032030,
        "dEQP-GLES3.functional.fbo.color.rep",
        "eated_clear.blit.rbo.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032031,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032032,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032033,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032034,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.rbo.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032035,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.rbo.rgb16f");
