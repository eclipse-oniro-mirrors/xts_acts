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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012452,
        "dEQP-GLES2.functional.fbo.render.st",
        "encil_clear.tex2d_rgb_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012453,
        "dEQP-GLES2.functional.fbo.render.stencil_cle",
        "ar.tex2d_rgb_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012454,
        "dEQP-GLES2.functional.fbo.render.ste",
        "ncil_clear.tex2d_rgba_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012455,
        "dEQP-GLES2.functional.fbo.render.stencil_clea",
        "r.tex2d_rgba_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012456,
        "dEQP-GLES2.functional.fbo.render.ste",
        "ncil_clear.rbo_rgb565_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012457,
        "dEQP-GLES2.functional.fbo.render.stencil_clea",
        "r.rbo_rgb565_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012458,
        "dEQP-GLES2.functional.fbo.render.ste",
        "ncil_clear.rbo_rgb5_a1_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012459,
        "dEQP-GLES2.functional.fbo.render.stencil_clea",
        "r.rbo_rgb5_a1_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012460,
        "dEQP-GLES2.functional.fbo.render.st",
        "encil_clear.rbo_rgba4_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012461,
        "dEQP-GLES2.functional.fbo.render.stencil_cle",
        "ar.rbo_rgba4_depth_component16_stencil_index8");
