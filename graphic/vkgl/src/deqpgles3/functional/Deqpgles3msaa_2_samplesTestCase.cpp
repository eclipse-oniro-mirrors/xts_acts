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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032675,
        "dEQP-GLES3.functional.f",
        "bo.msaa.2_samples.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032676,
        "dEQP-GLES3.functional.fbo.",
        "msaa.2_samples.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032677,
        "dEQP-GLES3.functional.fb",
        "o.msaa.2_samples.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032678,
        "dEQP-GLES3.functional.f",
        "bo.msaa.2_samples.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032679,
        "dEQP-GLES3.functional.fb",
        "o.msaa.2_samples.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032680,
        "dEQP-GLES3.functional.",
        "fbo.msaa.2_samples.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032681,
        "dEQP-GLES3.functional.f",
        "bo.msaa.2_samples.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032682,
        "dEQP-GLES3.functional.",
        "fbo.msaa.2_samples.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032683,
        "dEQP-GLES3.functional",
        ".fbo.msaa.2_samples.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032684,
        "dEQP-GLES3.functional.fb",
        "o.msaa.2_samples.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032685,
        "dEQP-GLES3.functional.fb",
        "o.msaa.2_samples.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032686,
        "dEQP-GLES3.functional.fbo.m",
        "saa.2_samples.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032687,
        "dEQP-GLES3.functional.f",
        "bo.msaa.2_samples.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032688,
        "dEQP-GLES3.functional.f",
        "bo.msaa.2_samples.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032689,
        "dEQP-GLES3.functional.",
        "fbo.msaa.2_samples.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032690,
        "dEQP-GLES3.functional.",
        "fbo.msaa.2_samples.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032691,
        "dEQP-GLES3.functional.fbo.msa",
        "a.2_samples.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032692,
        "dEQP-GLES3.functional.fbo.msa",
        "a.2_samples.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032693,
        "dEQP-GLES3.functional.fbo.msa",
        "a.2_samples.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032694,
        "dEQP-GLES3.functional.fbo.msa",
        "a.2_samples.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032695,
        "dEQP-GLES3.functional.fbo.ms",
        "aa.2_samples.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032696,
        "dEQP-GLES3.functional.fbo.m",
        "saa.2_samples.stencil_index8");
