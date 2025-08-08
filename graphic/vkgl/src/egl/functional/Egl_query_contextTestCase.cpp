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
#include "../ActsEgl0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000028, "dEQP-EGL.functional.query_context",
    ".simple.query_api");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000029, "dEQP-EGL.functional.query_context",
    ".get_current_context.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000030, "dEQP-EGL.functional.query_context",
    ".get_current_context.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000031, "dEQP-EGL.functional.query_context.",
    "get_current_context.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000032, "dEQP-EGL.functional.query_context",
    ".get_current_context.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000033, "dEQP-EGL.functional.query_context",
    ".get_current_context.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000034, "dEQP-EGL.functional.query_context.",
    "get_current_context.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000035, "dEQP-EGL.functional.query_context.",
    "get_current_context.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000036, "dEQP-EGL.functional.query_context.",
    "get_current_context.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000037, "dEQP-EGL.functional.query_context.g",
    "et_current_context.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000038, "dEQP-EGL.functional.query_context.",
    "get_current_context.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000039, "dEQP-EGL.functional.query_context.",
    "get_current_context.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000040, "dEQP-EGL.functional.query_context.g",
    "et_current_context.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000041, "dEQP-EGL.functional.query_context.",
    "get_current_context.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000042, "dEQP-EGL.functional.query_context.",
    "get_current_context.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000043, "dEQP-EGL.functional.query_context.g",
    "et_current_context.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000044, "dEQP-EGL.functional.query_context.g",
    "et_current_context.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000045, "dEQP-EGL.functional.query_context",
    ".get_current_sur""face.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000046, "dEQP-EGL.functional.query_context",
    ".get_current_sur""face.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000047, "dEQP-EGL.functional.query_context.",
    "get_current_sur""face.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000048, "dEQP-EGL.functional.query_context",
    ".get_current_sur""face.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000049, "dEQP-EGL.functional.query_context",
    ".get_current_sur""face.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000050, "dEQP-EGL.functional.query_context.",
    "get_current_sur""face.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000051, "dEQP-EGL.functional.query_context.",
    "get_current_sur""face.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000052, "dEQP-EGL.functional.query_context.",
    "get_current_sur""face.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000053, "dEQP-EGL.functional.query_context.g",
    "et_current_sur""face.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000054, "dEQP-EGL.functional.query_context.",
    "get_current_sur""face.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000055, "dEQP-EGL.functional.query_context.",
    "get_current_sur""face.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000056, "dEQP-EGL.functional.query_context.g",
    "et_current_sur""face.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000057, "dEQP-EGL.functional.query_context.",
    "get_current_sur""face.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000058, "dEQP-EGL.functional.query_context.",
    "get_current_sur""face.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000059, "dEQP-EGL.functional.query_context.g",
    "et_current_sur""face.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000060, "dEQP-EGL.functional.query_context.g",
    "et_current_sur""face.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000061, "dEQP-EGL.functional.query_context",
    ".get_current_display.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000062, "dEQP-EGL.functional.query_context",
    ".get_current_display.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000063, "dEQP-EGL.functional.query_context.",
    "get_current_display.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000064, "dEQP-EGL.functional.query_context",
    ".get_current_display.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000065, "dEQP-EGL.functional.query_context",
    ".get_current_display.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000066, "dEQP-EGL.functional.query_context.",
    "get_current_display.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000067, "dEQP-EGL.functional.query_context.",
    "get_current_display.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000068, "dEQP-EGL.functional.query_context.",
    "get_current_display.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000069, "dEQP-EGL.functional.query_context.g",
    "et_current_display.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000070, "dEQP-EGL.functional.query_context.",
    "get_current_display.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000071, "dEQP-EGL.functional.query_context.",
    "get_current_display.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000072, "dEQP-EGL.functional.query_context.g",
    "et_current_display.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000073, "dEQP-EGL.functional.query_context.",
    "get_current_display.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000074, "dEQP-EGL.functional.query_context.",
    "get_current_display.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000075, "dEQP-EGL.functional.query_context.g",
    "et_current_display.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000076, "dEQP-EGL.functional.query_context.g",
    "et_current_display.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000077, "dEQP-EGL.functional.query_cont",
    "ext.query_context.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000078, "dEQP-EGL.functional.query_cont",
    "ext.query_context.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000079, "dEQP-EGL.functional.query_conte",
    "xt.query_context.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000080, "dEQP-EGL.functional.query_cont",
    "ext.query_context.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000081, "dEQP-EGL.functional.query_cont",
    "ext.query_context.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000082, "dEQP-EGL.functional.query_conte",
    "xt.query_context.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000083, "dEQP-EGL.functional.query_conte",
    "xt.query_context.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000084, "dEQP-EGL.functional.query_conte",
    "xt.query_context.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000085, "dEQP-EGL.functional.query_contex",
    "t.query_context.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000086, "dEQP-EGL.functional.query_conte",
    "xt.query_context.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000087, "dEQP-EGL.functional.query_conte",
    "xt.query_context.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000088, "dEQP-EGL.functional.query_contex",
    "t.query_context.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000089, "dEQP-EGL.functional.query_conte",
    "xt.query_context.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000090, "dEQP-EGL.functional.query_conte",
    "xt.query_context.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000091, "dEQP-EGL.functional.query_contex",
    "t.query_context.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000092, "dEQP-EGL.functional.query_contex",
    "t.query_context.other");
