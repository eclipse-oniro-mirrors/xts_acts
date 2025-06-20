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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003055, "dEQP-EGL.functional.swap_buffers.rgb56",
    "5_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003056, "dEQP-EGL.functional.swap_buffers.rgb56",
    "5_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003057, "dEQP-EGL.functional.swap_buffers.rgb56",
    "5_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003058, "dEQP-EGL.functional.swap_buffers.rgb56",
    "5_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003059, "dEQP-EGL.functional.swap_buffers.rgb8",
    "88_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003060, "dEQP-EGL.functional.swap_buffers.rgb8",
    "88_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003061, "dEQP-EGL.functional.swap_buffers.rgb8",
    "88_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003062, "dEQP-EGL.functional.swap_buffers.rgb",
    "888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003063, "dEQP-EGL.functional.swap_buffe",
    "rs.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003064, "dEQP-EGL.functional.swap_buffers.rgba4",
    "444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003065, "dEQP-EGL.functional.swap_buffers.rgba44",
    "44_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003066, "dEQP-EGL.functional.swap_buffers.rgba44",
    "44_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003067, "dEQP-EGL.functional.swap_buffe",
    "rs.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003068, "dEQP-EGL.functional.swap_buffers.rgba55",
    "51_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003069, "dEQP-EGL.functional.swap_buffers.rgba55",
    "51_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003070, "dEQP-EGL.functional.swap_buffers.rgba55",
    "51_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003071, "dEQP-EGL.functional.swap_buffe",
    "rs.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003072, "dEQP-EGL.functional.swap_buffers.rgba88",
    "88_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003073, "dEQP-EGL.functional.swap_buffers.rgba88",
    "88_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003074, "dEQP-EGL.functional.swap_buffers.rgba88",
    "88_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003075, "dEQP-EGL.functional.swap_buffe",
    "rs.other");
