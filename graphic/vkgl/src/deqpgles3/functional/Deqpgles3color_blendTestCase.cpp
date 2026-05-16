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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031914,
        "dEQP-GLES3.functional.fbo.",
        "color.blend.rgba8_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031915,
        "dEQP-GLES3.functional.fbo.col",
        "or.blend.srgb8_alpha8_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031916,
        "dEQP-GLES3.functional.fbo.c",
        "olor.blend.rgb10_a2_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031917,
        "dEQP-GLES3.functional.fbo.",
        "color.blend.rgba4_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031918,
        "dEQP-GLES3.functional.fbo.c",
        "olor.blend.rgb5_a1_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031919,
        "dEQP-GLES3.functional.fbo",
        ".color.blend.rgb8_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031920,
        "dEQP-GLES3.functional.fbo.",
        "color.blend.rgb565_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031921,
        "dEQP-GLES3.functional.fbo",
        ".color.blend.rg8_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031922,
        "dEQP-GLES3.functional.fb",
        "o.color.blend.r8_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031923,
        "dEQP-GLES3.functional.fbo.c",
        "olor.blend.rgba16f_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031924,
        "dEQP-GLES3.functional.fbo.colo",
        "r.blend.r11f_g11f_b10f_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031925,
        "dEQP-GLES3.functional.fbo.",
        "color.blend.rg16f_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031926,
        "dEQP-GLES3.functional.fbo",
        ".color.blend.r16f_src_over");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031927,
        "dEQP-GLES3.functional.fbo.",
        "color.blend.rgb16f_src_over");
