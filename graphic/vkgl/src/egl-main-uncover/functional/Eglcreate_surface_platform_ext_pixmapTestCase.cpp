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

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000058,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_pixmap.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000059,
        "dEQP-EGL.functional.create_surface.plat",
        "form_ext_pixmap.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000060,
        "dEQP-EGL.functional.create_surface.plat",
        "form_ext_pixmap.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000061,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_ext_pixmap.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000062,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_pixmap.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000063,
        "dEQP-EGL.functional.create_surface.plat",
        "form_ext_pixmap.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000064,
        "dEQP-EGL.functional.create_surface.plat",
        "form_ext_pixmap.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000065,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_ext_pixmap.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000066,
        "dEQP-EGL.functional.create_surface.platfo",
        "rm_ext_pixmap.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000067,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_pixmap.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000068,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_pixmap.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000069,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_ext_pixmap.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000070,
        "dEQP-EGL.functional.create_surface.platfo",
        "rm_ext_pixmap.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000071,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_pixmap.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000072,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_pixmap.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000073,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_ext_pixmap.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000074,
        "dEQP-EGL.functional.create_surface.platfo",
        "rm_ext_pixmap.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000075,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_pixmap.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000076,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_pixmap.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000077,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_ext_pixmap.rgba8888_depth_stencil");
