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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031928,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.sample.tex2d.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031929,
        "dEQP-GLES3.functional.fbo.color.re",
        "peated_clear.sample.tex2d.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031930,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.sample.tex2d.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031931,
        "dEQP-GLES3.functional.fbo.color.re",
        "peated_clear.sample.tex2d.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031932,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031933,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.sample.tex2d.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031934,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.sample.tex2d.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031935,
        "dEQP-GLES3.functional.fbo.color.repe",
        "ated_clear.sample.tex2d.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031936,
        "dEQP-GLES3.functional.fbo.color.re",
        "peated_clear.sample.tex2d.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031937,
        "dEQP-GLES3.functional.fbo.color.rep",
        "eated_clear.sample.tex2d.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031938,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031939,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.sample.tex2d.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031940,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031941,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.sample.tex2d.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031942,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031943,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.sample.tex2d.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031944,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031945,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.sample.tex2d.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031946,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.sample.tex2d.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031947,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031948,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031949,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031950,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031951,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031952,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031953,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.sample.tex2d.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031954,
        "dEQP-GLES3.functional.fbo.color",
        ".repeated_clear.sample.tex2d.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031955,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031956,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.sample.tex2d.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031957,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.sample.tex2d.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031958,
        "dEQP-GLES3.functional.fbo.color.repea",
        "ted_clear.sample.tex2d.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031959,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031960,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031961,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031962,
        "dEQP-GLES3.functional.fbo.color.",
        "repeated_clear.sample.tex2d.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031963,
        "dEQP-GLES3.functional.fbo.color.r",
        "epeated_clear.sample.tex2d.rgb16f");
