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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003034, "dEQP-EGL.functional.sur""faceless_c",
    "ontext.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003035, "dEQP-EGL.functional.sur""faceless",
    "_context.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003036, "dEQP-EGL.functional.sur""faceless",
    "_context.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003037, "dEQP-EGL.functional.sur""faceles",
    "s_context.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003038, "dEQP-EGL.functional.sur""faceless_c",
    "ontext.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003039, "dEQP-EGL.functional.sur""faceless",
    "_context.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003040, "dEQP-EGL.functional.sur""faceless",
    "_context.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003041, "dEQP-EGL.functional.sur""faceles",
    "s_context.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003042, "dEQP-EGL.functional.sur""faceless_co",
    "ntext.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003043, "dEQP-EGL.functional.sur""faceless_",
    "context.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003044, "dEQP-EGL.functional.sur""faceless_",
    "context.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003045, "dEQP-EGL.functional.sur""faceless",
    "_context.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003046, "dEQP-EGL.functional.sur""faceless_co",
    "ntext.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003047, "dEQP-EGL.functional.sur""faceless_",
    "context.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003048, "dEQP-EGL.functional.sur""faceless_",
    "context.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003049, "dEQP-EGL.functional.sur""faceless",
    "_context.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003050, "dEQP-EGL.functional.sur""faceless_co",
    "ntext.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003051, "dEQP-EGL.functional.sur""faceless_",
    "context.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003052, "dEQP-EGL.functional.sur""faceless_",
    "context.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003053, "dEQP-EGL.functional.sur""faceless",
    "_context.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003054, "dEQP-EGL.functional.sur""faceless",
    "_context.other");
