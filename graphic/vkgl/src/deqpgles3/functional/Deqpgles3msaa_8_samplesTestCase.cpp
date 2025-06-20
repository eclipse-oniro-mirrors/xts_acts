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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032719,
        "dEQP-GLES3.functional.f",
        "bo.msaa.8_samples.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032720,
        "dEQP-GLES3.functional.fbo.",
        "msaa.8_samples.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032721,
        "dEQP-GLES3.functional.fb",
        "o.msaa.8_samples.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032722,
        "dEQP-GLES3.functional.f",
        "bo.msaa.8_samples.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032723,
        "dEQP-GLES3.functional.fb",
        "o.msaa.8_samples.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032724,
        "dEQP-GLES3.functional.",
        "fbo.msaa.8_samples.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032725,
        "dEQP-GLES3.functional.f",
        "bo.msaa.8_samples.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032726,
        "dEQP-GLES3.functional.",
        "fbo.msaa.8_samples.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032727,
        "dEQP-GLES3.functional",
        ".fbo.msaa.8_samples.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032728,
        "dEQP-GLES3.functional.fb",
        "o.msaa.8_samples.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032729,
        "dEQP-GLES3.functional.fb",
        "o.msaa.8_samples.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032730,
        "dEQP-GLES3.functional.fbo.m",
        "saa.8_samples.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032731,
        "dEQP-GLES3.functional.f",
        "bo.msaa.8_samples.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032732,
        "dEQP-GLES3.functional.f",
        "bo.msaa.8_samples.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032733,
        "dEQP-GLES3.functional.",
        "fbo.msaa.8_samples.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032734,
        "dEQP-GLES3.functional.",
        "fbo.msaa.8_samples.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032735,
        "dEQP-GLES3.functional.fbo.msa",
        "a.8_samples.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032736,
        "dEQP-GLES3.functional.fbo.msa",
        "a.8_samples.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032737,
        "dEQP-GLES3.functional.fbo.msa",
        "a.8_samples.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032738,
        "dEQP-GLES3.functional.fbo.msa",
        "a.8_samples.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032739,
        "dEQP-GLES3.functional.fbo.ms",
        "aa.8_samples.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032740,
        "dEQP-GLES3.functional.fbo.m",
        "saa.8_samples.stencil_index8");
