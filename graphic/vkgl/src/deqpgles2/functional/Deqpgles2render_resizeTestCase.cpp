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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012555,
        "dEQP-GLES2.functional.fb",
        "o.render.resize.tex2d_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012556,
        "dEQP-GLES2.functional.fbo.render",
        ".resize.tex2d_rgb_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012557,
        "dEQP-GLES2.functional.fbo.render.",
        "resize.tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012558,
        "dEQP-GLES2.functional.fbo.render.resize.t",
        "ex2d_rgb_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012559,
        "dEQP-GLES2.functional.fbo",
        ".render.resize.tex2d_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012560,
        "dEQP-GLES2.functional.fbo.render",
        ".resize.tex2d_rgba_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012561,
        "dEQP-GLES2.functional.fbo.render.r",
        "esize.tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012562,
        "dEQP-GLES2.functional.fbo.render.resize.t",
        "ex2d_rgba_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012563,
        "dEQP-GLES2.functional.fbo",
        ".render.resize.rbo_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012564,
        "dEQP-GLES2.functional.fbo.render",
        ".resize.rbo_rgb565_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012565,
        "dEQP-GLES2.functional.fbo.render.r",
        "esize.rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012566,
        "dEQP-GLES2.functional.fbo.render.resize.r",
        "bo_rgb565_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012567,
        "dEQP-GLES2.functional.fbo",
        ".render.resize.rbo_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012568,
        "dEQP-GLES2.functional.fbo.render.",
        "resize.rbo_rgb5_a1_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012569,
        "dEQP-GLES2.functional.fbo.render.r",
        "esize.rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012570,
        "dEQP-GLES2.functional.fbo.render.resize.rb",
        "o_rgb5_a1_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012571,
        "dEQP-GLES2.functional.fb",
        "o.render.resize.rbo_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012572,
        "dEQP-GLES2.functional.fbo.render",
        ".resize.rbo_rgba4_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012573,
        "dEQP-GLES2.functional.fbo.render.",
        "resize.rbo_rgba4_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012574,
        "dEQP-GLES2.functional.fbo.render.resize.r",
        "bo_rgba4_depth_component16_stencil_index8");
