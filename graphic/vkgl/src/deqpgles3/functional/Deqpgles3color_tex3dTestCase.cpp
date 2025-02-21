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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031878,
        "dEQP-GLES3.functional.",
        "fbo.color.tex3d.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031879,
        "dEQP-GLES3.functional.f",
        "bo.color.tex3d.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031880,
        "dEQP-GLES3.functional.",
        "fbo.color.tex3d.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031881,
        "dEQP-GLES3.functional.f",
        "bo.color.tex3d.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031882,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031883,
        "dEQP-GLES3.functional.",
        "fbo.color.tex3d.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031884,
        "dEQP-GLES3.functional.",
        "fbo.color.tex3d.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031885,
        "dEQP-GLES3.functional.fbo",
        ".color.tex3d.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031886,
        "dEQP-GLES3.functional.f",
        "bo.color.tex3d.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031887,
        "dEQP-GLES3.functional.fb",
        "o.color.tex3d.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031888,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031889,
        "dEQP-GLES3.functional.",
        "fbo.color.tex3d.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031890,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031891,
        "dEQP-GLES3.functional.",
        "fbo.color.tex3d.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031892,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031893,
        "dEQP-GLES3.functional.",
        "fbo.color.tex3d.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031894,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031895,
        "dEQP-GLES3.functional.",
        "fbo.color.tex3d.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031896,
        "dEQP-GLES3.functiona",
        "l.fbo.color.tex3d.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031897,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031898,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031899,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031900,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031901,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031902,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031903,
        "dEQP-GLES3.functiona",
        "l.fbo.color.tex3d.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031904,
        "dEQP-GLES3.functiona",
        "l.fbo.color.tex3d.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031905,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031906,
        "dEQP-GLES3.functional.",
        "fbo.color.tex3d.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031907,
        "dEQP-GLES3.functional.",
        "fbo.color.tex3d.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031908,
        "dEQP-GLES3.functional.fbo.",
        "color.tex3d.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031909,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031910,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031911,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031912,
        "dEQP-GLES3.functional",
        ".fbo.color.tex3d.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031913,
        "dEQP-GLES3.functional.",
        "fbo.color.tex3d.rgb16f");
