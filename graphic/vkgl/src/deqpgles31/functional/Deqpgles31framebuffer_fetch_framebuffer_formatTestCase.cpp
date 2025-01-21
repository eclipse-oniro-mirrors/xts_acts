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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007474,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.framebuffer_format.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007475,
        "dEQP-GLES31.functional.shaders.framebu",
        "ffer_fetch.framebuffer_format.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007476,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.framebuffer_format.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007477,
        "dEQP-GLES31.functional.shaders.framebu",
        "ffer_fetch.framebuffer_format.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007478,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007479,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.framebuffer_format.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007480,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.framebuffer_format.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007481,
        "dEQP-GLES31.functional.shaders.framebuff",
        "er_fetch.framebuffer_format.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007482,
        "dEQP-GLES31.functional.shaders.framebu",
        "ffer_fetch.framebuffer_format.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007483,
        "dEQP-GLES31.functional.shaders.framebuf",
        "fer_fetch.framebuffer_format.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007484,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007485,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.framebuffer_format.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007486,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007487,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.framebuffer_format.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007488,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007489,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.framebuffer_format.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007490,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007491,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.framebuffer_format.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007492,
        "dEQP-GLES31.functional.shaders.fram",
        "ebuffer_fetch.framebuffer_format.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007493,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007494,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007495,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007496,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007497,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007498,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007499,
        "dEQP-GLES31.functional.shaders.fram",
        "ebuffer_fetch.framebuffer_format.r8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007500,
        "dEQP-GLES31.functional.shaders.fram",
        "ebuffer_fetch.framebuffer_format.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007501,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007502,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.framebuffer_format.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007503,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.framebuffer_format.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007504,
        "dEQP-GLES31.functional.shaders.framebuffe",
        "r_fetch.framebuffer_format.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007505,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007506,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007507,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007508,
        "dEQP-GLES31.functional.shaders.frame",
        "buffer_fetch.framebuffer_format.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007509,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.framebuffer_format.rgb16f");
