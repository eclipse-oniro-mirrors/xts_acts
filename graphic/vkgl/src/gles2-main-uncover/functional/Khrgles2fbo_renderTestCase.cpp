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
#include "../Khrgles2BaseFunc.h"
#include "../ActsGles2MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000553,
        "dEQP-GLES2.functional.fbo.r",
        "ender.color_clear.tex2d_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000554,
        "dEQP-GLES2.functional.fbo.render.co",
        "lor_clear.tex2d_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000555,
        "dEQP-GLES2.functional.fbo.render.col",
        "or_clear.tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000556,
        "dEQP-GLES2.functional.fbo.render.color_clear",
        ".tex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000557,
        "dEQP-GLES2.functional.fbo.",
        "render.color_clear.rbo_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000558,
        "dEQP-GLES2.functional.fbo.render.c",
        "olor_clear.rbo_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000559,
        "dEQP-GLES2.functional.fbo.render.co",
        "lor_clear.rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000560,
        "dEQP-GLES2.functional.fbo.render.color_clea",
        "r.rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000561,
        "dEQP-GLES2.functional.fbo.render.ste",
        "ncil_clear.tex2d_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000562,
        "dEQP-GLES2.functional.fbo.render.stencil_clea",
        "r.tex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000563,
        "dEQP-GLES2.functional.fbo.render.st",
        "encil_clear.rbo_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000564,
        "dEQP-GLES2.functional.fbo.render.stencil_cle",
        "ar.rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000565,
        "dEQP-GLES2.functional.fbo.",
        "render.color.mix_tex2d_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000566,
        "dEQP-GLES2.functional.fbo.render.co",
        "lor.mix_tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000567,
        "dEQP-GLES2.functional.fbo.ren",
        "der.color.mix_npot_tex2d_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000568,
        "dEQP-GLES2.functional.fbo.render.color",
        ".mix_npot_tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000569,
        "dEQP-GLES2.functional.fbo.r",
        "ender.color.blend_tex2d_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000570,
        "dEQP-GLES2.functional.fbo.render.col",
        "or.blend_tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000571,
        "dEQP-GLES2.functional.fbo.",
        "render.color.blend_rbo_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000572,
        "dEQP-GLES2.functional.fbo.render.co",
        "lor.blend_rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000573,
        "dEQP-GLES2.functional.fbo.rend",
        "er.color.blend_npot_tex2d_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000574,
        "dEQP-GLES2.functional.fbo.render.color.",
        "blend_npot_tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000575,
        "dEQP-GLES2.functional.fbo.ren",
        "der.color.blend_npot_rbo_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000576,
        "dEQP-GLES2.functional.fbo.render.color",
        ".blend_npot_rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000577,
        "dEQP-GLES2.functional.fbo.render.",
        "depth.tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000578,
        "dEQP-GLES2.functional.fbo.render",
        ".depth.rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000579,
        "dEQP-GLES2.functional.fbo.render.dep",
        "th.npot_tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000580,
        "dEQP-GLES2.functional.fbo.render.de",
        "pth.npot_rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000581,
        "dEQP-GLES2.functional.fbo.render.",
        "stencil.tex2d_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000582,
        "dEQP-GLES2.functional.fbo.render.stencil.t",
        "ex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000583,
        "dEQP-GLES2.functional.fbo.render",
        ".stencil.rbo_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000584,
        "dEQP-GLES2.functional.fbo.render.stencil.",
        "rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000585,
        "dEQP-GLES2.functional.fbo.render.st",
        "encil.npot_tex2d_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000586,
        "dEQP-GLES2.functional.fbo.render.stencil.npo",
        "t_tex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000587,
        "dEQP-GLES2.functional.fbo.render.s",
        "tencil.npot_rbo_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000588,
        "dEQP-GLES2.functional.fbo.render.stencil.np",
        "ot_rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000589,
        "dEQP-GLES2.functional.fbo.render.s",
        "hared_colorbuffer_clear.tex2d_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000590,
        "dEQP-GLES2.functional.fbo.render.",
        "shared_colorbuffer_clear.rbo_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000591,
        "dEQP-GLES2.functional.fbo.rende",
        "r.shared_colorbuffer.tex2d_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000592,
        "dEQP-GLES2.functional.fbo.render.share",
        "d_colorbuffer.tex2d_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000593,
        "dEQP-GLES2.functional.fbo.render.shared_",
        "colorbuffer.tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000594,
        "dEQP-GLES2.functional.fbo.render.shared_colorbu",
        "ffer.tex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000595,
        "dEQP-GLES2.functional.fbo.rend",
        "er.shared_colorbuffer.rbo_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000596,
        "dEQP-GLES2.functional.fbo.render.shar",
        "ed_colorbuffer.rbo_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000597,
        "dEQP-GLES2.functional.fbo.render.shared",
        "_colorbuffer.rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000598,
        "dEQP-GLES2.functional.fbo.render.shared_colorb",
        "uffer.rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000599,
        "dEQP-GLES2.functional.fbo.render.shared_",
        "depthbuffer.tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000600,
        "dEQP-GLES2.functional.fbo.render.shared_depthbu",
        "ffer.tex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000601,
        "dEQP-GLES2.functional.fbo.render.shared",
        "_depthbuffer.rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000602,
        "dEQP-GLES2.functional.fbo.render.shared_depthb",
        "uffer.rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000603,
        "dEQP-GLES2.functional.fbo",
        ".render.resize.tex2d_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000604,
        "dEQP-GLES2.functional.fbo.render",
        ".resize.tex2d_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000605,
        "dEQP-GLES2.functional.fbo.render.r",
        "esize.tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000606,
        "dEQP-GLES2.functional.fbo.render.resize.t",
        "ex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000607,
        "dEQP-GLES2.functional.fb",
        "o.render.resize.rbo_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000608,
        "dEQP-GLES2.functional.fbo.rende",
        "r.resize.rbo_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000609,
        "dEQP-GLES2.functional.fbo.render.",
        "resize.rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000610,
        "dEQP-GLES2.functional.fbo.render.resize.",
        "rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000611,
        "dEQP-GLES2.functional.fbo.render.re",
        "create_colorbuffer.rebind_tex2d_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000612,
        "dEQP-GLES2.functional.fbo.render.recreate_c",
        "olorbuffer.rebind_tex2d_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000613,
        "dEQP-GLES2.functional.fbo.render.recreate_co",
        "lorbuffer.rebind_tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000614,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuffe",
        "r.rebind_tex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000615,
        "dEQP-GLES2.functional.fbo.render.r",
        "ecreate_colorbuffer.rebind_rbo_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000616,
        "dEQP-GLES2.functional.fbo.render.recreate_",
        "colorbuffer.rebind_rbo_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000617,
        "dEQP-GLES2.functional.fbo.render.recreate_c",
        "olorbuffer.rebind_rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000618,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuff",
        "er.rebind_rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000619,
        "dEQP-GLES2.functional.fbo.render.recr",
        "eate_colorbuffer.no_rebind_tex2d_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000620,
        "dEQP-GLES2.functional.fbo.render.recreate_co",
        "lorbuffer.no_rebind_tex2d_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000621,
        "dEQP-GLES2.functional.fbo.render.recreate_colo",
        "rbuffer.no_rebind_tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000622,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuffer",
        ".no_rebind_tex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000623,
        "dEQP-GLES2.functional.fbo.render.rec",
        "reate_colorbuffer.no_rebind_rbo_bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000624,
        "dEQP-GLES2.functional.fbo.render.recreate_c",
        "olorbuffer.no_rebind_rbo_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000625,
        "dEQP-GLES2.functional.fbo.render.recreate_col",
        "orbuffer.no_rebind_rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000626,
        "dEQP-GLES2.functional.fbo.render.recreate_colorbuffe",
        "r.no_rebind_rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000627,
        "dEQP-GLES2.functional.fbo.render.recreate_de",
        "pthbuffer.rebind_tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000628,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuffe",
        "r.rebind_tex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000629,
        "dEQP-GLES2.functional.fbo.render.recreate_d",
        "epthbuffer.rebind_rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000630,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuff",
        "er.rebind_rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000631,
        "dEQP-GLES2.functional.fbo.render.recreate_dept",
        "hbuffer.no_rebind_tex2d_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000632,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuffer",
        ".no_rebind_tex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000633,
        "dEQP-GLES2.functional.fbo.render.recreate_dep",
        "thbuffer.no_rebind_rbo_bgra_depth_component16");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000634,
        "dEQP-GLES2.functional.fbo.render.recreate_depthbuffe",
        "r.no_rebind_rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000635,
        "dEQP-GLES2.functional.fbo.render.recreate_st",
        "encilbuffer.rebind_tex2d_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000636,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuff",
        "er.rebind_tex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000637,
        "dEQP-GLES2.functional.fbo.render.recreate_s",
        "tencilbuffer.rebind_rbo_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000638,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuf",
        "fer.rebind_rbo_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000639,
        "dEQP-GLES2.functional.fbo.render.recreate_ste",
        "ncilbuffer.no_rebind_tex2d_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000640,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuffe",
        "r.no_rebind_tex2d_bgra_depth_component16_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000641,
        "dEQP-GLES2.functional.fbo.render.recreate_st",
        "encilbuffer.no_rebind_rbo_bgra_stencil_index8");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000642,
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuff",
        "er.no_rebind_rbo_bgra_depth_component16_stencil_index8");
