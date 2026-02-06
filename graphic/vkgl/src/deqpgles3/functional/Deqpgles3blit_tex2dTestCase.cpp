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
#include "../ActsDeqpgles30032TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031964,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.tex2d.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031965,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.blit.tex2d.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031966,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.tex2d.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031967,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.blit.tex2d.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031968,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031969,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.tex2d.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031970,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.tex2d.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031971,
        "dEQP-GLES3.functional.fbo.color.rep",
        "eated_clear.blit.tex2d.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031972,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.blit.tex2d.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031973,
        "dEQP-GLES3.functional.fbo.color.re",
        "peated_clear.blit.tex2d.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031974,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031975,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.tex2d.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031976,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031977,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.tex2d.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031978,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031979,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.tex2d.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031980,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031981,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.tex2d.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031982,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.tex2d.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031983,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031984,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031985,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031986,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031987,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031988,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031989,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.tex2d.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031990,
        "dEQP-GLES3.functional.fbo.colo",
        "r.repeated_clear.blit.tex2d.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031991,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031992,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.tex2d.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031993,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.tex2d.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031994,
        "dEQP-GLES3.functional.fbo.color.repe",
        "ated_clear.blit.tex2d.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031995,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031996,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031997,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031998,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.blit.tex2d.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031999,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.blit.tex2d.rgb16f");
