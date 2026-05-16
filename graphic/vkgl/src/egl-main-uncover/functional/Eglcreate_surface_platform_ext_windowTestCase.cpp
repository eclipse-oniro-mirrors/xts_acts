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

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000038,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_window.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000039,
        "dEQP-EGL.functional.create_surface.plat",
        "form_ext_window.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000040,
        "dEQP-EGL.functional.create_surface.plat",
        "form_ext_window.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000041,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_ext_window.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000042,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_window.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000043,
        "dEQP-EGL.functional.create_surface.plat",
        "form_ext_window.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000044,
        "dEQP-EGL.functional.create_surface.plat",
        "form_ext_window.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000045,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_ext_window.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000046,
        "dEQP-EGL.functional.create_surface.platfo",
        "rm_ext_window.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000047,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_window.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000048,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_window.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000049,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_ext_window.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000050,
        "dEQP-EGL.functional.create_surface.platfo",
        "rm_ext_window.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000051,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_window.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000052,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_window.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000053,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_ext_window.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000054,
        "dEQP-EGL.functional.create_surface.platfo",
        "rm_ext_window.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000055,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_window.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000056,
        "dEQP-EGL.functional.create_surface.platf",
        "orm_ext_window.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000057,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_ext_window.rgba8888_depth_stencil");
