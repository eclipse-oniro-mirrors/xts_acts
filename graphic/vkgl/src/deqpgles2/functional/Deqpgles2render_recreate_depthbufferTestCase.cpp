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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012615,
        "dEQP-GLES2.functional.fbo.render.recreate_de",
        "pthbuffer.rebind_tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012616,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuff",
        "er.rebind_tex2d_rgb_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012617,
        "dEQP-GLES2.functional.fbo.render.recreate_de",
        "pthbuffer.rebind_tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012618,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuffe",
        "r.rebind_tex2d_rgba_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012619,
        "dEQP-GLES2.functional.fbo.render.recreate_de",
        "pthbuffer.rebind_rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012620,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuffe",
        "r.rebind_rbo_rgb565_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012621,
        "dEQP-GLES2.functional.fbo.render.recreate_dep",
        "thbuffer.rebind_rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012622,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuffe",
        "r.rebind_rbo_rgb5_a1_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012623,
        "dEQP-GLES2.functional.fbo.render.recreate_de",
        "pthbuffer.rebind_rbo_rgba4_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012624,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuff",
        "er.rebind_rbo_rgba4_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012625,
        "dEQP-GLES2.functional.fbo.render.recreate_dep",
        "thbuffer.no_rebind_tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012626,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuffer",
        ".no_rebind_tex2d_rgb_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012627,
        "dEQP-GLES2.functional.fbo.render.recreate_dept",
        "hbuffer.no_rebind_tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012628,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuffer",
        ".no_rebind_tex2d_rgba_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012629,
        "dEQP-GLES2.functional.fbo.render.recreate_dept",
        "hbuffer.no_rebind_rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012630,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuffer",
        ".no_rebind_rbo_rgb565_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012631,
        "dEQP-GLES2.functional.fbo.render.recreate_dept",
        "hbuffer.no_rebind_rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012632,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuffer.",
        "no_rebind_rbo_rgb5_a1_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012633,
        "dEQP-GLES2.functional.fbo.render.recreate_dep",
        "thbuffer.no_rebind_rbo_rgba4_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012634,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuffer",
        ".no_rebind_rbo_rgba4_depth_component16_stencil_index8");
