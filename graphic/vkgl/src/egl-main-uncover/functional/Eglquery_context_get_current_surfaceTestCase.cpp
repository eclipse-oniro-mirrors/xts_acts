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

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000001,
        "dEQP-EGL.functional.query_context",
        ".get_current_surface.rgb565_window");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000002,
        "dEQP-EGL.functional.query_context",
        ".get_current_surface.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000003,
        "dEQP-EGL.functional.query_context.",
        "get_current_surface.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000004,
        "dEQP-EGL.functional.query_context",
        ".get_current_surface.rgb888_window");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000005,
        "dEQP-EGL.functional.query_context",
        ".get_current_surface.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000006,
        "dEQP-EGL.functional.query_context.",
        "get_current_surface.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000007,
        "dEQP-EGL.functional.query_context.",
        "get_current_surface.rgba4444_window");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000008,
        "dEQP-EGL.functional.query_context.",
        "get_current_surface.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000009,
        "dEQP-EGL.functional.query_context.g",
        "et_current_surface.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000010,
        "dEQP-EGL.functional.query_context.",
        "get_current_surface.rgba5551_window");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000011,
        "dEQP-EGL.functional.query_context.",
        "get_current_surface.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000012,
        "dEQP-EGL.functional.query_context.g",
        "et_current_surface.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000013,
        "dEQP-EGL.functional.query_context.",
        "get_current_surface.rgba8888_window");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000014,
        "dEQP-EGL.functional.query_context.",
        "get_current_surface.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000015,
        "dEQP-EGL.functional.query_context.g",
        "et_current_surface.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000016,
        "dEQP-EGL.functional.query_con",
        "text.get_current_surface.other");
