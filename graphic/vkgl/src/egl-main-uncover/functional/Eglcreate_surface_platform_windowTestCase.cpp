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

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000078,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_window.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000079,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_window.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000080,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_window.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000081,
        "dEQP-EGL.functional.create_surface.",
        "platform_window.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000082,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_window.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000083,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_window.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000084,
        "dEQP-EGL.functional.create_surface.pl",
        "atform_window.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000085,
        "dEQP-EGL.functional.create_surface.",
        "platform_window.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000086,
        "dEQP-EGL.functional.create_surface.plat",
        "form_window.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000087,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_window.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000088,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_window.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000089,
        "dEQP-EGL.functional.create_surface.p",
        "latform_window.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000090,
        "dEQP-EGL.functional.create_surface.plat",
        "form_window.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000091,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_window.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000092,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_window.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000093,
        "dEQP-EGL.functional.create_surface.p",
        "latform_window.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000094,
        "dEQP-EGL.functional.create_surface.plat",
        "form_window.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000095,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_window.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000096,
        "dEQP-EGL.functional.create_surface.pla",
        "tform_window.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000097,
        "dEQP-EGL.functional.create_surface.p",
        "latform_window.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000098,
        "dEQP-EGL.functional.create_s",
        "urface.platform_window.other");
