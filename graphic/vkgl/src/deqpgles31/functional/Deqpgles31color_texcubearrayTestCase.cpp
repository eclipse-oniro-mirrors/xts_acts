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
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019930,
        "dEQP-GLES31.functional.fbo",
        ".color.texcubearray.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019931,
        "dEQP-GLES31.functional.fbo.",
        "color.texcubearray.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019932,
        "dEQP-GLES31.functional.fbo",
        ".color.texcubearray.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019933,
        "dEQP-GLES31.functional.fbo.",
        "color.texcubearray.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019934,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019935,
        "dEQP-GLES31.functional.fbo",
        ".color.texcubearray.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019936,
        "dEQP-GLES31.functional.fbo",
        ".color.texcubearray.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019937,
        "dEQP-GLES31.functional.fbo.co",
        "lor.texcubearray.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019938,
        "dEQP-GLES31.functional.fbo.",
        "color.texcubearray.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019939,
        "dEQP-GLES31.functional.fbo.c",
        "olor.texcubearray.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019940,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019941,
        "dEQP-GLES31.functional.fbo",
        ".color.texcubearray.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019942,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019943,
        "dEQP-GLES31.functional.fbo",
        ".color.texcubearray.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019944,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019945,
        "dEQP-GLES31.functional.fbo",
        ".color.texcubearray.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019946,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019947,
        "dEQP-GLES31.functional.fbo",
        ".color.texcubearray.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019948,
        "dEQP-GLES31.functional.f",
        "bo.color.texcubearray.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019949,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019950,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019951,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019952,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019953,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019954,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019955,
        "dEQP-GLES31.functional.f",
        "bo.color.texcubearray.r8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019956,
        "dEQP-GLES31.functional.f",
        "bo.color.texcubearray.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019957,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019958,
        "dEQP-GLES31.functional.fbo",
        ".color.texcubearray.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019959,
        "dEQP-GLES31.functional.fbo",
        ".color.texcubearray.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019960,
        "dEQP-GLES31.functional.fbo.col",
        "or.texcubearray.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019961,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019962,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019963,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019964,
        "dEQP-GLES31.functional.fb",
        "o.color.texcubearray.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019965,
        "dEQP-GLES31.functional.fbo",
        ".color.texcubearray.rgb16f");
