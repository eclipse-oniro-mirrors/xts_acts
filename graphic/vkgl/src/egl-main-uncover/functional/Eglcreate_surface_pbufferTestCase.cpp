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

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000027,
        "dEQP-EGL.functional.create_surface",
        ".pbuffer.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000028,
        "dEQP-EGL.functional.create_surface",
        ".pbuffer.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000029,
        "dEQP-EGL.functional.create_surface.",
        "pbuffer.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000030,
        "dEQP-EGL.functional.create_surface",
        ".pbuffer.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000031,
        "dEQP-EGL.functional.create_surface",
        ".pbuffer.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000032,
        "dEQP-EGL.functional.create_surface.",
        "pbuffer.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000033,
        "dEQP-EGL.functional.create_surface",
        ".pbuffer.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000034,
        "dEQP-EGL.functional.create_surface",
        ".pbuffer.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000035,
        "dEQP-EGL.functional.create_surface.",
        "pbuffer.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000036,
        "dEQP-EGL.functional.create_surface",
        ".pbuffer.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000037,
        "dEQP-EGL.functional.create_surface",
        ".pbuffer.rgba8888_depth_no_stencil");
