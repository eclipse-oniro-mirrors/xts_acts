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

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000183,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.window.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000184,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.window.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000185,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.window.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000186,
        "dEQP-EGL.functional.query_surface.set",
        "_attribute.window.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000187,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.window.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000188,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.window.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000189,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.window.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000190,
        "dEQP-EGL.functional.query_surface.set",
        "_attribute.window.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000191,
        "dEQP-EGL.functional.query_surface.set_att",
        "ribute.window.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000192,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.window.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000193,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.window.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000194,
        "dEQP-EGL.functional.query_surface.set_",
        "attribute.window.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000195,
        "dEQP-EGL.functional.query_surface.set_att",
        "ribute.window.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000196,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.window.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000197,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.window.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000198,
        "dEQP-EGL.functional.query_surface.set_",
        "attribute.window.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000199,
        "dEQP-EGL.functional.query_surface.set_att",
        "ribute.window.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000200,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.window.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000201,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.window.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000202,
        "dEQP-EGL.functional.query_surface.set_",
        "attribute.window.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000203,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pixmap.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000204,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.pixmap.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000205,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.pixmap.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000206,
        "dEQP-EGL.functional.query_surface.set",
        "_attribute.pixmap.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000207,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pixmap.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000208,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.pixmap.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000209,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.pixmap.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000210,
        "dEQP-EGL.functional.query_surface.set",
        "_attribute.pixmap.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000211,
        "dEQP-EGL.functional.query_surface.set_att",
        "ribute.pixmap.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000212,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pixmap.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000213,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pixmap.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000214,
        "dEQP-EGL.functional.query_surface.set_",
        "attribute.pixmap.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000215,
        "dEQP-EGL.functional.query_surface.set_att",
        "ribute.pixmap.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000216,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pixmap.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000217,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pixmap.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000218,
        "dEQP-EGL.functional.query_surface.set_",
        "attribute.pixmap.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000219,
        "dEQP-EGL.functional.query_surface.set_att",
        "ribute.pixmap.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000220,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pixmap.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000221,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pixmap.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000222,
        "dEQP-EGL.functional.query_surface.set_",
        "attribute.pixmap.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000223,
        "dEQP-EGL.functional.query_surface.set_att",
        "ribute.pbuffer.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000224,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.pbuffer.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000225,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.pbuffer.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000226,
        "dEQP-EGL.functional.query_surface.set_",
        "attribute.pbuffer.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000227,
        "dEQP-EGL.functional.query_surface.set_att",
        "ribute.pbuffer.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000228,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.pbuffer.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000229,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.pbuffer.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000230,
        "dEQP-EGL.functional.query_surface.set_",
        "attribute.pbuffer.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000231,
        "dEQP-EGL.functional.query_surface.set_attr",
        "ibute.pbuffer.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000232,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pbuffer.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000233,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pbuffer.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000234,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.pbuffer.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000235,
        "dEQP-EGL.functional.query_surface.set_attr",
        "ibute.pbuffer.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000236,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pbuffer.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000237,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pbuffer.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000238,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.pbuffer.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000239,
        "dEQP-EGL.functional.query_surface.set_attr",
        "ibute.pbuffer.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000240,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pbuffer.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000241,
        "dEQP-EGL.functional.query_surface.set_at",
        "tribute.pbuffer.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000242,
        "dEQP-EGL.functional.query_surface.set_a",
        "ttribute.pbuffer.rgba8888_depth_stencil");
