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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012490,
        "dEQP-GLES2.functional.fbo.render.",
        "depth.tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012491,
        "dEQP-GLES2.functional.fbo.render.",
        "depth.tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012492,
        "dEQP-GLES2.functional.fbo.render.",
        "depth.rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012493,
        "dEQP-GLES2.functional.fbo.render.d",
        "epth.rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012494,
        "dEQP-GLES2.functional.fbo.render.",
        "depth.rbo_rgba4_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012495,
        "dEQP-GLES2.functional.fbo.render.de",
        "pth.npot_tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012496,
        "dEQP-GLES2.functional.fbo.render.dep",
        "th.npot_tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012497,
        "dEQP-GLES2.functional.fbo.render.dep",
        "th.npot_rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012498,
        "dEQP-GLES2.functional.fbo.render.dep",
        "th.npot_rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012499,
        "dEQP-GLES2.functional.fbo.render.de",
        "pth.npot_rbo_rgba4_depth_component16");
