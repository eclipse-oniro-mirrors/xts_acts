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
#include "../EglBaseFunc.h"
#include "../ActsEglMainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000120,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.window.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000121,
        "dEQP-EGL.functional.query_surface.s",
        "imple.window.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000122,
        "dEQP-EGL.functional.query_surface.s",
        "imple.window.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000123,
        "dEQP-EGL.functional.query_surface.",
        "simple.window.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000124,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.window.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000125,
        "dEQP-EGL.functional.query_surface.s",
        "imple.window.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000126,
        "dEQP-EGL.functional.query_surface.s",
        "imple.window.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000127,
        "dEQP-EGL.functional.query_surface.",
        "simple.window.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000128,
        "dEQP-EGL.functional.query_surface.simp",
        "le.window.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000129,
        "dEQP-EGL.functional.query_surface.si",
        "mple.window.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000130,
        "dEQP-EGL.functional.query_surface.si",
        "mple.window.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000131,
        "dEQP-EGL.functional.query_surface.s",
        "imple.window.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000132,
        "dEQP-EGL.functional.query_surface.simp",
        "le.window.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000133,
        "dEQP-EGL.functional.query_surface.si",
        "mple.window.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000134,
        "dEQP-EGL.functional.query_surface.si",
        "mple.window.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000135,
        "dEQP-EGL.functional.query_surface.s",
        "imple.window.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000136,
        "dEQP-EGL.functional.query_surface.simp",
        "le.window.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000137,
        "dEQP-EGL.functional.query_surface.si",
        "mple.window.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000138,
        "dEQP-EGL.functional.query_surface.si",
        "mple.window.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000139,
        "dEQP-EGL.functional.query_surface.s",
        "imple.window.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000140,
        "dEQP-EGL.functional.query_",
        "surface.simple.window.other");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000141,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.pixmap.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000142,
        "dEQP-EGL.functional.query_surface.s",
        "imple.pixmap.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000143,
        "dEQP-EGL.functional.query_surface.s",
        "imple.pixmap.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000144,
        "dEQP-EGL.functional.query_surface.",
        "simple.pixmap.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000145,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.pixmap.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000146,
        "dEQP-EGL.functional.query_surface.s",
        "imple.pixmap.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000147,
        "dEQP-EGL.functional.query_surface.s",
        "imple.pixmap.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000148,
        "dEQP-EGL.functional.query_surface.",
        "simple.pixmap.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000149,
        "dEQP-EGL.functional.query_surface.simp",
        "le.pixmap.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000150,
        "dEQP-EGL.functional.query_surface.si",
        "mple.pixmap.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000151,
        "dEQP-EGL.functional.query_surface.si",
        "mple.pixmap.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000152,
        "dEQP-EGL.functional.query_surface.s",
        "imple.pixmap.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000153,
        "dEQP-EGL.functional.query_surface.simp",
        "le.pixmap.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000154,
        "dEQP-EGL.functional.query_surface.si",
        "mple.pixmap.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000155,
        "dEQP-EGL.functional.query_surface.si",
        "mple.pixmap.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000156,
        "dEQP-EGL.functional.query_surface.s",
        "imple.pixmap.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000157,
        "dEQP-EGL.functional.query_surface.simp",
        "le.pixmap.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000158,
        "dEQP-EGL.functional.query_surface.si",
        "mple.pixmap.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000159,
        "dEQP-EGL.functional.query_surface.si",
        "mple.pixmap.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000160,
        "dEQP-EGL.functional.query_surface.s",
        "imple.pixmap.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000161,
        "dEQP-EGL.functional.query_",
        "surface.simple.pixmap.other");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000162,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.pbuffer.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000163,
        "dEQP-EGL.functional.query_surface.si",
        "mple.pbuffer.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000164,
        "dEQP-EGL.functional.query_surface.si",
        "mple.pbuffer.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000165,
        "dEQP-EGL.functional.query_surface.",
        "simple.pbuffer.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000166,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.pbuffer.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000167,
        "dEQP-EGL.functional.query_surface.si",
        "mple.pbuffer.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000168,
        "dEQP-EGL.functional.query_surface.si",
        "mple.pbuffer.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000169,
        "dEQP-EGL.functional.query_surface.",
        "simple.pbuffer.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000170,
        "dEQP-EGL.functional.query_surface.simp",
        "le.pbuffer.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000171,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.pbuffer.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000172,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.pbuffer.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000173,
        "dEQP-EGL.functional.query_surface.s",
        "imple.pbuffer.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000174,
        "dEQP-EGL.functional.query_surface.simp",
        "le.pbuffer.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000175,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.pbuffer.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000176,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.pbuffer.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000177,
        "dEQP-EGL.functional.query_surface.s",
        "imple.pbuffer.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000178,
        "dEQP-EGL.functional.query_surface.simp",
        "le.pbuffer.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000179,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.pbuffer.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000180,
        "dEQP-EGL.functional.query_surface.sim",
        "ple.pbuffer.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000181,
        "dEQP-EGL.functional.query_surface.s",
        "imple.pbuffer.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000182,
        "dEQP-EGL.functional.query_s",
        "urface.simple.pbuffer.other");
