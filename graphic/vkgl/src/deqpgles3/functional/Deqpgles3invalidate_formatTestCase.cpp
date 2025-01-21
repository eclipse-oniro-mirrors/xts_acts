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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032811,
        "dEQP-GLES3.functional.fbo",
        ".invalidate.format.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032812,
        "dEQP-GLES3.functional.fbo.",
        "invalidate.format.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032813,
        "dEQP-GLES3.functional.fbo",
        ".invalidate.format.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032814,
        "dEQP-GLES3.functional.fbo.",
        "invalidate.format.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032815,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032816,
        "dEQP-GLES3.functional.fbo",
        ".invalidate.format.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032817,
        "dEQP-GLES3.functional.fbo",
        ".invalidate.format.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032818,
        "dEQP-GLES3.functional.fbo.in",
        "validate.format.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032819,
        "dEQP-GLES3.functional.fbo.",
        "invalidate.format.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032820,
        "dEQP-GLES3.functional.fbo.i",
        "nvalidate.format.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032821,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032822,
        "dEQP-GLES3.functional.fbo",
        ".invalidate.format.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032823,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032824,
        "dEQP-GLES3.functional.fbo",
        ".invalidate.format.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032825,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032826,
        "dEQP-GLES3.functional.fbo",
        ".invalidate.format.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032827,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032828,
        "dEQP-GLES3.functional.fbo",
        ".invalidate.format.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032829,
        "dEQP-GLES3.functional.f",
        "bo.invalidate.format.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032830,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032831,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032832,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032833,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032834,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032835,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032836,
        "dEQP-GLES3.functional.f",
        "bo.invalidate.format.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032837,
        "dEQP-GLES3.functional.f",
        "bo.invalidate.format.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032838,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032839,
        "dEQP-GLES3.functional.fbo",
        ".invalidate.format.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032840,
        "dEQP-GLES3.functional.fbo",
        ".invalidate.format.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032841,
        "dEQP-GLES3.functional.fbo.inv",
        "alidate.format.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032842,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032843,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032844,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032845,
        "dEQP-GLES3.functional.fb",
        "o.invalidate.format.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032846,
        "dEQP-GLES3.functional.fbo.inval",
        "idate.format.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032847,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.format.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032848,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.format.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032849,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.format.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032850,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.format.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032851,
        "dEQP-GLES3.functional.fbo.inv",
        "alidate.format.stencil_index8");
