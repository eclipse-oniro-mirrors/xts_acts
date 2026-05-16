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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012575,
        "dEQP-GLES2.functional.fbo.render.re",
        "create_colorbuffer.rebind_tex2d_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012576,
        "dEQP-GLES2.functional.fbo.render.recreate_",
        "colorbuffer.rebind_tex2d_rgb_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012577,
        "dEQP-GLES2.functional.fbo.render.recreate_co",
        "lorbuffer.rebind_tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012578,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuff",
        "er.rebind_tex2d_rgb_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012579,
        "dEQP-GLES2.functional.fbo.render.re",
        "create_colorbuffer.rebind_tex2d_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012580,
        "dEQP-GLES2.functional.fbo.render.recreate_c",
        "olorbuffer.rebind_tex2d_rgba_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012581,
        "dEQP-GLES2.functional.fbo.render.recreate_co",
        "lorbuffer.rebind_tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012582,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuffe",
        "r.rebind_tex2d_rgba_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012583,
        "dEQP-GLES2.functional.fbo.render.re",
        "create_colorbuffer.rebind_rbo_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012584,
        "dEQP-GLES2.functional.fbo.render.recreate_c",
        "olorbuffer.rebind_rbo_rgb565_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012585,
        "dEQP-GLES2.functional.fbo.render.recreate_co",
        "lorbuffer.rebind_rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012586,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuffe",
        "r.rebind_rbo_rgb565_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012587,
        "dEQP-GLES2.functional.fbo.render.rec",
        "reate_colorbuffer.rebind_rbo_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012588,
        "dEQP-GLES2.functional.fbo.render.recreate_c",
        "olorbuffer.rebind_rbo_rgb5_a1_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012589,
        "dEQP-GLES2.functional.fbo.render.recreate_col",
        "orbuffer.rebind_rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012590,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuffe",
        "r.rebind_rbo_rgb5_a1_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012591,
        "dEQP-GLES2.functional.fbo.render.re",
        "create_colorbuffer.rebind_rbo_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012592,
        "dEQP-GLES2.functional.fbo.render.recreate_",
        "colorbuffer.rebind_rbo_rgba4_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012593,
        "dEQP-GLES2.functional.fbo.render.recreate_co",
        "lorbuffer.rebind_rbo_rgba4_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012594,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuff",
        "er.rebind_rbo_rgba4_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012595,
        "dEQP-GLES2.functional.fbo.render.rec",
        "reate_colorbuffer.no_rebind_tex2d_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012596,
        "dEQP-GLES2.functional.fbo.render.recreate_co",
        "lorbuffer.no_rebind_tex2d_rgb_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012597,
        "dEQP-GLES2.functional.fbo.render.recreate_col",
        "orbuffer.no_rebind_tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012598,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuffer",
        ".no_rebind_tex2d_rgb_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012599,
        "dEQP-GLES2.functional.fbo.render.recr",
        "eate_colorbuffer.no_rebind_tex2d_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012600,
        "dEQP-GLES2.functional.fbo.render.recreate_co",
        "lorbuffer.no_rebind_tex2d_rgba_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012601,
        "dEQP-GLES2.functional.fbo.render.recreate_colo",
        "rbuffer.no_rebind_tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012602,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuffer",
        ".no_rebind_tex2d_rgba_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012603,
        "dEQP-GLES2.functional.fbo.render.recr",
        "eate_colorbuffer.no_rebind_rbo_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012604,
        "dEQP-GLES2.functional.fbo.render.recreate_co",
        "lorbuffer.no_rebind_rbo_rgb565_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012605,
        "dEQP-GLES2.functional.fbo.render.recreate_colo",
        "rbuffer.no_rebind_rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012606,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuffer",
        ".no_rebind_rbo_rgb565_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012607,
        "dEQP-GLES2.functional.fbo.render.recr",
        "eate_colorbuffer.no_rebind_rbo_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012608,
        "dEQP-GLES2.functional.fbo.render.recreate_col",
        "orbuffer.no_rebind_rbo_rgb5_a1_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012609,
        "dEQP-GLES2.functional.fbo.render.recreate_colo",
        "rbuffer.no_rebind_rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012610,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuffer.",
        "no_rebind_rbo_rgb5_a1_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012611,
        "dEQP-GLES2.functional.fbo.render.rec",
        "reate_colorbuffer.no_rebind_rbo_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012612,
        "dEQP-GLES2.functional.fbo.render.recreate_co",
        "lorbuffer.no_rebind_rbo_rgba4_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012613,
        "dEQP-GLES2.functional.fbo.render.recreate_col",
        "orbuffer.no_rebind_rbo_rgba4_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012614,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuffer",
        ".no_rebind_rbo_rgba4_depth_component16_stencil_index8");
