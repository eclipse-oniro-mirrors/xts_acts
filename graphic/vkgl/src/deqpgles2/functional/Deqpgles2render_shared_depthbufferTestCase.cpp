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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012545,
        "dEQP-GLES2.functional.fbo.render.shared",
        "_depthbuffer.tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012546,
        "dEQP-GLES2.functional.fbo.render.shared_depthbu",
        "ffer.tex2d_rgb_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012547,
        "dEQP-GLES2.functional.fbo.render.shared_",
        "depthbuffer.tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012548,
        "dEQP-GLES2.functional.fbo.render.shared_depthbu",
        "ffer.tex2d_rgba_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012549,
        "dEQP-GLES2.functional.fbo.render.shared_",
        "depthbuffer.rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012550,
        "dEQP-GLES2.functional.fbo.render.shared_depthbu",
        "ffer.rbo_rgb565_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012551,
        "dEQP-GLES2.functional.fbo.render.shared_",
        "depthbuffer.rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012552,
        "dEQP-GLES2.functional.fbo.render.shared_depthbuf",
        "fer.rbo_rgb5_a1_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012553,
        "dEQP-GLES2.functional.fbo.render.shared",
        "_depthbuffer.rbo_rgba4_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012554,
        "dEQP-GLES2.functional.fbo.render.shared_depthbu",
        "ffer.rbo_rgba4_depth_component16_stencil_index8");
