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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031806,
        "dEQP-GLES3.functional.f",
        "bo.color.texcube.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031807,
        "dEQP-GLES3.functional.fb",
        "o.color.texcube.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031808,
        "dEQP-GLES3.functional.f",
        "bo.color.texcube.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031809,
        "dEQP-GLES3.functional.fb",
        "o.color.texcube.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031810,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031811,
        "dEQP-GLES3.functional.f",
        "bo.color.texcube.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031812,
        "dEQP-GLES3.functional.f",
        "bo.color.texcube.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031813,
        "dEQP-GLES3.functional.fbo.",
        "color.texcube.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031814,
        "dEQP-GLES3.functional.fb",
        "o.color.texcube.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031815,
        "dEQP-GLES3.functional.fbo",
        ".color.texcube.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031816,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031817,
        "dEQP-GLES3.functional.f",
        "bo.color.texcube.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031818,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031819,
        "dEQP-GLES3.functional.f",
        "bo.color.texcube.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031820,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031821,
        "dEQP-GLES3.functional.f",
        "bo.color.texcube.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031822,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031823,
        "dEQP-GLES3.functional.f",
        "bo.color.texcube.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031824,
        "dEQP-GLES3.functional",
        ".fbo.color.texcube.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031825,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031826,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031827,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031828,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031829,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031830,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031831,
        "dEQP-GLES3.functional",
        ".fbo.color.texcube.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031832,
        "dEQP-GLES3.functional",
        ".fbo.color.texcube.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031833,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031834,
        "dEQP-GLES3.functional.f",
        "bo.color.texcube.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031835,
        "dEQP-GLES3.functional.f",
        "bo.color.texcube.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031836,
        "dEQP-GLES3.functional.fbo.c",
        "olor.texcube.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031837,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031838,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031839,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031840,
        "dEQP-GLES3.functional.",
        "fbo.color.texcube.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031841,
        "dEQP-GLES3.functional.f",
        "bo.color.texcube.rgb16f");
