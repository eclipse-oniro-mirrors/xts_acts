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

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000099,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_pixmap.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000100,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_pixmap.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000101,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_pixmap.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000102,
        "dEQP-EGL.functional.create_surface.",
        "platform_pixmap.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000103,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_pixmap.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000104,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_pixmap.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000105,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_pixmap.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000106,
        "dEQP-EGL.functional.create_surface.",
        "platform_pixmap.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000107,
        "dEQP-EGL.functional.create_surface.plat",
        "form_pixmap.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000108,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_pixmap.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000109,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_pixmap.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000110,
        "dEQP-EGL.functional.create_surface.p",
        "latform_pixmap.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000111,
        "dEQP-EGL.functional.create_surface.plat",
        "form_pixmap.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000112,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_pixmap.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000113,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_pixmap.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000114,
        "dEQP-EGL.functional.create_surface.p",
        "latform_pixmap.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000115,
        "dEQP-EGL.functional.create_surface.plat",
        "form_pixmap.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000116,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_pixmap.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000117,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_pixmap.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000118,
        "dEQP-EGL.functional.create_surface.p",
        "latform_pixmap.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000119,
        "dEQP-EGL.functional.create_s",
        "urface.platform_pixmap.other");
