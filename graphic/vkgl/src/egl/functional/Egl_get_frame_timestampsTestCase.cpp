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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003634, "dEQP-EGL.functional.get_frame_tim",
    "estamps.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003635, "dEQP-EGL.functional.get_frame_ti",
    "mestamps.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003636, "dEQP-EGL.functional.get_frame_ti",
    "mestamps.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003637, "dEQP-EGL.functional.get_frame_",
    "timestamps.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003638, "dEQP-EGL.functional.get_frame_tim",
    "estamps.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003639, "dEQP-EGL.functional.get_frame_ti",
    "mestamps.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003640, "dEQP-EGL.functional.get_frame_ti",
    "mestamps.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003641, "dEQP-EGL.functional.get_frame_",
    "timestamps.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003642, "dEQP-EGL.functional.get_frame_time",
    "stamps.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003643, "dEQP-EGL.functional.get_frame_tim",
    "estamps.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003644, "dEQP-EGL.functional.get_frame_tim",
    "estamps.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003645, "dEQP-EGL.functional.get_frame_t",
    "imestamps.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003646, "dEQP-EGL.functional.get_frame_time",
    "stamps.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003647, "dEQP-EGL.functional.get_frame_tim",
    "estamps.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003648, "dEQP-EGL.functional.get_frame_tim",
    "estamps.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003649, "dEQP-EGL.functional.get_frame_t",
    "imestamps.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003650, "dEQP-EGL.functional.get_frame_time",
    "stamps.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003651, "dEQP-EGL.functional.get_frame_tim",
    "estamps.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003652, "dEQP-EGL.functional.get_frame_tim",
    "estamps.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003653, "dEQP-EGL.functional.get_frame_t",
    "imestamps.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003654, "dEQP-EGL.functional.get_frame_time",
    "stamps.other");
