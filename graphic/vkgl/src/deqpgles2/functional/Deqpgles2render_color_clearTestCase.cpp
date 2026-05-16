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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012432,
        "dEQP-GLES2.functional.fbo.r",
        "ender.color_clear.tex2d_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012433,
        "dEQP-GLES2.functional.fbo.render.c",
        "olor_clear.tex2d_rgb_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012434,
        "dEQP-GLES2.functional.fbo.render.col",
        "or_clear.tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012435,
        "dEQP-GLES2.functional.fbo.render.color_clea",
        "r.tex2d_rgb_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012436,
        "dEQP-GLES2.functional.fbo.r",
        "ender.color_clear.tex2d_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012437,
        "dEQP-GLES2.functional.fbo.render.co",
        "lor_clear.tex2d_rgba_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012438,
        "dEQP-GLES2.functional.fbo.render.col",
        "or_clear.tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012439,
        "dEQP-GLES2.functional.fbo.render.color_clear",
        ".tex2d_rgba_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012440,
        "dEQP-GLES2.functional.fbo.r",
        "ender.color_clear.rbo_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012441,
        "dEQP-GLES2.functional.fbo.render.co",
        "lor_clear.rbo_rgb565_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012442,
        "dEQP-GLES2.functional.fbo.render.col",
        "or_clear.rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012443,
        "dEQP-GLES2.functional.fbo.render.color_clear",
        ".rbo_rgb565_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012444,
        "dEQP-GLES2.functional.fbo.re",
        "nder.color_clear.rbo_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012445,
        "dEQP-GLES2.functional.fbo.render.co",
        "lor_clear.rbo_rgb5_a1_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012446,
        "dEQP-GLES2.functional.fbo.render.colo",
        "r_clear.rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012447,
        "dEQP-GLES2.functional.fbo.render.color_clear",
        ".rbo_rgb5_a1_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012448,
        "dEQP-GLES2.functional.fbo.r",
        "ender.color_clear.rbo_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012449,
        "dEQP-GLES2.functional.fbo.render.c",
        "olor_clear.rbo_rgba4_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012450,
        "dEQP-GLES2.functional.fbo.render.col",
        "or_clear.rbo_rgba4_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012451,
        "dEQP-GLES2.functional.fbo.render.color_clea",
        "r.rbo_rgba4_depth_component16_stencil_index8");
