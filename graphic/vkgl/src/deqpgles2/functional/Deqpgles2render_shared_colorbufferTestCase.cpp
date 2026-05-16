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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012525,
        "dEQP-GLES2.functional.fbo.rend",
        "er.shared_colorbuffer.tex2d_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012526,
        "dEQP-GLES2.functional.fbo.render.share",
        "d_colorbuffer.tex2d_rgb_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012527,
        "dEQP-GLES2.functional.fbo.render.shared",
        "_colorbuffer.tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012528,
        "dEQP-GLES2.functional.fbo.render.shared_colorbu",
        "ffer.tex2d_rgb_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012529,
        "dEQP-GLES2.functional.fbo.rende",
        "r.shared_colorbuffer.tex2d_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012530,
        "dEQP-GLES2.functional.fbo.render.share",
        "d_colorbuffer.tex2d_rgba_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012531,
        "dEQP-GLES2.functional.fbo.render.shared_",
        "colorbuffer.tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012532,
        "dEQP-GLES2.functional.fbo.render.shared_colorbu",
        "ffer.tex2d_rgba_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012533,
        "dEQP-GLES2.functional.fbo.rende",
        "r.shared_colorbuffer.rbo_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012534,
        "dEQP-GLES2.functional.fbo.render.share",
        "d_colorbuffer.rbo_rgb565_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012535,
        "dEQP-GLES2.functional.fbo.render.shared_",
        "colorbuffer.rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012536,
        "dEQP-GLES2.functional.fbo.render.shared_colorbu",
        "ffer.rbo_rgb565_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012537,
        "dEQP-GLES2.functional.fbo.rende",
        "r.shared_colorbuffer.rbo_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012538,
        "dEQP-GLES2.functional.fbo.render.shared",
        "_colorbuffer.rbo_rgb5_a1_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012539,
        "dEQP-GLES2.functional.fbo.render.shared_",
        "colorbuffer.rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012540,
        "dEQP-GLES2.functional.fbo.render.shared_colorbuf",
        "fer.rbo_rgb5_a1_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012541,
        "dEQP-GLES2.functional.fbo.rend",
        "er.shared_colorbuffer.rbo_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012542,
        "dEQP-GLES2.functional.fbo.render.share",
        "d_colorbuffer.rbo_rgba4_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012543,
        "dEQP-GLES2.functional.fbo.render.shared",
        "_colorbuffer.rbo_rgba4_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012544,
        "dEQP-GLES2.functional.fbo.render.shared_colorbu",
        "ffer.rbo_rgba4_depth_component16_stencil_index8");
