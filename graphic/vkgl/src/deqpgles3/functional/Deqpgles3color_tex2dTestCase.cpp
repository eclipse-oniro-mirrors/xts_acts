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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031770,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2d.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031771,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2d.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031772,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2d.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031773,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2d.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031774,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031775,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2d.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031776,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2d.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031777,
        "dEQP-GLES3.functional.fbo",
        ".color.tex2d.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031778,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2d.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031779,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2d.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031780,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031781,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2d.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031782,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031783,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2d.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031784,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031785,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2d.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031786,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031787,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2d.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031788,
        "dEQP-GLES3.functiona",
        "l.fbo.color.tex2d.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031789,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031790,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031791,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031792,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031793,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031794,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031795,
        "dEQP-GLES3.functiona",
        "l.fbo.color.tex2d.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031796,
        "dEQP-GLES3.functiona",
        "l.fbo.color.tex2d.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031797,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031798,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2d.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031799,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2d.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031800,
        "dEQP-GLES3.functional.fbo.",
        "color.tex2d.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031801,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031802,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031803,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031804,
        "dEQP-GLES3.functional",
        ".fbo.color.tex2d.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031805,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2d.rgb16f");
