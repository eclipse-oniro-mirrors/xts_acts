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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012635,
        "dEQP-GLES2.functional.fbo.render.recreate_s",
        "tencilbuffer.rebind_tex2d_rgb_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012636,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuf",
        "fer.rebind_tex2d_rgb_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012637,
        "dEQP-GLES2.functional.fbo.render.recreate_st",
        "encilbuffer.rebind_tex2d_rgba_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012638,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuff",
        "er.rebind_tex2d_rgba_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012639,
        "dEQP-GLES2.functional.fbo.render.recreate_st",
        "encilbuffer.rebind_rbo_rgb565_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012640,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuff",
        "er.rebind_rbo_rgb565_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012641,
        "dEQP-GLES2.functional.fbo.render.recreate_st",
        "encilbuffer.rebind_rbo_rgb5_a1_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012642,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuff",
        "er.rebind_rbo_rgb5_a1_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012643,
        "dEQP-GLES2.functional.fbo.render.recreate_s",
        "tencilbuffer.rebind_rbo_rgba4_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012644,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuf",
        "fer.rebind_rbo_rgba4_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012645,
        "dEQP-GLES2.functional.fbo.render.recreate_ste",
        "ncilbuffer.no_rebind_tex2d_rgb_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012646,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuffe",
        "r.no_rebind_tex2d_rgb_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012647,
        "dEQP-GLES2.functional.fbo.render.recreate_ste",
        "ncilbuffer.no_rebind_tex2d_rgba_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012648,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuffe",
        "r.no_rebind_tex2d_rgba_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012649,
        "dEQP-GLES2.functional.fbo.render.recreate_ste",
        "ncilbuffer.no_rebind_rbo_rgb565_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012650,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuffe",
        "r.no_rebind_rbo_rgb565_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012651,
        "dEQP-GLES2.functional.fbo.render.recreate_sten",
        "cilbuffer.no_rebind_rbo_rgb5_a1_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012652,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuffer",
        ".no_rebind_rbo_rgb5_a1_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012653,
        "dEQP-GLES2.functional.fbo.render.recreate_ste",
        "ncilbuffer.no_rebind_rbo_rgba4_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012654,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuffe",
        "r.no_rebind_rbo_rgba4_depth_component16_stencil_index8");
