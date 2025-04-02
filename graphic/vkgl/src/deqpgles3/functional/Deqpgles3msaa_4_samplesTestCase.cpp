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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032697,
        "dEQP-GLES3.functional.f",
        "bo.msaa.4_samples.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032698,
        "dEQP-GLES3.functional.fbo.",
        "msaa.4_samples.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032699,
        "dEQP-GLES3.functional.fb",
        "o.msaa.4_samples.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032700,
        "dEQP-GLES3.functional.f",
        "bo.msaa.4_samples.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032701,
        "dEQP-GLES3.functional.fb",
        "o.msaa.4_samples.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032702,
        "dEQP-GLES3.functional.",
        "fbo.msaa.4_samples.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032703,
        "dEQP-GLES3.functional.f",
        "bo.msaa.4_samples.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032704,
        "dEQP-GLES3.functional.",
        "fbo.msaa.4_samples.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032705,
        "dEQP-GLES3.functional",
        ".fbo.msaa.4_samples.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032706,
        "dEQP-GLES3.functional.fb",
        "o.msaa.4_samples.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032707,
        "dEQP-GLES3.functional.fb",
        "o.msaa.4_samples.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032708,
        "dEQP-GLES3.functional.fbo.m",
        "saa.4_samples.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032709,
        "dEQP-GLES3.functional.f",
        "bo.msaa.4_samples.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032710,
        "dEQP-GLES3.functional.f",
        "bo.msaa.4_samples.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032711,
        "dEQP-GLES3.functional.",
        "fbo.msaa.4_samples.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032712,
        "dEQP-GLES3.functional.",
        "fbo.msaa.4_samples.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032713,
        "dEQP-GLES3.functional.fbo.msa",
        "a.4_samples.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032714,
        "dEQP-GLES3.functional.fbo.msa",
        "a.4_samples.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032715,
        "dEQP-GLES3.functional.fbo.msa",
        "a.4_samples.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032716,
        "dEQP-GLES3.functional.fbo.msa",
        "a.4_samples.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032717,
        "dEQP-GLES3.functional.fbo.ms",
        "aa.4_samples.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032718,
        "dEQP-GLES3.functional.fbo.m",
        "saa.4_samples.stencil_index8");
