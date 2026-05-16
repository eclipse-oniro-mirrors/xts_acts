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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031842,
        "dEQP-GLES3.functional.fbo",
        ".color.tex2darray.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031843,
        "dEQP-GLES3.functional.fbo",
        ".color.tex2darray.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031844,
        "dEQP-GLES3.functional.fbo",
        ".color.tex2darray.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031845,
        "dEQP-GLES3.functional.fbo",
        ".color.tex2darray.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031846,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031847,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031848,
        "dEQP-GLES3.functional.fbo",
        ".color.tex2darray.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031849,
        "dEQP-GLES3.functional.fbo.c",
        "olor.tex2darray.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031850,
        "dEQP-GLES3.functional.fbo",
        ".color.tex2darray.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031851,
        "dEQP-GLES3.functional.fbo.",
        "color.tex2darray.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031852,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031853,
        "dEQP-GLES3.functional.fbo",
        ".color.tex2darray.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031854,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2darray.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031855,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031856,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031857,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031858,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031859,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031860,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2darray.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031861,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2darray.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031862,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031863,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2darray.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031864,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031865,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2darray.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031866,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031867,
        "dEQP-GLES3.functional.",
        "fbo.color.tex2darray.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031868,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2darray.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031869,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2darray.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031870,
        "dEQP-GLES3.functional.fbo",
        ".color.tex2darray.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031871,
        "dEQP-GLES3.functional.fbo",
        ".color.tex2darray.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031872,
        "dEQP-GLES3.functional.fbo.co",
        "lor.tex2darray.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031873,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031874,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031875,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2darray.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031876,
        "dEQP-GLES3.functional.f",
        "bo.color.tex2darray.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031877,
        "dEQP-GLES3.functional.fb",
        "o.color.tex2darray.rgb16f");
