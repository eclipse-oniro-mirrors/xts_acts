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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031734,
        "dEQP-GLES3.functional.",
        "fbo.color.clear.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031735,
        "dEQP-GLES3.functional.f",
        "bo.color.clear.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031736,
        "dEQP-GLES3.functional.",
        "fbo.color.clear.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031737,
        "dEQP-GLES3.functional.f",
        "bo.color.clear.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031738,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031739,
        "dEQP-GLES3.functional.",
        "fbo.color.clear.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031740,
        "dEQP-GLES3.functional.",
        "fbo.color.clear.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031741,
        "dEQP-GLES3.functional.fbo",
        ".color.clear.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031742,
        "dEQP-GLES3.functional.f",
        "bo.color.clear.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031743,
        "dEQP-GLES3.functional.fb",
        "o.color.clear.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031744,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031745,
        "dEQP-GLES3.functional.",
        "fbo.color.clear.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031746,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031747,
        "dEQP-GLES3.functional.",
        "fbo.color.clear.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031748,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031749,
        "dEQP-GLES3.functional.",
        "fbo.color.clear.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031750,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031751,
        "dEQP-GLES3.functional.",
        "fbo.color.clear.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031752,
        "dEQP-GLES3.functiona",
        "l.fbo.color.clear.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031753,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031754,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031755,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031756,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031757,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031758,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031759,
        "dEQP-GLES3.functiona",
        "l.fbo.color.clear.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031760,
        "dEQP-GLES3.functiona",
        "l.fbo.color.clear.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031761,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031762,
        "dEQP-GLES3.functional.",
        "fbo.color.clear.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031763,
        "dEQP-GLES3.functional.",
        "fbo.color.clear.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031764,
        "dEQP-GLES3.functional.fbo.",
        "color.clear.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031765,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031766,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031767,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031768,
        "dEQP-GLES3.functional",
        ".fbo.color.clear.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031769,
        "dEQP-GLES3.functional.",
        "fbo.color.clear.rgb16f");
